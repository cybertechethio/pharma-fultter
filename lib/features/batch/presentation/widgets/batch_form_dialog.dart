import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../domain/entities/batch.dart';
import '../../domain/entities/batch_input.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_loading_providers.dart';
import '../providers/batch_events.dart';

class BatchFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final BatchEntity? initial;
  /// Required when creating a batch (e.g. from BatchListScreen).
  final int? itemId;

  const BatchFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
    this.itemId,
  });

  @override
  ConsumerState<BatchFormDialog> createState() => _BatchFormDialogState();
}

class _BatchFormDialogState extends ConsumerState<BatchFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _batchName;
  late final TextEditingController _costPrice;
  late final TextEditingController _unitPrice;
  late final TextEditingController _expirationDate;
  late final TextEditingController _manufacturingDate;
  late final TextEditingController _supplierBatchNumber;
  late final TextEditingController _notes;

  static String _dateToIsoDate(DateTime? d) =>
      d != null ? d.toIso8601String().split('T').first : '';

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _batchName = TextEditingController(text: initial?.batchName ?? '');
    _costPrice = TextEditingController(
      text: initial?.costPrice != null ? initial!.costPrice!.toString() : '',
    );
    _unitPrice = TextEditingController(
      text: initial?.unitPrice != null ? initial!.unitPrice!.toString() : '',
    );
    _expirationDate = TextEditingController(
      text: _dateToIsoDate(initial?.expirationDate),
    );
    _manufacturingDate = TextEditingController(
      text: _dateToIsoDate(initial?.manufacturingDate),
    );
    _supplierBatchNumber = TextEditingController(
      text: initial?.supplierBatchNumber ?? '',
    );
    _notes = TextEditingController(text: initial?.notes ?? '');
  }

  @override
  void dispose() {
    _batchName.dispose();
    _costPrice.dispose();
    _unitPrice.dispose();
    _expirationDate.dispose();
    _manufacturingDate.dispose();
    _supplierBatchNumber.dispose();
    _notes.dispose();
    super.dispose();
  }

  double? _parseDouble(String s) {
    final t = s.trim();
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  String? _opt(String s) {
    final t = s.trim();
    return t.isEmpty ? null : t;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final snackbar = ref.read(snackbarServiceProvider);
    final creating = ref.watch(batchCreateLoadingProvider);
    final updatingSet = ref.watch(batchUpdateLoadingProvider);
    final isEditing = widget.initial != null;
    final isUpdating = isEditing && updatingSet.contains(widget.initial!.id);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!_formKey.currentState!.validate()) return;
        if (!isEditing && widget.itemId == null) {
          snackbar.showWarning(l10n.itemRequiredToCreateBatch);
          return;
        }
        final cost = _parseDouble(_costPrice.text);
        final unit = _parseDouble(_unitPrice.text);
        if (cost == null || cost < 0) {
          snackbar.showWarning(l10n.costPriceRequired);
          return;
        }
        if (unit == null || unit < 0) {
          snackbar.showWarning(l10n.unitPriceRequired);
          return;
        }
        if (unit < cost) {
          snackbar.showWarning(l10n.unitPriceMustBeGreaterThanOrEqualToCostPrice);
          return;
        }
        if (!mounted) return;
        final notifierItemId =
            isEditing ? widget.initial!.itemId : widget.itemId!;
        final notifier = ref.read(batchProvider(notifierItemId).notifier);
        final input = BatchInput(
          itemId: isEditing ? null : widget.itemId,
          batchName: _batchName.text.trim(),
          costPrice: cost,
          unitPrice: unit,
          expirationDate: _opt(_expirationDate.text),
          manufacturingDate: _opt(_manufacturingDate.text),
          supplierBatchNumber: _opt(_supplierBatchNumber.text),
          notes: _opt(_notes.text),
        );
        if (isEditing) {
          await notifier.updateBatch(widget.initial!.id, input);
        } else {
          await notifier.create(input);
        }
      },
      formFieldsBuilder: (context, l10n) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                labelText: l10n.batchName,
                controller: _batchName,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.batchNameRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.costPrice,
                controller: _costPrice,
                inputType: TextInputType.number,
                validator: (value) {
                  final n = _parseDouble(value ?? '');
                  if (n == null) return l10n.costPriceRequired;
                  if (n < 0) return l10n.costPriceMustBeGreaterThanZero;
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.unitPrice,
                controller: _unitPrice,
                inputType: TextInputType.number,
                validator: (value) {
                  final n = _parseDouble(value ?? '');
                  if (n == null) return l10n.unitPriceRequired;
                  if (n < 0) return l10n.unitPriceMustBeGreaterThanZero;
                  final costVal = _parseDouble(_costPrice.text);
                  if (costVal != null && n < costVal) {
                    return l10n.unitPriceMustBeGreaterThanOrEqualToCostPrice;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.supplierBatchNumber,
                controller: _supplierBatchNumber,
                validator: (value) => null,
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.notes,
                controller: _notes,
                prefixIcon: Icons.notes_outlined,
                maxLines: 3,
              ),
              const SizedBox(height: AppSizes.md),
              DatePickerField(
                labelText: l10n.expirationDate,
                controller: _expirationDate,
                prefixIcon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: AppSizes.md),
              DatePickerField(
                labelText: l10n.manufacturingDate,
                controller: _manufacturingDate,
                prefixIcon: Icons.date_range_outlined,
              ),
            ],
          ),
        );
      },
      eventProvider: batchUiEventsProvider,
      shouldCloseOnEvent: (event) => event is BatchCreated || event is BatchUpdated,
      onEventHandled: () => ref.read(batchUiEventsProvider.notifier).clear(),
    );
  }
}

