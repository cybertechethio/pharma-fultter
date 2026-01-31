import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../transaction/domain/entities/transaction_item.dart';
import '../../../transaction/presentation/widgets/branch_selector.dart';
import '../../../transaction/presentation/widgets/item_selector_modal.dart';
import '../../../transaction/presentation/widgets/transaction_item_card.dart';
import '../../../stock/presentation/providers/stocks_provider.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../domain/entities/transfer_data.dart';
import '../providers/transfer_notifier.dart';
import '../providers/transfer_events.dart';
import '../providers/transfer_loading_providers.dart';

class TransferFormScreen extends ConsumerStatefulWidget {
  const TransferFormScreen({super.key});

  @override
  ConsumerState<TransferFormScreen> createState() => _TransferFormScreenState();
}

class _TransferFormScreenState extends ConsumerState<TransferFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  int? _selectedDestinationBranchId;
  List<TransactionItem> _items = [];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(transferCreateLoadingProvider);
    final stocksAsync = ref.watch(stockProvider);

    // Listen to events for navigation
    ref.listen<TransferUiEvent?>(
      transferUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is TransferCreated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(transferUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.createTransfer,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info banner
              Container(
                padding: const EdgeInsets.all(AppSizes.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: Text(
                        'This will create a Transfer Out from your current branch to the destination branch.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.xxl),
              // Destination Branch selector
              BranchSelector(
                selectedId: _selectedDestinationBranchId,
                onChanged: (id) => setState(() => _selectedDestinationBranchId = id),
                label: 'Destination Branch *',
              ),
              const SizedBox(height: AppSizes.xxl),
              // Items section
              _buildItemsSection(stocksAsync),
              const SizedBox(height: AppSizes.xxl),
              // Notes
              CustomTextField(
                labelText: '${l10n.notes} (${l10n.optional})',
                controller: _notesController,
              ),
              const SizedBox(height: AppSizes.xxxl),
              // Submit button
              CustomButton(
                text: l10n.createTransfer,
                isLoading: creating,
                onPressed: creating ? null : _handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsSection(AsyncValue<List<Stock>> stocksAsync) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.items,
                style: theme.textTheme.titleLarge,
              ),
            ),
            OutlinedButton.icon(
              onPressed: _showItemSelector,
              icon: const Icon(Icons.add),
              label: Text(l10n.addItem),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.lg),
        if (_items.isEmpty)
          Container(
            padding: const EdgeInsets.all(AppSizes.xxxl),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 48,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  Text(
                    l10n.noItemsFound,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          stocksAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (stocks) {
              return Column(
                children: List.generate(
                  _items.length,
                  (index) {
                    final stock = stocks.firstWhere(
                      (s) => s.itemId == _items[index].itemId,
                      orElse: () => stocks.first,
                    );
                    return TransactionItemCard(
                      stock: stock,
                      item: _items[index],
                      transactionType: TransactionType.sale, // Use 'sale' type for transfers to validate quantity
                      onChanged: (updatedItem) {
                        setState(() {
                          _items[index] = updatedItem;
                        });
                      },
                      onRemove: () {
                        setState(() {
                          _items.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              );
            },
            error: (error, stack) => const SizedBox.shrink(),
          ),
      ],
    );
  }

  void _showItemSelector() {
    // Get list of already selected item IDs
    final selectedItemIds = _items.map((item) => item.itemId).toList();
    
    showDialog(
      context: context,
      builder: (context) => ItemSelectorModal(
        selectedItemIds: selectedItemIds,
        onItemSelected: (stock) {
          setState(() {
            _items.add(
              TransactionItem(
                itemId: stock.itemId,
                taxRate: stock.item.taxRate.toDouble(),
                batches: [],
              ),
            );
          });
        },
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDestinationBranchId == null) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning('Please select a destination branch');
      return;
    }

    if (_items.isEmpty) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning('Please add at least one item');
      return;
    }

    // Validate items have batches
    for (var item in _items) {
      if (item.batches.isEmpty) {
        final snackbar = ref.read(snackbarServiceProvider);
        snackbar.showWarning('Each item must have at least one batch');
        return;
      }
    }

    // Build transfer data (domain entity)
    final data = TransferData(
      destinationBranchId: _selectedDestinationBranchId!,
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      items: _items,
    );

    // Validate transfer data
    final validationError = data.validate();
    if (validationError != null) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning(validationError);
      return;
    }

    // Submit transfer
    await ref.read(transferProvider.notifier).createTransfer(
          data: data,
        );
  }
}

