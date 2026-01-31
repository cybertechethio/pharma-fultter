import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../transaction/domain/entities/transaction_item.dart';

part 'transfer_data.freezed.dart';

/// Data required to create a transfer (always transfer_out)
@freezed
sealed class TransferData with _$TransferData {
  const factory TransferData({
    required int destinationBranchId,
    int? relatedTransferId,
    String? notes,
    required List<TransactionItem> items,
  }) = _TransferData;
}

/// Extension methods for TransferData
extension TransferDataX on TransferData {
  /// Validate transfer data
  String? validate() {
    if (items.isEmpty) {
      return 'At least one item is required';
    }

    // Validate items have batches
    for (var item in items) {
      if (item.batches.isEmpty) {
        return 'Each item must have at least one batch';
      }
    }

    return null;
  }
}













