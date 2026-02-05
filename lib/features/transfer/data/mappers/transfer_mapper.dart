import '../../domain/entities/transfer.dart';
import '../../domain/entities/transfer_item.dart';
import '../../../../core/enums/transfer_type_enum.dart';
import '../models/transfer_model.dart';
import '../models/transfer_item_model.dart';

/// Extension for mapping TransferItemModel to TransferItem entity
extension TransferItemModelMapper on TransferItemModel {
  TransferItem toDomain() {
    return TransferItem(
      id: id,
      itemName: itemName,
      itemCode: itemCode,
      quantity: quantity,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Extension for mapping TransferModel to Transfer entity
extension TransferModelMapper on TransferModel {
  Transfer toDomain() {
    return Transfer(
      id: id,
      companyId: companyId,
      transferType: TransferTypeExtension.fromString(transferType),
      transferNumber: transferNumber,
      status: status,
      sourceBranchId: sourceBranchId,
      sourceBranch: sourceBranch,
      destinationBranchId: destinationBranchId,
      destinationBranch: destinationBranch,
      relatedTransferId: relatedTransferId,
      transferId: transferId,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      creatorName: creatorName,
      updatorName: updatorName,
      transferItems: transferItems.map((item) => item.toDomain()).toList(),
    );
  }
}

