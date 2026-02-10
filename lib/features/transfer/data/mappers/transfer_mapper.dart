import '../../domain/entities/transfer.dart';
import '../../domain/entities/transfer_item.dart';
import '../../domain/entities/transfer_item_batch.dart';
import '../models/transfer_model.dart';
import '../models/transfer_item_model.dart';
import '../models/transfer_item_batch_model.dart';

/// Extension for mapping TransferItemBatchModel to TransferItemBatch entity
extension TransferItemBatchModelMapper on TransferItemBatchModel {
  TransferItemBatch toDomain() {
    return TransferItemBatch(
      id: id,
      transferItemId: transferItemId,
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
      expirationDate: expirationDate,
    );
  }
}

/// Extension for mapping TransferItemModel to TransferItem entity
extension TransferItemModelMapper on TransferItemModel {
  TransferItem toDomain() {
    return TransferItem(
      id: id,
      itemName: itemName,
      itemCode: itemCode,
      quantity: quantity,
      transferItemBatches: transferItemBatches.map((b) => b.toDomain()).toList(),
    );
  }
}

/// Extension for mapping TransferModel to Transfer entity
extension TransferModelMapper on TransferModel {
  Transfer toDomain() {
    return Transfer(
      id: id,
      transferNumber: transferNumber,
      sourceBranchId: sourceBranchId,
      destinationBranchId: destinationBranchId,
      status: status,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      sourceBranchName: sourceBranchName,
      destinationBranchName: destinationBranchName,
      creatorName: creatorName,
      updaterName: updaterName,
      transferItems: transferItems.map((item) => item.toDomain()).toList(),
    );
  }
}
