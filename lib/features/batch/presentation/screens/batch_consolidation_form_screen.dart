import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../item/domain/entities/item.dart';
import '../../domain/entities/batch.dart';
import '../../data/models/batch_consolidation_request_model.dart';
import '../../data/models/batch_operation_item_model.dart';
import '../providers/batch_events.dart';
import '../providers/batch_loading_providers.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_operation_notifier.dart';
import '../widgets/batch_form_dialog.dart';

class _SourceEntry {
  String? batchNumber;
  bool showMore = false;
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  void dispose() {
    quantityController.dispose();
    costPriceController.dispose();
    unitPriceController.dispose();
    expirationDateController.dispose();
  }
}

class BatchConsolidationFormScreen extends ConsumerStatefulWidget {
  final Item item;

  const BatchConsolidationFormScreen({super.key, required this.item});

  @override
  ConsumerState<BatchConsolidationFormScreen> createState() =>
      _BatchConsolidationFormScreenState();
}

class _BatchConsolidationFormScreenState
    extends ConsumerState<BatchConsolidationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _destinationBatchNumber;
  final List<_SourceEntry> _sourceEntries = [];
  final TextEditingController _notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addSource();
  }

  @override
  void dispose() {
    for (final e in _sourceEntries) e.dispose();
    _notes.dispose();
    super.dispose();
  }

  int? _parseInt(String s) {
    final t = s.trim();
    if (t.isEmpty) return null;
    return int.tryParse(t);
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

  void _addSource() {
    setState(() => _sourceEntries.add(_SourceEntry()));
  }

  void _removeSource(int index) {
    if (_sourceEntries.length <= 1) return;
    setState(() {
      _sourceEntries[index].dispose();
      _sourceEntries.removeAt(index);
    });
  }

  BatchEntity? _batchByNumber(List<BatchEntity> batches, String? number) {
    if (number == null) return null;
    return batches.where((b) => b.batchNumber == number).firstOrNull;
  }

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

    final isConsolidationLoading =
        operationLoading.contains(kBatchOpConsolidation);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Consolidation – ${widget.item.name}',
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
          final selectedSourceNumbers = _sourceEntries
              .map((e) => e.batchNumber)
              .whereType<String>()
              .toSet();

          // Destination: all batches, exclude selected sources
          final destinationItems = batches
              .where((b) => !selectedSourceNumbers.contains(b.batchNumber))
              .map((b) => DropdownItem<String>(
                    value: b.batchNumber,
                    label: '${b.batchName} (qty: ${b.quantity})',
                  ))
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomDropdown<String>(
                    label: 'Destination batch',
                    value: _destinationBatchNumber,
                    items: destinationItems,
                    onChanged: (v) =>
                        setState(() => _destinationBatchNumber = v),
                    required: true,
                    hintText: 'Select destination batch',
                  ),
                  const SizedBox(height: AppSizes.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Source batches',
                          style: Theme.of(context).textTheme.titleSmall),
                      TextButton.icon(
                        onPressed: _addSource,
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Add source'),
                        style: TextButton.styleFrom(
                          foregroundColor: BrandColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sm),
                  ...List.generate(_sourceEntries.length, (index) {
                    final entry = _sourceEntries[index];
                    final otherSourceNumbers = selectedSourceNumbers
                        .where((n) => n != entry.batchNumber)
                        .toSet();
                    final sourceItems = batches
                        .where((b) =>
                            b.batchNumber != _destinationBatchNumber &&
                            !otherSourceNumbers.contains(b.batchNumber))
                        .map((b) => DropdownItem<String>(
                              value: b.batchNumber,
                              label: '${b.batchName} (qty: ${b.quantity})',
                              enabled: b.quantity > 0,
                            ))
                        .toList();
                    final sourceBatch =
                        _batchByNumber(batches, entry.batchNumber);
                    final sourceQty = sourceBatch?.quantity ?? 0;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomDropdown<String>(
                                  label: 'Source ${index + 1}',
                                  value: entry.batchNumber,
                                  items: sourceItems,
                                  onChanged: (v) => setState(() {
                                    entry.batchNumber = v;
                                  }),
                                  required: true,
                                  hintText: 'Select batch',
                                ),
                              ),
                              IconButton(
                                onPressed: _sourceEntries.length > 1
                                    ? () => _removeSource(index)
                                    : null,
                                icon: const Icon(Icons.remove_circle_outline),
                                tooltip: 'Remove source',
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              entry.showMore = !entry.showMore;
                            }),
                            borderRadius: BorderRadius.circular(AppSizes.radius),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.sm),
                              child: Row(
                                children: [
                                  Icon(
                                    entry.showMore
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    size: 20,
                                    color: BrandColors.primary,
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  Text(
                                    entry.showMore
                                        ? 'Hide details'
                                        : 'Show more',
                                    style: context.bodyPrimary(bold: true),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (entry.showMore) ...[
                            const SizedBox(height: AppSizes.sm),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          labelText: 'Qty (optional)',
                                          controller: entry.quantityController,
                                          inputType: TextInputType.number,
                                          validator: (v) {
                                            final n = _parseInt(v ?? '');
                                            if (n != null && n < 1) {
                                              return 'Min 1';
                                            }
                                            if (sourceQty > 0 &&
                                                n != null &&
                                                n > sourceQty) {
                                              return 'Max $sourceQty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: AppSizes.sm),
                                      Expanded(
                                        child: CustomTextField(
                                          labelText: l10n.costPrice,
                                          controller: entry.costPriceController,
                                          inputType: TextInputType.number,
                                          prefixIcon: Icons.attach_money_outlined,
                                          validator: (v) {
                                            final n = _parseDouble(v ?? '');
                                            if (n != null && n < 0) {
                                              return 'Cannot be negative';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSizes.sm),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          labelText: l10n.unitPrice,
                                          controller: entry.unitPriceController,
                                          inputType: TextInputType.number,
                                          prefixIcon: Icons.attach_money_outlined,
                                          validator: (v) {
                                            final n = _parseDouble(v ?? '');
                                            if (n != null && n < 0) {
                                              return 'Cannot be negative';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: AppSizes.sm),
                                      Expanded(
                                        child: DatePickerField(
                                          labelText: l10n.expirationDate,
                                          controller: entry.expirationDateController,
                                          prefixIcon: Icons.calendar_today_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
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
                      icon: Icon(Icons.add, size: 18, color: BrandColors.primary),
                      label: Text(l10n.createBatch),
                      style: TextButton.styleFrom(
                        foregroundColor: BrandColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.notes,
                    controller: _notes,
                    prefixIcon: Icons.notes_outlined,
                    maxLines: 3,
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  CustomButton(
                    text: 'Consolidate',
                    onPressed:
                        isConsolidationLoading ? null : _submit,
                    isLoading: isConsolidationLoading,
                    icon: Icons.merge_type_outlined,
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
    final dest = _destinationBatchNumber?.trim();
    if (dest == null || dest.isEmpty) {
      ref.read(snackbarServiceProvider).showWarning(
          'Destination batch is required');
      return;
    }
    final sources = <BatchOperationItemModel>[];
    for (final entry in _sourceEntries) {
      final bn = entry.batchNumber?.trim();
      if (bn == null || bn.isEmpty) {
        ref.read(snackbarServiceProvider).showWarning(
            'Each source must have a batch selected');
        return;
      }
      final qty = _parseInt(entry.quantityController.text);
      sources.add(BatchOperationItemModel(
        batchNumber: bn,
        quantity: qty,
        costPrice: _parseDouble(entry.costPriceController.text),
        unitPrice: _parseDouble(entry.unitPriceController.text),
        expirationDate: _toExpirationDateIso(entry.expirationDateController.text),
      ));
    }
    if (sources.isEmpty) {
      ref.read(snackbarServiceProvider).showWarning(
          'At least one source is required');
      return;
    }
    final request = BatchConsolidationRequestModel(
      itemId: widget.item.id,
      destinationBatchNumber: dest,
      sources: sources,
      notes: _opt(_notes.text),
    );
    final err = request.validate();
    if (err != null) {
      ref.read(snackbarServiceProvider).showWarning(err);
      return;
    }
    await ref.read(batchOperationProvider.notifier).consolidate(request);
  }
}
