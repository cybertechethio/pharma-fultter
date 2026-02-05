import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../core/services/snackbar_service.dart';
import '../providers/form/transfer_form_notifier.dart';
import '../providers/transfer_events.dart';
import '../widgets/transfer_branch_dropdown.dart';
import '../widgets/transfer_cart_dialog.dart';
import '../widgets/transfer_cart_items_list.dart';
import '../widgets/transfer_bottom_sheet.dart';

class CreateTransferScreen extends ConsumerStatefulWidget {
  const CreateTransferScreen({super.key});

  @override
  ConsumerState<CreateTransferScreen> createState() => _CreateTransferScreenState();
}

class _CreateTransferScreenState extends ConsumerState<CreateTransferScreen> {
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to notes changes
    _notesController.addListener(() {
      ref.read(transferFormProvider.notifier).setNotes(_notesController.text);
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transferFormProvider);
    final formNotifier = ref.read(transferFormProvider.notifier);
    final itemCount = formState.cartItems.length;

    // Listen to UI events for user feedback and navigation
    ref.listen<TransferUiEvent?>(
      transferUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is TransferFailure) {
          snackbar.showError(next.failure);
        } else if (next is TransferCreated) {
          snackbar.showSuccess(next.message);
          // Reset form and navigate back
          if (mounted) {
            formNotifier.reset();
            context.pop();
          }
        }
        ref.read(transferUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.newTransfer,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destination Branch Dropdown (optional)
                  const TransferBranchDropdown(),
                  const SizedBox(height: AppSizes.xl),

                  // Items Header with Add Button
                  _buildItemsHeader(context, l10n, itemCount),
                  const SizedBox(height: AppSizes.md),

                  // Display cart items
                  const TransferCartItemsList(),
                  const SizedBox(height: AppSizes.lg),

                  // Notes field (optional)
                  CustomTextField(
                    labelText: '${l10n.notes} ${l10n.optional}',
                    controller: _notesController,
                    maxLines: 3,
                    prefixIcon: Icons.notes_outlined,
                  ),
                  const SizedBox(height: AppSizes.scrollContentMinHeight),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const TransferBottomSheet(),
    );
  }

  Widget _buildItemsHeader(BuildContext context, AppLocalizations l10n, int itemCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: AppSizes.iconSize,
              color: BrandColors.textSecondary,
            ),
            const SizedBox(width: AppSizes.sm),
            Text(
              l10n.items,
              style: context.subtitle(bold: true),
            ),
            if (itemCount > 0) ...[
              const SizedBox(width: AppSizes.xs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xxs,
                ),
                decoration: BoxDecoration(
                  color: BrandColors.primary,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: Text(
                  '$itemCount',
                  style: context.small(
                    color: BrandColors.textLight,
                    bold: true,
                  ),
                ),
              ),
            ],
          ],
        ),
        TextButton.icon(
          onPressed: () => TransferCartDialog.show(context),
          icon: Icon(Icons.add, size: AppSizes.iconSizeSm),
          label: Text(l10n.addItems),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: AppSizes.xs,
            ),
          ),
        ),
      ],
    );
  }
}

