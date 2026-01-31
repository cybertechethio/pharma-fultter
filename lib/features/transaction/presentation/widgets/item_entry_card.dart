import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../../stock/domain/entities/stock_batch.dart';
import '../../domain/entities/transaction_item.dart';
import '../../domain/entities/transaction_batch.dart';
import '../../../../core/enums/transaction_type_enum.dart';

/// Redesigned item entry card with quantity stepper and batch management
class ItemEntryCard extends StatefulWidget {
  final Stock stock;
  final TransactionItem item;
  final TransactionType transactionType;
  final ValueChanged<TransactionItem> onChanged;
  final VoidCallback onRemove;
  final VoidCallback? onCreateBatch;

  const ItemEntryCard({
    super.key,
    required this.stock,
    required this.item,
    required this.transactionType,
    required this.onChanged,
    required this.onRemove,
    this.onCreateBatch,
  });

  @override
  State<ItemEntryCard> createState() => _ItemEntryCardState();
}

class _ItemEntryCardState extends State<ItemEntryCard> {
  late List<TransactionBatch> _batches;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _batches = List.from(widget.item.batches);
  }

  @override
  void didUpdateWidget(ItemEntryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      _batches = List.from(widget.item.batches);
    }
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

  double get _totalQuantity {
    return _batches.fold(0.0, (sum, batch) => sum + batch.quantity);
  }

  double get _subtotal {
    return _batches.fold(0.0, (sum, batch) {
      final price = widget.transactionType == TransactionType.sale
          ? batch.unitPrice
          : batch.costPrice;
      return sum + (batch.quantity * price);
    });
  }

  double get _taxAmount {
    return _subtotal * (widget.item.taxRate / 100);
  }

  double get _total {
    return _subtotal + _taxAmount;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          _buildHeader(theme, colorScheme),
          // Batch list (collapsible)
          if (_isExpanded) ...[
            const Divider(height: 1),
            _buildBatchList(theme, colorScheme),
          ],
          // Footer with totals
          _buildFooter(theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
    return InkWell(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Item icon/image placeholder
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.inventory_2_rounded,
                color: colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            // Item info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.stock.item.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.qr_code_rounded,
                        label: widget.stock.item.code,
                      ),
                      const SizedBox(width: 8),
                      _InfoChip(
                        icon: Icons.percent_rounded,
                        label: '${widget.item.taxRate.toStringAsFixed(0)}% tax',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expand/collapse and delete
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: widget.onRemove,
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: colorScheme.error,
                  ),
                  tooltip: 'Remove item',
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBatchList(ThemeData theme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Batch header
          Row(
            children: [
              Text(
                'BATCHES',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              if (_batches.isNotEmpty)
                Text(
                  '${_batches.length} batch${_batches.length > 1 ? 'es' : ''}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          // Batch entries
          if (_batches.isEmpty)
            _buildEmptyBatchState(theme, colorScheme)
          else
            ...List.generate(_batches.length, (index) {
              final stockBatch = widget.stock.branchStockBatches.firstWhere(
                (b) => b.batchNumber == _batches[index].batchNumber,
                orElse: () => widget.stock.branchStockBatches.first,
              );
              return _BatchEntryTile(
                stockBatch: stockBatch,
                batch: _batches[index],
                transactionType: widget.transactionType,
                availableQuantity: double.tryParse(stockBatch.quantity) ?? 0.0,
                onQuantityChanged: (qty) {
                  setState(() {
                    _batches[index] = _batches[index].copyWith(quantity: qty);
                  });
                  _updateItem();
                },
                onRemove: () {
                  setState(() {
                    _batches.removeAt(index);
                  });
                  _updateItem();
                },
              );
            }),
          const SizedBox(height: 12),
          // Add batch buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _showBatchSelector,
                  icon: const Icon(Icons.add_rounded, size: 20),
                  label: const Text('Add Batch'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              if (widget.transactionType.allowsBatchCreation() &&
                  widget.onCreateBatch != null) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: widget.onCreateBatch,
                    icon: const Icon(Icons.add_circle_outline_rounded, size: 20),
                    label: const Text('New Batch'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyBatchState(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.layers_outlined,
            size: 24,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(width: 12),
          Text(
            'No batches selected',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          // Quantity summary
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quantity',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                _totalQuantity.toStringAsFixed(0),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.item.taxRate > 0) ...[
                Text(
                  'Subtotal: ETB ${_subtotal.toStringAsFixed(2)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  'Tax: ETB ${_taxAmount.toStringAsFixed(2)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              Text(
                'ETB ${_total.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showBatchSelector() {
    final availableBatches = widget.stock.branchStockBatches
        .where((b) => !_batches.any((tb) => tb.batchNumber == b.batchNumber))
        .toList();

    if (availableBatches.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No more batches available')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BatchSelectorSheet(
        batches: availableBatches,
        transactionType: widget.transactionType,
        onBatchSelected: (stockBatch, quantity) {
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
        },
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _BatchEntryTile extends StatefulWidget {
  final StockBatch stockBatch;
  final TransactionBatch batch;
  final TransactionType transactionType;
  final double availableQuantity;
  final ValueChanged<double> onQuantityChanged;
  final VoidCallback onRemove;

  const _BatchEntryTile({
    required this.stockBatch,
    required this.batch,
    required this.transactionType,
    required this.availableQuantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  State<_BatchEntryTile> createState() => _BatchEntryTileState();
}

class _BatchEntryTileState extends State<_BatchEntryTile> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.batch.quantity.toStringAsFixed(0),
    );
  }

  @override
  void didUpdateWidget(_BatchEntryTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.batch.quantity != widget.batch.quantity) {
      _controller.text = widget.batch.quantity.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementQuantity() {
    final newQty = widget.batch.quantity + 1;
    if (widget.transactionType == TransactionType.sale &&
        newQty > widget.availableQuantity) {
      return;
    }
    widget.onQuantityChanged(newQty);
  }

  void _decrementQuantity() {
    if (widget.batch.quantity > 1) {
      widget.onQuantityChanged(widget.batch.quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final price = widget.transactionType == TransactionType.sale
        ? widget.batch.unitPrice
        : widget.batch.costPrice;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Batch info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.layers_rounded,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            widget.batch.batchNumber,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ETB ${price.toStringAsFixed(2)} per unit',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (widget.batch.expirationDate != null)
                      Text(
                        'Exp: ${_formatDate(widget.batch.expirationDate!)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              // Remove button
              IconButton(
                onPressed: widget.onRemove,
                icon: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Quantity stepper
          Row(
            children: [
              // Stepper
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _StepperButton(
                      icon: Icons.remove_rounded,
                      onPressed: _decrementQuantity,
                      enabled: widget.batch.quantity > 1,
                    ),
                    SizedBox(
                      width: 60,
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        onSubmitted: (value) {
                          final qty = double.tryParse(value) ?? 1;
                          final maxQty = widget.transactionType == TransactionType.sale
                              ? widget.availableQuantity
                              : double.infinity;
                          widget.onQuantityChanged(qty.clamp(1, maxQty));
                        },
                      ),
                    ),
                    _StepperButton(
                      icon: Icons.add_rounded,
                      onPressed: _incrementQuantity,
                      enabled: widget.transactionType != TransactionType.sale ||
                          widget.batch.quantity < widget.availableQuantity,
                    ),
                  ],
                ),
              ),
              if (widget.transactionType == TransactionType.sale) ...[
                const SizedBox(width: 8),
                Text(
                  '/ ${widget.availableQuantity.toStringAsFixed(0)} avail',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              const Spacer(),
              // Line total
              Text(
                'ETB ${(widget.batch.quantity * price).toStringAsFixed(2)}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;

  const _StepperButton({
    required this.icon,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 22,
            color: enabled
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}

class _BatchSelectorSheet extends StatefulWidget {
  final List<StockBatch> batches;
  final TransactionType transactionType;
  final void Function(StockBatch batch, double quantity) onBatchSelected;

  const _BatchSelectorSheet({
    required this.batches,
    required this.transactionType,
    required this.onBatchSelected,
  });

  @override
  State<_BatchSelectorSheet> createState() => _BatchSelectorSheetState();
}

class _BatchSelectorSheetState extends State<_BatchSelectorSheet> {
  StockBatch? _selectedBatch;
  final _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Row(
              children: [
                Icon(
                  Icons.layers_rounded,
                  color: colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Select Batch',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Batch list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: widget.batches.length,
              itemBuilder: (context, index) {
                final batch = widget.batches[index];
                final isSelected = _selectedBatch == batch;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Material(
                    color: isSelected
                        ? colorScheme.primaryContainer.withOpacity(0.3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () => setState(() => _selectedBatch = batch),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? colorScheme.primary.withOpacity(0.5)
                                : colorScheme.outlineVariant.withOpacity(0.5),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.layers_rounded,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    batch.batchNumber,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Qty: ${batch.quantity} | Cost: ${batch.costPrice} | Unit: ${batch.unitPrice}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Quantity input and add button
          if (_selectedBatch != null)
            Container(
              padding: EdgeInsets.fromLTRB(
                24,
                16,
                24,
                MediaQuery.of(context).padding.bottom + 16,
              ),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: () {
                      final qty = double.tryParse(_quantityController.text) ?? 1;
                      widget.onBatchSelected(_selectedBatch!, qty);
                      Navigator.of(context).pop();
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Add Batch'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

