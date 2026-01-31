import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/supplier_customer.dart';
import '../providers/supplier_customer_notifier.dart';
import '../providers/supplier_customer_loading_providers.dart';
import '../providers/supplier_customer_events.dart';

class SupplierCustomerFormDialog extends ConsumerStatefulWidget {
  final SupplierCustomerType type;
  final String title;
  final String buttonText;
  final SupplierCustomer? initial;

  const SupplierCustomerFormDialog({
    super.key,
    required this.type,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<SupplierCustomerFormDialog> createState() => _SupplierCustomerFormDialogState();
}

class _SupplierCustomerFormDialogState extends ConsumerState<SupplierCustomerFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _accountCode;
  late final TextEditingController _tinNumber;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initial?.name ?? '');
    _phone = TextEditingController(text: widget.initial?.phone ?? '');
    _accountCode = TextEditingController(text: widget.initial?.accountCode ?? '');
    _tinNumber = TextEditingController(text: widget.initial?.tinNumber ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _accountCode.dispose();
    _tinNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(supplierCustomerCreateLoadingProvider(widget.type));
    final updatingSet = ref.watch(supplierCustomerUpdateLoadingProvider(widget.type));
    final isEditing = widget.initial != null;
    final isUpdating = isEditing && updatingSet.contains(widget.initial!.id);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!mounted) return;
        if (isEditing) {
          await ref.read(supplierCustomerProvider(widget.type).notifier).updateSupplierCustomer(
                type: widget.type,
                id: widget.initial!.id,
                name: _name.text.trim(),
                phone: _phone.text.trim(),
                accountCode: _accountCode.text.trim(),
                tinNumber: _tinNumber.text.trim(),
                newType: widget.type,
              );
        } else {
          await ref.read(supplierCustomerProvider(widget.type).notifier).create(
                type: widget.type,
                name: _name.text.trim(),
                phone: _phone.text.trim(),
                accountCode: _accountCode.text.trim(),
                tinNumber: _tinNumber.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            labelText: l10n.name,
            controller: _name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.nameRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: AppSizes.md),
          CustomTextField(
            labelText: l10n.phone,
            controller: _phone,
          ),
          const SizedBox(height: AppSizes.md),
          CustomTextField(
            labelText: l10n.accountCode,
            controller: _accountCode,
          ),
          const SizedBox(height: AppSizes.md),
          CustomTextField(
            labelText: l10n.tinNumber,
            controller: _tinNumber,
          ),
        ],
      ),
      eventProvider: supplierCustomerUiEventsProvider(widget.type),
      shouldCloseOnEvent: (event) => event is SupplierCustomerCreated || event is SupplierCustomerUpdated,
      onEventHandled: () => ref.read(supplierCustomerUiEventsProvider(widget.type).notifier).clear(),
    );
  }
}


