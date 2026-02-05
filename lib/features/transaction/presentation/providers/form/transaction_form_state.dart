import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../data/models/create_trans_request.dart';
import '../../../../item/domain/entities/item.dart';


part 'transaction_form_state.freezed.dart';

@freezed
sealed class TransactionFormState with _$TransactionFormState {
  const TransactionFormState._();

  const factory TransactionFormState({
    required CreateTransRequest request,
    @Default([]) List<String> receiptFilePaths,
    @Default({}) Map<String, String> paymentAttachmentFilePaths,
    @Default({}) Map<int, Item> cartItems, // itemId -> Item for display
    @Default({}) Map<int, int> cartQuantities, // itemId -> quantity
  }) = _TransactionFormState;

  factory TransactionFormState.initial() {
    return TransactionFormState(
      request: CreateTransRequest(
        transactionType: TransactionType.sale, // Default type
        items: const [],
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
