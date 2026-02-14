import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../item/domain/entities/item.dart';
import '../../data/models/batch_transfer_request_model.dart';
import '../providers/batch_events.dart';
import '../providers/batch_loading_providers.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_operation_notifier.dart';
import '../widgets/batch_form_dialog.dart';
import '../../../../routes/route_name.dart';

class BatchTransferFormScreen extends ConsumerStatefulWidget {
  final Item item;

  const BatchTransferFormScreen({super.key, required this.item});

  @override
  ConsumerState<BatchTransferFormScreen> createState() =>
      _BatchTransferFormScreenState();
}

class _BatchTransferFormScreenState extends ConsumerState<BatchTransferFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _quantity;
  late final TextEditingController _costPrice;
  late final TextEditingController _unitPrice;
  late final TextEditingController _expirationDate;
  late final TextEditingController _notes;

  String? _sourceBatchNumber;
  String? _destinationBatchNumber;
  bool _showMoreOptions = false;

  @override
  void initState() {
    super.initState();
    _quantity = TextEditingController();
    _costPrice = TextEditingController();
    _unitPrice = TextEditingController();
    _expirationDate = TextEditingController();
    _notes = TextEditingController();
  }

  @override
  void dispose() {
    _quantity.dispose();
    _costPrice.dispose();
    _unitPrice.dispose();
    _expirationDate.dispose();
    _notes.dispose();
    super.dispose();
  }

  double? _parseDouble(String s) {
    final t = s.trim();
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  int? _parseInt(String s) {
    final t = s.trim();
    if (t.isEmpty) return null;
    return int.tryParse(t);
  }

  String? _opt(String s) {
    final t = s.trim();
    return t.isEmpty ? null : t;
  }

  /// Converts YYYY-MM-DD to ISO 8601 date string for API.
  String? _toExpirationDateIso(String? value) {
    final t = _opt(value ?? '');
    if (t == null) return null;
    final d = DateTime.tryParse(t);
    return d?.toUtc().toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final snackbar = ref.read(snackbarServiceProvider);
    final asyncBatches = ref.watch(batchProvider(widget.item.id));
    final operationLoading = ref.watch(batchOperationLoadingProvider);

    ref.listen<BatchUiEvent?>(
      batchUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is BatchOperationFailure) {
          snackbar.showError(next.failure);
        } else if (next is BatchOperationSuccess) {
          snackbar.showSuccess(next.message);
          ref.read(batchUiEventsProvider.notifier).clear();
          ref.invalidate(batchProvider(widget.item.id));
          if (context.mounted) {
            context.pushReplacement(RouteName.batchList, extra: widget.item);
          }
        }
        ref.read(batchUiEventsProvider.notifier).clear();
      },
    );

    final isTransferLoading = operationLoading.contains(kBatchOpTransfer);

    return Scaffold(
      appBar: CustomAppBar(
        title: '${l10n.transfer} – ${widget.item.name}',
      ),
      body: asyncBatches.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${l10n.error}: $e'),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(batchProvider(widget.item.id)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
        data: (batches) {
          // Source: zero-qty batches disabled; destination: all selectable
          final sourceItems = batches
              .where((b) => b.batchNumber != _destinationBatchNumber)
              .map((b) => DropdownItem<String>(
                    value: b.batchNumber,
                    label: '${b.batchName} (qty: ${b.quantity})',
                    enabled: b.quantity > 0,
                  ))
              .toList();
          final destinationItems = batches
              .where((b) => b.batchNumber != _sourceBatchNumber)
              .map((b) => DropdownItem<String>(
                    value: b.batchNumber,
                    label: '${b.batchName} (qty: ${b.quantity})',
                  ))
              .toList();
          final sourceBatch = _sourceBatchNumber != null
              ? batches
                  .where((b) => b.batchNumber == _sourceBatchNumber)
                  .firstOrNull
              : null;
          final sourceQty = sourceBatch?.quantity ?? 0;

          return SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDropdown<String>(
                  label: l10n.sourceBatch,
                  value: _sourceBatchNumber,
                  items: sourceItems,
                  onChanged: (v) => setState(() {
                    _sourceBatchNumber = v;
                    if (_destinationBatchNumber == v) _destinationBatchNumber = null;
                  }),
                  required: true,
                  hintText: l10n.selectSourceBatch,
                ),
                const SizedBox(height: AppSizes.lg),
                CustomDropdown<String>(
                  label: l10n.destinationBatch,
                  value: _destinationBatchNumber,
                  items: destinationItems,
                  onChanged: (v) => setState(() {
                    _destinationBatchNumber = v;
                    if (_sourceBatchNumber == v) _sourceBatchNumber = null;
                  }),
                  required: true,
                  hintText: l10n.selectDestinationBatch,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => BatchFormDialog(
                          title: l10n.createBatch,
                          buttonText: l10n.create,
                          itemId: widget.item.id,
                        ),
                      ).then((_) {
                        ref.invalidate(batchProvider(widget.item.id));
                      });
                    },
                    icon: Icon(Icons.add, size: AppSizes.iconSizeSm, color: BrandColors.primary),
                    label: Text(l10n.createBatch),
                    style: TextButton.styleFrom(
                      foregroundColor: BrandColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.lg),
                CustomTextField(
                  labelText: l10n.quantity,
                  controller: _quantity,
                  inputType: TextInputType.number,
                  validator: (v) {
                    final n = _parseInt(v ?? '');
                    if (n == null || n < 1) {
                      return l10n.quantityMustBeAtLeast1;
                    }
                    if (sourceQty > 0 && n > sourceQty) {
                      return l10n.quantityCannotExceedSourceBatch(sourceQty);
                    }
                    return null;
                  },
                  prefixIcon: Icons.numbers_outlined,
                ),
                const SizedBox(height: AppSizes.lg),
                InkWell(
                  onTap: () => setState(() => _showMoreOptions = !_showMoreOptions),
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
                    child: Row(
                      children: [
                        Icon(
                          _showMoreOptions ? Icons.expand_less : Icons.expand_more,
                          size: AppSizes.iconSize,
                          color: BrandColors.primary,
                        ),
                        const SizedBox(width: AppSizes.xs),
                        Text(
                          _showMoreOptions ? l10n.hideOptionalFields : l10n.moreOptions,
                          style: context.bodyPrimary(bold: true),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_showMoreOptions) ...[
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.costPrice,
                    controller: _costPrice,
                    inputType: TextInputType.number,
                    prefixIcon: Icons.attach_money_outlined,
                    validator: (v) {
                      final n = _parseDouble(v ?? '');
                      if (n != null && n < 0) return l10n.costPriceCannotBeNegative;
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.unitPrice,
                    controller: _unitPrice,
                    inputType: TextInputType.number,
                    prefixIcon: Icons.attach_money_outlined,
                    validator: (v) {
                      final n = _parseDouble(v ?? '');
                      if (n != null && n < 0) return l10n.unitPriceCannotBeNegative;
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),
                  DatePickerField(
                    labelText: l10n.expirationDate,
                    controller: _expirationDate,
                    prefixIcon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.notes,
                    controller: _notes,
                    prefixIcon: Icons.notes_outlined,
                    maxLines: 3,
                  ),
                  const SizedBox(height: AppSizes.lg),
                ],
                CustomButton(
                  text: l10n.transfer,
                  onPressed: isTransferLoading ? null : _submit,
                  isLoading: isTransferLoading,
                  icon: Icons.swap_horiz_outlined,
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context);
    final source = _sourceBatchNumber?.trim();
    final destination = _destinationBatchNumber?.trim();
    if (source == null || source.isEmpty || destination == null || destination.isEmpty) {
      ref.read(snackbarServiceProvider).showWarning(l10n.sourceAndDestinationBatchRequired);
      return;
    }
    final quantity = _parseInt(_quantity.text) ?? 0;
    final request = BatchTransferRequestModel(
      itemId: widget.item.id,
      sourceBatchNumber: source,
      destinationBatchNumber: destination,
      quantity: quantity,
      costPrice: _parseDouble(_costPrice.text),
      unitPrice: _parseDouble(_unitPrice.text),
      expirationDate: _toExpirationDateIso(_expirationDate.text),
      notes: _opt(_notes.text),
    );
    final err = request.validate();
    if (err != null) {
      ref.read(snackbarServiceProvider).showWarning(err);
      return;
    }
    await ref.read(batchOperationProvider.notifier).transfer(request);
  }
}
