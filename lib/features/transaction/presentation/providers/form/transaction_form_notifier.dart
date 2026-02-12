import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../core/enums/payment_method_type_enum.dart';
import '../../../data/models/create_trans_request.dart';
import '../../../data/models/payment_method_model.dart';
import '../../../../item/domain/entities/item_with_batches.dart';
import 'transaction_form_state.dart';

part 'transaction_form_notifier.g.dart';

@riverpod
class TransactionFormNotifier extends _$TransactionFormNotifier {
  @override
  TransactionFormState build() {
    return TransactionFormState.initial();
  }

  /// Set transaction type
  void setTransactionType(TransactionType type) {
    final currentRequest = state.request;
    final newRequest = currentRequest.copyWith(
      transactionType: type,
    );
    // Clear customer/supplier if type changes and no longer required
    CreateTransRequest finalRequest;
    if (!type.requiresCustomerOrSupplier()) {
      finalRequest = newRequest.copyWith(
        customerId: null,
        supplierId: null,
      );
    } else {
      finalRequest = newRequest;
    }

    state = state.copyWith(request: finalRequest);
  }

  /// Set supplier
  void setSupplier(int? supplierId) {
    state = state.copyWith(
      request: state.request.copyWith(supplierId: supplierId),
    );
  }

  /// Set customer
  void setCustomer(int? customerId) {
    state = state.copyWith(
      request: state.request.copyWith(customerId: customerId),
    );
  }

  /// Set notes
  void setNotes(String? notes) {
    state = state.copyWith(
      request: state.request.copyWith(notes: notes),
    );
  }

  // ============================================================================
  // CART METHODS (same pattern as transfer + price per batch)
  // ============================================================================

  void addToCart(ItemWithBatches item) {
    final cartItems = Map<int, ItemWithBatches>.from(state.cartItems);
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    cartItems[item.id] = item;
    if (!cartItemBatches.containsKey(item.id)) {
      cartItemBatches[item.id] = [];
    }
    state = state.copyWith(
      cartItems: cartItems,
      cartItemBatches: cartItemBatches,
    );
  }

  void deleteFromCart(int itemId) {
    final cartItems = Map<int, ItemWithBatches>.from(state.cartItems);
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    cartItems.remove(itemId);
    cartItemBatches.remove(itemId);
    state = state.copyWith(
      cartItems: cartItems,
      cartItemBatches: cartItemBatches,
    );
  }

  bool isInCart(int itemId) => state.cartItems.containsKey(itemId);

  void setItemIdsRequiringBatch(List<int> itemIds) {
    state = state.copyWith(itemIdsRequiringBatch: itemIds);
  }

  void addBatchToItem(
    int itemId,
    String batchNumber,
    int quantity, {
    double? costPrice,
    double? unitPrice,
  }) {
    if (quantity <= 0) return;
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransactionBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    list.add(CreateTransactionBatchRequest(
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
    ));
    cartItemBatches[itemId] = list;
    final clearedRequiring =
        state.itemIdsRequiringBatch.where((id) => id != itemId).toList();
    state = state.copyWith(
      cartItemBatches: cartItemBatches,
      itemIdsRequiringBatch: clearedRequiring,
    );
  }

