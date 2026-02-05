import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../item/domain/entities/item.dart';
import '../../../data/models/create_transfer_request.dart';
import '../../../../../core/enums/transfer_type_enum.dart';

part 'transfer_form_state.freezed.dart';

@freezed
sealed class TransferFormState with _$TransferFormState {
  const TransferFormState._();

  const factory TransferFormState({
    required CreateTransferRequest request,
    @Default({}) Map<int, Item> cartItems, // itemId -> Item for display
    @Default({}) Map<int, int> cartQuantities, // itemId -> quantity
  }) = _TransferFormState;

  factory TransferFormState.initial() {
    return TransferFormState(
      request: CreateTransferRequest(
        transferType: TransferType.transferOut, // Always transfer_out
        destinationBranchId: null,
        items: [],
      ),
    );
  }

  /// Check if form is valid for submission
  bool get isValid {
    return request.validate() == null;
  }

  /// Get validation error message
  String? get validationError {
    return request.validate();
  }
}

