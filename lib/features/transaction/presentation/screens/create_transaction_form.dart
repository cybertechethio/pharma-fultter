import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/snacks/info_snack_bar.dart';
import '../../../../core/services/snackbar_service.dart';
import '../providers/form/transaction_form_notifier.dart';
import '../providers/transaction_events.dart';
import '../widgets/transaction_flow_header.dart';
import '../widgets/customer_supplier_dropdown.dart';
import '../widgets/transaction_type_dialog.dart';
import '../widgets/cart_dialog.dart';
import '../widgets/cart_items_list.dart';
import '../widgets/transaction_attachments_list.dart';
import '../widgets/payment_method_dialog.dart';
import '../widgets/transaction_payment_methods_list.dart';
import '../widgets/transaction_order_bottom_sheet.dart';

class CreateTransactionForm extends ConsumerStatefulWidget {
  const CreateTransactionForm({super.key});

  @override
  ConsumerState<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends ConsumerState<CreateTransactionForm> {
  TransactionFlowStep _currentStep = TransactionFlowStep.type;
  final ImagePicker _picker = ImagePicker();

  void _showTypeSelector() async {
    final formState = ref.read(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    
    final selectedType = await TransactionTypeDialog.show(
      context: context,
      selectedType: formState.request.transactionType,
    );
    
    if (selectedType != null) {
      formNotifier.setTransactionType(selectedType);
      // Move to next step if type is selected
      if (_currentStep == TransactionFlowStep.type) {
        setState(() {
          _currentStep = TransactionFlowStep.items;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    
    final itemCount = formNotifier.getCartItemCount();
    final attachmentCount = formState.receiptFilePaths.length;
    final paymentMethodCount = formState.request.paymentMethods?.length ?? 0;

    // Listen to UI events for user feedback and navigation
    ref.listen<TransactionUiEvent?>(
      transactionUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is TransactionFailure) {
          snackbar.showError(next.failure);
        } else if (next is TransactionCreated) {
          snackbar.showSuccess(next.message);
          // Reset form and navigate back
          if (mounted) {
            formNotifier.reset();
            context.pop();
          }
        }
        ref.read(transactionUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.newTransaction,
      ),
      body: Column(
        children: [
          TransactionFlowHeader(
            currentStep: _currentStep,
            selectedType: formState.request.transactionType,
            itemCount: itemCount,
            attachmentCount: attachmentCount,
            paymentMethodCount: paymentMethodCount,
            onTypeTap: _showTypeSelector,
            onItemsTap: () {
              CartDialog.show(context);
            },
            onAttachmentsTap: () {
              _pickImages(context);
            },
            onPaymentMethodsTap: () {
              _showPaymentMethodDialog();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer/Supplier Dropdown (only for sale/purchase)
                  const CustomerSupplierDropdown(),
                  const SizedBox(height: AppSizes.lg),
                  // Display cart items
                  const CartItemsList(),
                  SizedBox(height: AppSizes.lg),
                  // Display attachments
                  const TransactionAttachmentsList(),
                  SizedBox(height: AppSizes.lg),
                  // Display payment methods
                  const TransactionPaymentMethodsList(),
                  const SizedBox(height: AppSizes.scrollContentMinHeight),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const TransactionOrderBottomSheet(),
    );
  }

  Future<void> _pickImages(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (images.isNotEmpty) {
        final formNotifier = ref.read(transactionFormProvider.notifier);
        for (final image in images) {
          formNotifier.addReceipt(image.path);
        }
      }
    } catch (e) {
      if (mounted) {
        InfoSnackBar.show(context, message: l10n.errorPickingImages(e.toString()));
      }
    }
  }

  Future<void> _showPaymentMethodDialog() async {
    final formState = ref.read(transactionFormProvider);
    final paymentMethod = await PaymentMethodDialog.show(
      context,
      existingPaymentMethods: formState.request.paymentMethods,
    );
    if (paymentMethod != null && mounted) {
      final formNotifier = ref.read(transactionFormProvider.notifier);
      formNotifier.addPaymentMethod(paymentMethod);
    }
  }
}