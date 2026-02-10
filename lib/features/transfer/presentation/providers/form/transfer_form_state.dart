import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../item/domain/entities/item_with_batches.dart';
import '../../../data/models/create_transfer_request.dart';

part 'transfer_form_state.freezed.dart';

@freezed
sealed class TransferFormState with _$TransferFormState {
  const TransferFormState._();

  const factory TransferFormState({
    required CreateTransferRequest request,
    @Default({}) Map<int, ItemWithBatches> cartItems,
    @Default({}) Map<int, List<CreateTransferBatchRequest>> cartItemBatches,
    @Default([]) List<int> itemIdsRequiringBatch,
  }) = _TransferFormState;

  factory TransferFormState.initial() {
    return TransferFormState(
      request: CreateTransferRequest(
        destinationBranchId: 0,
        notes: null,
        items: [],
      ),
    );
  }

  bool get isValid => request.validate() == null;
  String? get validationError => request.validate();
}
