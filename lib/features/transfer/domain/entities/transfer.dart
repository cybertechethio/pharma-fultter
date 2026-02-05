import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transfer_type_enum.dart';
import 'transfer_item.dart';

part 'transfer.freezed.dart';

@freezed
sealed class Transfer with _$Transfer {
  const factory Transfer({
    required int id,
    required int companyId,
    required TransferType transferType,
    required String transferNumber,
    required String status,
    int? sourceBranchId,
    String? sourceBranch,
    int? destinationBranchId,
    String? destinationBranch,
    int? relatedTransferId,
    int? transferId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updatorName,
    @Default([]) List<TransferItem> transferItems,
  }) = _Transfer;
}

