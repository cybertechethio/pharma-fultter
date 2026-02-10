import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../item/domain/entities/item_with_batches.dart';
import '../../../data/models/create_transfer_request.dart';
import 'transfer_form_state.dart';

part 'transfer_form_notifier.g.dart';

@riverpod
class TransferFormNotifier extends _$TransferFormNotifier {
  @override
  TransferFormState build() {
    return TransferFormState.initial();
  }

  void setDestinationBranch(int? branchId) {
    state = state.copyWith(
      request: state.request.copyWith(
        destinationBranchId: branchId ?? 0,
      ),
    );
  }

  void setNotes(String? notes) {
    state = state.copyWith(
      request: state.request.copyWith(
        notes: notes?.isNotEmpty == true ? notes : null,
      ),
    );
  }

  void addToCart(ItemWithBatches item) {
    final cartItems = Map<int, ItemWithBatches>.from(state.cartItems);
    final cartItemBatches =
        Map<int, List<CreateTransferBatchRequest>>.from(state.cartItemBatches);
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
        Map<int, List<CreateTransferBatchRequest>>.from(state.cartItemBatches);
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

  void addBatchToItem(int itemId, String batchNumber, int quantity) {
    if (quantity <= 0) return;
    final cartItemBatches =
        Map<int, List<CreateTransferBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransferBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    list.add(CreateTransferBatchRequest(
      batchNumber: batchNumber,
      quantity: quantity,
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
        Map<int, List<CreateTransferBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransferBatchRequest>.from(
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
        Map<int, List<CreateTransferBatchRequest>>.from(state.cartItemBatches);
    final list = List<CreateTransferBatchRequest>.from(
      cartItemBatches[itemId] ?? [],
    );
    if (index >= 0 && index < list.length) {
      final batch = list[index];
      list[index] = CreateTransferBatchRequest(
        batchNumber: batch.batchNumber,
        quantity: quantity,
      );
      cartItemBatches[itemId] = list;
      state = state.copyWith(cartItemBatches: cartItemBatches);
    }
  }

  List<CreateTransferBatchRequest> getBatchesForItem(int itemId) {
    return state.cartItemBatches[itemId] ?? [];
  }

  int getCartItemCount() => state.cartItems.length;

  CreateTransferRequest buildRequest() {
    final items = <CreateTransferItemRequest>[];
    for (final entry in state.cartItems.entries) {
      final itemId = entry.key;
      final batches = state.cartItemBatches[itemId] ?? [];
      if (batches.isEmpty) continue;
      items.add(CreateTransferItemRequest(
        itemId: itemId,
        batches: batches,
      ));
    }
    return state.request.copyWith(items: items);
  }

  void reset() {
    state = TransferFormState.initial();
  }

  void clearCart() {
    state = state.copyWith(
      cartItems: const {},
      cartItemBatches: const {},
      itemIdsRequiringBatch: const [],
    );
  }
}
