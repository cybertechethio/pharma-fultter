import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../item/domain/entities/item.dart';
import '../../../data/models/create_transfer_request.dart';
import 'transfer_form_state.dart';

part 'transfer_form_notifier.g.dart';

@riverpod
class TransferFormNotifier extends _$TransferFormNotifier {
  @override
  TransferFormState build() {
    return TransferFormState.initial();
  }

  /// Set destination branch
  void setDestinationBranch(int? branchId) {
    state = state.copyWith(
      request: state.request.copyWith(destinationBranchId: branchId),
    );
  }

  /// Set notes
  void setNotes(String? notes) {
    state = state.copyWith(
      request: state.request.copyWith(notes: notes?.isNotEmpty == true ? notes : null),
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

  /// Get cart item count (unique items)
  int getCartItemCount() {
    return state.cartItems.length;
  }

  /// Build CreateTransferRequest from current state (for submission)
  CreateTransferRequest buildRequest() {
    final items = state.cartItems.entries.map((entry) {
      final itemId = entry.key;
      final qty = state.cartQuantities[itemId] ?? 1;
      return CreateTransferItemRequest(
        itemId: itemId,
        quantity: qty.toDouble(),
      );
    }).toList();

    return state.request.copyWith(items: items);
  }

  /// Reset form to initial state
  void reset() {
    state = TransferFormState.initial();
  }

  /// Clear cart
  void clearCart() {
    state = state.copyWith(
      cartItems: const {},
      cartQuantities: const {},
    );
  }
}

