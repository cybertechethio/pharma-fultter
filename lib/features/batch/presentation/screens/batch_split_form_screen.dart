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
import '../../data/models/batch_operation_item_model.dart';
import '../../data/models/batch_split_request_model.dart';
import '../providers/batch_events.dart';
import '../providers/batch_loading_providers.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_operation_notifier.dart';
import '../widgets/batch_form_dialog.dart';

class _DestinationEntry {
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

class BatchSplitFormScreen extends ConsumerStatefulWidget {
  final Item item;

  const BatchSplitFormScreen({super.key, required this.item});

  @override
  ConsumerState<BatchSplitFormScreen> createState() =>
      _BatchSplitFormScreenState();
}

class _BatchSplitFormScreenState extends ConsumerState<BatchSplitFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _sourceBatchNumber;
  final List<_DestinationEntry> _destinationEntries = [];
  final TextEditingController _notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addDestination();
  }

  @override
  void dispose() {
    for (final e in _destinationEntries) e.dispose();
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

  void _addDestination() {
    setState(() => _destinationEntries.add(_DestinationEntry()));
  }

  void _removeDestination(int index) {
    if (_destinationEntries.length <= 1) return;
    setState(() {
      _destinationEntries[index].dispose();
      _destinationEntries.removeAt(index);
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

    final isSplitLoading = operationLoading.contains(kBatchOpSplit);

    return Scaffold(
      appBar: CustomAppBar(
        title: '${l10n.split} – ${widget.item.name}',
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
          final sourceBatch = _batchByNumber(batches, _sourceBatchNumber);
          final sourceQty = sourceBatch?.quantity ?? 0;
          final selectedDestNumbers = _destinationEntries
              .map((e) => e.batchNumber)
              .whereType<String>()
              .toSet();

          // Source: 0 qty disabled
          final sourceItems = batches
              .map((b) => DropdownItem<String>(
                    value: b.batchNumber,
                    label: '${b.batchName} (qty: ${b.quantity})',
                    enabled: b.quantity > 0,
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
                    label: l10n.sourceBatch,
                    value: _sourceBatchNumber,
                    items: sourceItems,
                    onChanged: (v) =>
                        setState(() => _sourceBatchNumber = v),
                    required: true,
                    hintText: l10n.selectSourceBatch,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.destinationBatches,
                          style: context.title()),
                      TextButton.icon(
                        onPressed: _addDestination,
                        icon: Icon(Icons.add, size: AppSizes.iconSizeSm, color: BrandColors.primary),
                        label: Text(l10n.addDestination),
                        style: TextButton.styleFrom(
                          foregroundColor: BrandColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sm),
                  ...List.generate(_destinationEntries.length, (index) {
                    final entry = _destinationEntries[index];
                    final otherDestNumbers = selectedDestNumbers
                        .where((n) => n != entry.batchNumber)
                        .toSet();
                    // Destination: allow 0 qty (split into empty batch), exclude source
                    final destinationItems = batches
                        .where((b) =>
                            b.batchNumber != _sourceBatchNumber &&
                            !otherDestNumbers.contains(b.batchNumber))
                        .map((b) => DropdownItem<String>(
                              value: b.batchNumber,
                              label: '${b.batchName} (qty: ${b.quantity})',
                            ))
                        .toList();

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
                                  label: l10n.destinationNumber(index + 1),
                                  value: entry.batchNumber,
                                  items: destinationItems,
                                  onChanged: (v) => setState(() {
                                    entry.batchNumber = v;
                                  }),
                                  required: true,
                                  hintText: l10n.selectBatch,
                                ),
                              ),
                              const SizedBox(width: AppSizes.sm),
                              Expanded(
                                child: CustomTextField(
                                  labelText: '${l10n.quantity} *',
                                  controller: entry.quantityController,
                                  inputType: TextInputType.number,
                                  validator: (v) {
                                    final n = _parseInt(v ?? '');
                                    if (n == null || n < 1) {
                                      return '${l10n.min} 1';
                                    }
                                    if (sourceQty > 0 && n > sourceQty) {
                                      return '${l10n.max} $sourceQty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: _destinationEntries.length > 1
                                    ? () => _removeDestination(index)
                                    : null,
                                icon: const Icon(Icons.remove_circle_outline),
                                tooltip: l10n.removeDestination,
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
                                    size: AppSizes.iconSize,
                                    color: BrandColors.primary,
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  Text(
                                    entry.showMore
                                        ? l10n.hideDetails
                                        : l10n.showMore,
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
                                          labelText: l10n.costPrice,
                                          controller: entry.costPriceController,
                                          inputType: TextInputType.number,
                                          prefixIcon: Icons.attach_money_outlined,
                                          validator: (v) {
                                            final n = _parseDouble(v ?? '');
                                            if (n != null && n < 0) {
                                              return l10n.cannotBeNegative;
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: AppSizes.sm),
                                      Expanded(
                                        child: CustomTextField(
                                          labelText: l10n.unitPrice,
                                          controller: entry.unitPriceController,
                                          inputType: TextInputType.number,
                                          prefixIcon: Icons.attach_money_outlined,
                                          validator: (v) {
                                            final n = _parseDouble(v ?? '');
                                            if (n != null && n < 0) {
                                              return l10n.cannotBeNegative;
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSizes.sm),
                                  DatePickerField(
                                    labelText: l10n.expirationDate,
                                    controller: entry.expirationDateController,
                                    prefixIcon: Icons.calendar_today_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }),
                  if (sourceQty > 0) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.sm),
                      child: Text(
                        l10n.totalQuantityMustNotExceedSource(sourceQty),
                        style: context.small(color: BrandColors.textMuted),
                      ),
                    ),
                  ],
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
                    labelText: l10n.notes,
                    controller: _notes,
                    prefixIcon: Icons.notes_outlined,
                    maxLines: 3,
                  ),
                  const SizedBox(height: AppSizes.xxl),
                  CustomButton(
                    text: l10n.split,
                    onPressed: isSplitLoading ? null : _submit,
                    isLoading: isSplitLoading,
                    icon: Icons.call_split_outlined,
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
    if (source == null || source.isEmpty) {
      ref.read(snackbarServiceProvider).showWarning(
          l10n.sourceBatchRequired);
      return;
    }
    final asyncBat = ref.read(batchProvider(widget.item.id));
    final batches = asyncBat.value;
    if (batches == null) return;
    final sourceBatch = _batchByNumber(batches, source);
    final sourceQty = sourceBatch?.quantity ?? 0;

    final destinations = <BatchOperationItemModel>[];
    var totalQty = 0;
    for (final entry in _destinationEntries) {
      final bn = entry.batchNumber?.trim();
      if (bn == null || bn.isEmpty) {
        ref.read(snackbarServiceProvider).showWarning(
            l10n.eachDestinationMustHaveBatch);
        return;
      }
      final qty = _parseInt(entry.quantityController.text);
      if (qty == null || qty < 1) {
        ref.read(snackbarServiceProvider).showWarning(
            l10n.eachDestinationQuantityAtLeast1);
        return;
      }
      totalQty += qty;
      destinations.add(BatchOperationItemModel(
        batchNumber: bn,
        quantity: qty,
        costPrice: _parseDouble(entry.costPriceController.text),
        unitPrice: _parseDouble(entry.unitPriceController.text),
        expirationDate: _toExpirationDateIso(entry.expirationDateController.text),
      ));
    }
    if (destinations.isEmpty) {
      ref.read(snackbarServiceProvider).showWarning(
          l10n.atLeastOneDestinationRequired);
      return;
    }
    if (sourceQty > 0 && totalQty > sourceQty) {
      ref.read(snackbarServiceProvider).showWarning(
          l10n.totalQuantityCannotExceedSource(totalQty, sourceQty));
      return;
    }
    final request = BatchSplitRequestModel(
      itemId: widget.item.id,
      sourceBatchNumber: source,
      destinations: destinations,
      notes: _opt(_notes.text),
    );
    final err = request.validate();
    if (err != null) {
      ref.read(snackbarServiceProvider).showWarning(err);
      return;
    }
    await ref.read(batchOperationProvider.notifier).split(request);
  }
}
