import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../../stock/domain/entities/stock_batch.dart';
import '../../domain/entities/transaction_item.dart';
import '../../domain/entities/transaction_batch.dart';
import '../../../batch/presentation/widgets/batch_form_dialog.dart';
import '../../../batch/presentation/providers/batch_notifier.dart';
import '../../../../core/enums/transaction_type_enum.dart';

class TransactionItemCard extends ConsumerStatefulWidget {
  final Stock stock;
  final TransactionItem item;
  final TransactionType transactionType;
  final Function(TransactionItem) onChanged;
  final Function() onRemove;

  const TransactionItemCard({
    super.key,
    required this.stock,
    required this.item,
    required this.transactionType,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  ConsumerState<TransactionItemCard> createState() => _TransactionItemCardState();
}

class _TransactionItemCardState extends ConsumerState<TransactionItemCard> {
  late List<TransactionBatch> _batches;

  @override
  void initState() {
    super.initState();
    _batches = List.from(widget.item.batches);
  }

  void _updateItem() {
    widget.onChanged(
      TransactionItem(
        itemId: widget.item.itemId,
        taxRate: widget.item.taxRate,
        batches: _batches,
      ),
    );
  }

  void _addBatch(StockBatch stockBatch, double quantity) {
    setState(() {
      _batches.add(
        TransactionBatch(
          batchNumber: stockBatch.batchNumber,
          quantity: quantity,
          costPrice: double.parse(stockBatch.costPrice),
          unitPrice: double.parse(stockBatch.unitPrice),
          expirationDate: stockBatch.expirationDate,
        ),
      );
    });
    _updateItem();
  }

  void _removeBatch(int index) {
    setState(() {
      _batches.removeAt(index);
    });
    _updateItem();
  }

  void _updateBatchQuantity(int index, double quantity) {
    setState(() {
      _batches[index] = _batches[index].copyWith(quantity: quantity);
    });
    _updateItem();
  }

  Future<void> _createNewBatch() async {
    await showDialog(
      context: context,
      builder: (context) => BatchFormDialog(
        title: 'Create Batch',
        buttonText: 'Create',
      ),
    );

    if (mounted) {
      await ref.read(batchProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.stock.item.name,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        'Code: ${widget.stock.item.code} | Tax: ${widget.item.taxRate}%',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: colorScheme.error,
                  onPressed: widget.onRemove,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Batches
            ...List.generate(
              _batches.length,
              (index) => _BatchRow(
                stockBatch: widget.stock.branchStockBatches.firstWhere(
                  (b) => b.batchNumber == _batches[index].batchNumber,
                  orElse: () => widget.stock.branchStockBatches.first,
                ),
                batch: _batches[index],
                transactionType: widget.transactionType,
                availableQuantity: double.tryParse(
                      widget.stock.branchStockBatches
                          .firstWhere(
                            (b) => b.batchNumber == _batches[index].batchNumber,
                            orElse: () => widget.stock.branchStockBatches.first,
                          )
                          .quantity,
                    ) ??
                    0.0,
                onQuantityChanged: (quantity) => _updateBatchQuantity(index, quantity),
                onRemove: () => _removeBatch(index),
              ),
            ),
            const SizedBox(height: 8),
            // Add batch button
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () => _showBatchSelector(),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Batch'),
                ),
                if (widget.transactionType.allowsBatchCreation()) ...[
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: _createNewBatch,
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Create New Batch'),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBatchSelector() {
    showDialog(
      context: context,
      builder: (context) => _BatchSelectorDialog(
        stock: widget.stock,
        selectedBatches: _batches.map((b) => b.batchNumber).toList(),
        onBatchSelected: (stockBatch, quantity) => _addBatch(stockBatch, quantity),
      ),
    );
  }
}

class _BatchRow extends StatefulWidget {
  final StockBatch stockBatch;
  final TransactionBatch batch;
  final TransactionType transactionType;
  final double availableQuantity;
  final Function(double) onQuantityChanged;
  final Function() onRemove;

  const _BatchRow({
    required this.stockBatch,
    required this.batch,
    required this.transactionType,
    required this.availableQuantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  State<_BatchRow> createState() => _BatchRowState();
}

class _BatchRowState extends State<_BatchRow> {
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.batch.quantity.toString(),
    );
    // Use addPostFrameCallback to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _quantityController.addListener(_validateQuantity);
    });
  }

  @override
  void dispose() {
    _quantityController.removeListener(_validateQuantity);
    _quantityController.dispose();
    super.dispose();
  }

  void _validateQuantity() {
    if (!mounted) return;
    final value = _quantityController.text;
    final quantity = double.tryParse(value) ?? 0.0;
    if (widget.transactionType == TransactionType.sale) {
      if (quantity > widget.availableQuantity) {
        // Use post frame callback to avoid setState during build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Quantity cannot exceed available stock: ${widget.availableQuantity}',
                ),
              ),
            );
            _quantityController.text = widget.availableQuantity.toString();
            widget.onQuantityChanged(widget.availableQuantity);
          }
        });
        return;
      }
    }
    widget.onQuantityChanged(quantity);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Batch: ${widget.batch.batchNumber}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: widget.onRemove,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Quantity *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Cost: ${widget.batch.costPrice} | Unit: ${widget.batch.unitPrice}',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            if (widget.batch.expirationDate != null)
              Text(
                'Expires: ${widget.batch.expirationDate!.toLocal().toString().split(' ')[0]}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BatchSelectorDialog extends StatefulWidget {
  final Stock stock;
  final List<String> selectedBatches;
  final Function(StockBatch, double) onBatchSelected;

  const _BatchSelectorDialog({
    required this.stock,
    required this.selectedBatches,
    required this.onBatchSelected,
  });

  @override
  State<_BatchSelectorDialog> createState() => _BatchSelectorDialogState();
}

class _BatchSelectorDialogState extends State<_BatchSelectorDialog> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Filter out already selected batches
    final availableBatches = widget.stock.branchStockBatches
        .where((b) => !widget.selectedBatches.contains(b.batchNumber))
        .toList();
    
    // Filter by search query
    final filteredBatches = _searchQuery.isEmpty
        ? availableBatches
        : availableBatches.where((batch) {
            final query = _searchQuery.toLowerCase();
            return batch.batchNumber.toLowerCase().contains(query) ||
                batch.costPrice.toLowerCase().contains(query) ||
                batch.unitPrice.toLowerCase().contains(query) ||
                batch.quantity.toLowerCase().contains(query);
          }).toList();

    return Dialog(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: colorScheme.outline),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select Batch',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search batches...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            // Batches list
            Flexible(
              child: filteredBatches.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 64,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _searchQuery.isEmpty
                                  ? 'No available batches'
                                  : 'No batches found',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredBatches.length,
                      itemBuilder: (context, index) {
                        final batch = filteredBatches[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                batch.batchNumber[0].toUpperCase(),
                              ),
                            ),
                            title: Text(batch.batchNumber),
                            subtitle: Text(
                              'Qty: ${batch.quantity} | Cost: ${batch.costPrice} | Unit: ${batch.unitPrice}',
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              Navigator.of(context).pop();
                              _showQuantityDialog(context, batch);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuantityDialog(BuildContext context, StockBatch batch) {
    final quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Quantity'),
        content: TextField(
          controller: quantityController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Quantity',
            hintText: 'Enter quantity',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final quantity = double.tryParse(quantityController.text) ?? 0.0;
              if (quantity > 0) {
                Navigator.of(context).pop();
                widget.onBatchSelected(batch, quantity);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