  void removeBatchFromItem(int itemId, int index) {
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransactionBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      cartItemBatches[itemId] = list;
      if (list.isEmpty) {
        cartItemBatches.remove(itemId);
      }
      state = state.copyWith(cartItemBatches: cartItemBatches);
    }
  }

  void updateBatchQuantity(int itemId, int index, int quantity) {
    if (quantity <= 0) return;
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransactionBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    if (index >= 0 && index < list.length) {
      final batch = list[index];
      list[index] = CreateTransactionBatchRequest(
        batchNumber: batch.batchNumber,
        quantity: quantity,
        costPrice: batch.costPrice,
        unitPrice: batch.unitPrice,
      );
      cartItemBatches[itemId] = list;
      state = state.copyWith(cartItemBatches: cartItemBatches);
    }
  }

  void updateBatchPrice(int itemId, int index, {double? costPrice, double? unitPrice}) {
    final cartItemBatches =
        Map<int, List<CreateTransactionBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransactionBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    if (index >= 0 && index < list.length) {
      final batch = list[index];
      list[index] = CreateTransactionBatchRequest(
        batchNumber: batch.batchNumber,
        quantity: batch.quantity,
        costPrice: costPrice ?? batch.costPrice,
        unitPrice: unitPrice ?? batch.unitPrice,
      );
      cartItemBatches[itemId] = list;
      state = state.copyWith(cartItemBatches: cartItemBatches);
    }
  }

  List<CreateTransactionBatchRequest> getBatchesForItem(int itemId) {
    return state.cartItemBatches[itemId] ?? [];
  }

  /// Get total amount of cart from batch quantities and prices (sale: unitPrice, purchase/import: costPrice)
  double getTotal() {
    final type = state.request.transactionType;
    double total = 0.0;
    for (final batches in state.cartItemBatches.values) {
      for (final batch in batches) {
        if (type == TransactionType.sale) {
          total += (batch.unitPrice ?? 0) * batch.quantity;
        } else if (type == TransactionType.purchase || type == TransactionType.imported) {
          total += (batch.costPrice ?? 0) * batch.quantity;
        }
      }
    }
    return total;
  }

  /// Get total paid amount from payment methods
  double getTotalPaid() {
    final paymentMethods = state.request.paymentMethods ?? [];
    double totalPaid = 0.0;
    for (final paymentMethod in paymentMethods) {
      totalPaid += paymentMethod.amount;
    }
    return totalPaid;
  }

  /// Get cart item count (unique items)
  int getCartItemCount() {
    return state.cartItems.length;
  }

  /// Add payment method
  void addPaymentMethod(PaymentMethodModel paymentMethod) {
    final methods = List<PaymentMethodModel>.from(state.request.paymentMethods ?? []);
    methods.add(paymentMethod);
    
    // Store attachment file path if exists (attachment field contains file path before upload)
    final attachmentPaths = Map<String, String>.from(state.paymentAttachmentFilePaths);
    if (paymentMethod.attachment != null && paymentMethod.attachment!.isNotEmpty) {
      // Check if it's a file path (not URL)
      if (!paymentMethod.attachment!.startsWith('http')) {
        final methodType = paymentMethod.method;
        attachmentPaths[methodType] = paymentMethod.attachment!;
      }
    }
    
    state = state.copyWith(
      request: state.request.copyWith(paymentMethods: methods),
      paymentAttachmentFilePaths: attachmentPaths,
    );
  }

  /// Remove payment method at index
  void removePaymentMethod(int index) {
    final methods = List<PaymentMethodModel>.from(state.request.paymentMethods ?? []);
    if (index < 0 || index >= methods.length) return;
    final removed = methods.removeAt(index);
    
    // Also remove associated attachment file path if exists
    final attachmentPaths = Map<String, String>.from(state.paymentAttachmentFilePaths);
    final methodType = PaymentMethodTypeExtension.fromString(removed.method).toApiString();
    attachmentPaths.remove(methodType);
    
    state = state.copyWith(
      request: state.request.copyWith(paymentMethods: methods.isEmpty ? null : methods),
      paymentAttachmentFilePaths: attachmentPaths,
    );
  }

  /// Update payment method at index
  void updatePaymentMethod(int index, PaymentMethodModel paymentMethod) {
    final methods = List<PaymentMethodModel>.from(state.request.paymentMethods ?? []);
    if (index < 0 || index >= methods.length) return;
    
    // Remove old attachment path if method type changed
    final oldMethod = methods[index];
    final attachmentPaths = Map<String, String>.from(state.paymentAttachmentFilePaths);
    if (oldMethod.method != paymentMethod.method) {
      attachmentPaths.remove(oldMethod.method);
    }
    
    // Store new attachment file path if exists
    if (paymentMethod.attachment != null && paymentMethod.attachment!.isNotEmpty) {
      // Check if it's a file path (not URL)
      if (!paymentMethod.attachment!.startsWith('http')) {
        attachmentPaths[paymentMethod.method] = paymentMethod.attachment!;
      }
    } else {
      // Remove if attachment was cleared
      attachmentPaths.remove(paymentMethod.method);
    }
    
    methods[index] = paymentMethod;
    state = state.copyWith(
      request: state.request.copyWith(paymentMethods: methods),
      paymentAttachmentFilePaths: attachmentPaths,
    );
  }

  /// Add receipt file path
  void addReceipt(String filePath) {
    final receipts = List<String>.from(state.receiptFilePaths);
    if (!receipts.contains(filePath)) {
      receipts.add(filePath);
      state = state.copyWith(receiptFilePaths: receipts);
    }
  }

  /// Remove receipt file path
  void removeReceipt(String filePath) {
    final receipts = List<String>.from(state.receiptFilePaths);
    receipts.remove(filePath);
    state = state.copyWith(receiptFilePaths: receipts);
  }

  /// Add payment method attachment file path
  void addPaymentAttachment(String methodType, String filePath) {
    final attachments = Map<String, String>.from(state.paymentAttachmentFilePaths);
    attachments[methodType] = filePath;
    state = state.copyWith(paymentAttachmentFilePaths: attachments);
  }

  /// Remove payment method attachment file path
  void removePaymentAttachment(String methodType) {
    final attachments = Map<String, String>.from(state.paymentAttachmentFilePaths);
    attachments.remove(methodType);
    state = state.copyWith(paymentAttachmentFilePaths: attachments);
  }

  /// Build CreateTransRequest from current state (for submission)
  CreateTransRequest buildRequest() {
    final items = <CreateTransItemRequest>[];
    for (final entry in state.cartItems.entries) {
      final itemId = entry.key;
      final batches = state.cartItemBatches[itemId] ?? [];
      if (batches.isEmpty) continue;
      items.add(CreateTransItemRequest(
        itemId: itemId,
        batches: batches,
      ));
    }
    return state.request.copyWith(items: items);
  }

  /// Reset form to initial state
  void reset() {
    state = TransactionFormState.initial();
  }

  /// Clear cart
  void clearCart() {
    state = state.copyWith(
      cartItems: const {},
      cartItemBatches: const {},
      itemIdsRequiringBatch: const [],
    );
  }
}
