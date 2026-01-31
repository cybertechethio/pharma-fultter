import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer.freezed.dart';

@freezed
sealed class Transfer with _$Transfer {
  const factory Transfer({
    required int id,
    required String transferType,
    required String transferNumber,
    required String status,
    int? sourceBranchId,
    int? destinationBranchId,
    int? relatedTransferId,
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
    String? sourceBranchName,
    String? destinationBranchName,
  }) = _Transfer;
}













