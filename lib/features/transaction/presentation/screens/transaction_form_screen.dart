import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../auth/presentation/providers/current_context_provider.dart';
import '../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../stock/presentation/providers/stocks_provider.dart';
import '../../../stock/domain/entities/stock.dart';
import '../../domain/entities/transaction_data.dart';
import '../../domain/entities/transaction_item.dart';
import '../../domain/entities/transaction_payment.dart';
import '../providers/transaction_notifier.dart';
import '../providers/transaction_events.dart';
import '../providers/transaction_loading_providers.dart';
import '../widgets/smart_header/smart_header_bar.dart';
import '../widgets/smart_header/type_selector_sheet.dart';
import '../widgets/smart_header/party_selector_sheet.dart';
import '../widgets/item_entry_card.dart';
import '../widgets/item_selector_modal.dart';
import '../widgets/receipt_upload_widget.dart';
import '../widgets/transaction_summary_footer.dart';
import 'payment_details_screen.dart';

class TransactionFormScreen extends ConsumerStatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  ConsumerState<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _notesController = TextEditingController();

  // Form state
  TransactionType? _selectedTransactionType = TransactionType.sale;
  int? _selectedCustomerId;
  int? _selectedSupplierId;
  String? _customerName;
  String? _supplierName;
  List<TransactionItem> _items = [];
  List<TransactionPayment> _paymentMethods = [];
  Map<String, String> _paymentAttachmentFilePaths = {};
  List<String> _receiptFilePaths = [];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  // Calculations
  double get _subtotal {
    double total = 0.0;
    for (final item in _items) {
      for (final batch in item.batches) {
        // For sales, use unit price; for purchase, use cost price
        final price = (_selectedTransactionType == TransactionType.sale)
            ? batch.unitPrice
            : batch.costPrice;
        total += batch.quantity * price;
      }
    }
    return total;
  }

  double get _taxAmount {
    double total = 0.0;
    for (final item in _items) {
      for (final batch in item.batches) {
        final price = (_selectedTransactionType == TransactionType.sale)
            ? batch.unitPrice
            : batch.costPrice;
        final lineTotal = batch.quantity * price;
        total += lineTotal * (item.taxRate / 100);
      }
    }
    return total;
  }

  double get _total => _subtotal + _taxAmount;

  bool get _canSubmit {
    if (_selectedTransactionType == null) return false;
    if (_items.isEmpty) return false;
    for (final item in _items) {
      if (item.batches.isEmpty) return false;
    }
    
    if (_selectedTransactionType!.requiresCustomerOrSupplier()) {
      if (_selectedTransactionType == TransactionType.sale && _selectedCustomerId == null) {
        return false;
      }
      if (_selectedTransactionType == TransactionType.purchase && _selectedSupplierId == null) {
        return false;
      }
    }
    
    if (_selectedTransactionType!.requiresPaymentMethods() && _paymentMethods.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    
    final creating = ref.watch(transactionCreateLoadingProvider);
    final stocksAsync = ref.watch(stockProvider);

    // Listen to transaction events for navigation
    ref.listen<TransactionUiEvent?>(
      transactionUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is TransactionCreated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(transactionUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: CustomAppBar(
        title: 'New Transaction',
      ),
      body: Column(
        children: [
          // Main scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Smart Header Bar
                  SmartHeaderBar(
                    selectedType: _selectedTransactionType,
                    selectedCustomerId: _selectedCustomerId,
                    selectedSupplierId: _selectedSupplierId,
                    customerName: _customerName,
                    supplierName: _supplierName,
                    payments: _paymentMethods,
                    itemCount: _items.length,
                    onTypeTap: _showTypeSelector,
                    onPartyTap: _showPartySelector,
                    onPaymentTap: _showPaymentScreen,
                    onItemsTap: _showItemSelector,
                  ),
                  const SizedBox(height: 24),

                  // Items Section
                  _buildItemsSection(theme, colorScheme, stocksAsync),

                  // Receipts Section (conditional)
                  if (_selectedTransactionType?.requiresReceipts() ?? false) ...[
                    const SizedBox(height: 24),
                    _buildReceiptsSection(theme, colorScheme),
                  ],

                  // Notes Section
                  const SizedBox(height: 24),
                  _buildNotesSection(theme, colorScheme),

                  // Bottom padding for footer
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Sticky Footer
          TransactionSummaryFooter(
            subtotal: _subtotal,
            taxAmount: _taxAmount,
            total: _total,
            isLoading: creating,
            canSubmit: _canSubmit,
            onSubmit: _handleSubmit,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsSection(
    ThemeData theme,
    ColorScheme colorScheme,
    AsyncValue<List<Stock>> stocksAsync,
  ) {
    // Items list or empty state (no header - controlled by header bar)
    if (_items.isEmpty) {
      return _buildEmptyItemsState(theme, colorScheme);
    }

    return stocksAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Center(
        child: Text('Error loading stocks: $error'),
      ),
      data: (stocks) {
        return Column(
          children: _items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final stock = stocks.firstWhere(
              (s) => s.itemId == item.itemId,
              orElse: () => stocks.first,
            );
            return ItemEntryCard(
              stock: stock,
              item: item,
              transactionType: _selectedTransactionType ?? TransactionType.sale,
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
          }).toList(),
        );
      },
    );
  }

  Widget _buildEmptyItemsState(ThemeData theme, ColorScheme colorScheme) {
    return GestureDetector(
      onTap: _showItemSelector,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colorScheme.outlineVariant.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_shopping_cart_rounded,
                size: 36,
                color: colorScheme.tertiary.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No items yet',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap here or the 📦 icon above to add items',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptsSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.receipt_long_rounded,
                color: colorScheme.tertiary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Receipts',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Optional',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ReceiptUploadWidget(
          filePaths: _receiptFilePaths,
          onChanged: (paths) => setState(() => _receiptFilePaths = paths),
        ),
      ],
    );
  }

  Widget _buildNotesSection(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.notes_rounded,
                color: colorScheme.secondary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Notes',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Optional',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add notes about this transaction...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  // Actions
  Future<void> _showTypeSelector() async {
    final result = await showTypeSelectorSheet(
      context,
      selectedType: _selectedTransactionType,
    );

    if (result != null && result != _selectedTransactionType) {
      setState(() {
        _selectedTransactionType = result;
        // Reset dependent fields when type changes
        _selectedCustomerId = null;
        _selectedSupplierId = null;
        _customerName = null;
        _supplierName = null;
        _paymentMethods = [];
        _paymentAttachmentFilePaths = {};
        _receiptFilePaths = [];
      });
    }
  }

  Future<void> _showPartySelector() async {
    if (_selectedTransactionType == null) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning('Please select a transaction type first');
      return;
    }

    if (!_selectedTransactionType!.requiresCustomerOrSupplier()) {
      return;
    }

    final partyType = _selectedTransactionType == TransactionType.purchase
        ? SupplierCustomerType.supplier
        : SupplierCustomerType.customer;

    final selectedId = _selectedTransactionType == TransactionType.purchase
        ? _selectedSupplierId
        : _selectedCustomerId;

    final result = await showPartySelectorSheet(
      context,
      partyType: partyType,
      selectedId: selectedId,
    );

    if (result != null) {
      final partyId = int.tryParse(result.id);
      setState(() {
        if (_selectedTransactionType == TransactionType.purchase) {
          _selectedSupplierId = partyId;
          _supplierName = result.name;
        } else {
          _selectedCustomerId = partyId;
          _customerName = result.name;
        }
      });
    }
  }

  void _showPaymentScreen() {
    if (_selectedTransactionType == null) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning('Please select a transaction type first');
      return;
    }

    if (!_selectedTransactionType!.requiresPaymentMethods()) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentDetailsScreen(
          totalAmount: _total,
          initialPayments: _paymentMethods,
          initialAttachments: _paymentAttachmentFilePaths,
          onSave: (payments, attachments) {
            setState(() {
              _paymentMethods = payments;
              _paymentAttachmentFilePaths = attachments;
            });
          },
        ),
      ),
    );
  }

  void _showItemSelector() {
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
    final snackbar = ref.read(snackbarServiceProvider);
    
    if (_selectedTransactionType == null) {
      snackbar.showWarning('Please select a transaction type');
      return;
    }

    if (_items.isEmpty) {
      snackbar.showWarning('Please add at least one item');
      return;
    }

    // Validate items have batches
    for (var item in _items) {
      if (item.batches.isEmpty) {
        snackbar.showWarning('Each item must have at least one batch');
        return;
      }
    }

    // Build transaction data
    final data = TransactionData(
      transactionType: _selectedTransactionType!,
      supplierId: _selectedSupplierId,
      customerId: _selectedCustomerId,
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      items: _items,
      paymentMethods: _selectedTransactionType!.requiresPaymentMethods()
          ? (_paymentMethods.isEmpty ? null : _paymentMethods)
          : null,
    );

    // Validate transaction data
    final validationError = data.validate();
    if (validationError != null) {
      snackbar.showWarning(validationError);
      return;
    }

    // Submit transaction
    await ref.read(transactionProvider.notifier).createTransaction(
          data: data,
          receiptFilePaths: _receiptFilePaths,
          paymentAttachmentFilePaths: _paymentAttachmentFilePaths,
        );
  }
}
