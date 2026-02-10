import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_item.dart';

part 'transfer.freezed.dart';

@freezed
sealed class Transfer with _$Transfer {
  const factory Transfer({
    required int id,
    required String transferNumber,
    required int sourceBranchId,
    required int destinationBranchId,
    required String status,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? sourceBranchName,
    String? destinationBranchName,
    String? creatorName,
    String? updaterName,
    @Default([]) List<TransferItem> transferItems,
  }) = _Transfer;
}
