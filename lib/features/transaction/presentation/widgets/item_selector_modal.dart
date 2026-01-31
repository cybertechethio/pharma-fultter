import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../stock/presentation/providers/stocks_provider.dart';
import '../../../stock/domain/entities/stock.dart';

class ItemSelectorModal extends ConsumerWidget {
  final Function(Stock) onItemSelected;
  final List<int> selectedItemIds;

  const ItemSelectorModal({
    super.key,
    required this.onItemSelected,
    this.selectedItemIds = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 600),
        child: Column(
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
                      'Select Item',
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
            // Search bar - moved to _ItemSearchWrapper
            // Items list
            Expanded(
              child: _ItemSearchWrapper(
                selectedItemIds: selectedItemIds,
                onItemSelected: (stock) {
                  onItemSelected(stock);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemSearchWrapper extends StatefulWidget {
  final Function(Stock) onItemSelected;
  final List<int> selectedItemIds;

  const _ItemSearchWrapper({
    required this.onItemSelected,
    this.selectedItemIds = const [],
  });

  @override
  State<_ItemSearchWrapper> createState() => _ItemSearchWrapperState();
}

class _ItemSearchWrapperState extends State<_ItemSearchWrapper> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search items...',
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
        // Items list
        Expanded(
          child: _ItemList(
            searchQuery: _searchQuery,
            selectedItemIds: widget.selectedItemIds,
            onItemSelected: widget.onItemSelected,
          ),
        ),
      ],
    );
  }
}

class _ItemList extends ConsumerStatefulWidget {
  final Function(Stock) onItemSelected;
  final String searchQuery;
  final List<int> selectedItemIds;

  const _ItemList({
    required this.onItemSelected,
    required this.searchQuery,
    this.selectedItemIds = const [],
  });

  @override
  ConsumerState<_ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<_ItemList> {

  @override
  Widget build(BuildContext context) {
    final stocksAsync = ref.watch(stockProvider);
    final theme = Theme.of(context);

    return stocksAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (stocks) {
        // Filter out already selected items
        final availableStocks = stocks.where(
          (stock) => !widget.selectedItemIds.contains(stock.itemId),
        ).toList();
        
        // Filter stocks by search query
        final filtered = widget.searchQuery.isEmpty
            ? availableStocks
            : availableStocks.where((stock) {
                final query = widget.searchQuery.toLowerCase();
                return stock.item.name.toLowerCase().contains(query) ||
                    stock.item.code.toLowerCase().contains(query) ||
                    (stock.item.sku?.toLowerCase().contains(query) ?? false);
              }).toList();

        if (filtered.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 64,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.searchQuery.isEmpty
                      ? 'No items available'
                      : 'No items found',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final stock = filtered[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    stock.item.name[0].toUpperCase(),
                  ),
                ),
                title: Text(stock.item.name),
                subtitle: Text(
                  'Code: ${stock.item.code} | SKU: ${stock.item.sku ?? 'N/A'} | Qty: ${stock.totalQuantity}',
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => widget.onItemSelected(stock),
              ),
            );
          },
        );
      },
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text('Error loading items: $error'),
          ],
        ),
      ),
    );
  }
}

