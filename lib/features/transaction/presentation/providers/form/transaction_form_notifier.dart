import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../core/enums/payment_method_type_enum.dart';
import '../../../data/models/create_trans_request.dart';
import '../../../data/models/payment_method_model.dart';
import '../../../../item/domain/entities/item.dart';
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
  // CART METHODS
  // ============================================================================

  /// Add item to cart
  /// If qty is provided, it overrides existing quantity
  /// If qty is null, increments by 1
  void addToCart(Item item, int? qty) {
    final cartItems = Map<int, Item>.from(state.cartItems);
    final cartQuantities = Map<int, int>.from(state.cartQuantities);
    
    if (qty != null) {
      // Override quantity
      cartItems[item.id] = item;
      cartQuantities[item.id] = qty;
    } else {
      // Increment by 1
      cartItems[item.id] = item;
      final currentQty = cartQuantities[item.id] ?? 0;
      cartQuantities[item.id] = currentQty + 1;
    }
    
    state = state.copyWith(
      cartItems: cartItems,
      cartQuantities: cartQuantities,
    );
  }

  /// Remove from cart (decrease quantity by 1)
  void removeFromCart(int itemId) {
    final cartQuantities = Map<int, int>.from(state.cartQuantities);
    final currentQty = cartQuantities[itemId] ?? 0;
    
    if (currentQty <= 1) {
      // If qty is 1 or less, remove from cart completely
      deleteFromCart(itemId);
      return;
    }
    
    cartQuantities[itemId] = currentQty - 1;
    state = state.copyWith(cartQuantities: cartQuantities);
  }

  /// Delete item from cart completely
  void deleteFromCart(int itemId) {
    final cartItems = Map<int, Item>.from(state.cartItems);
    final cartQuantities = Map<int, int>.from(state.cartQuantities);
    
    cartItems.remove(itemId);
    cartQuantities.remove(itemId);
    
    state = state.copyWith(
      cartItems: cartItems,
      cartQuantities: cartQuantities,
    );
  }

  /// Check if item is in cart
  bool isInCart(int itemId) {
    return state.cartItems.containsKey(itemId);
  }

  /// Get quantity for item in cart
  int getQty(int itemId) {
    return state.cartQuantities[itemId] ?? 0;
  }

  /// Get total amount of cart
  double getTotal() {
    double total = 0.0;
    for (final entry in state.cartItems.entries) {
      final itemId = entry.key;
      final item = entry.value;
      final qty = state.cartQuantities[itemId] ?? 0;
      total += item.unitPrice * qty;
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
  /// Converts cartItems to CreateTransItemRequest list
  CreateTransRequest buildRequest() {
    final items = state.cartItems.entries.map((entry) {
      final itemId = entry.key;
      final qty = state.cartQuantities[itemId] ?? 1;
      return CreateTransItemRequest(
        itemId: itemId,
        quantity: qty.toDouble(),
      );
    }).toList();
    
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
      cartQuantities: const {},
    );
  }
}
