import '../../domain/entities/transfer.dart';
import '../../domain/entities/transfer_data.dart';
import '../models/transfer_response_model.dart';
import '../models/transfer_model.dart';
import '../models/transfer_item_model.dart';
import '../models/transfer_batch_model.dart';
import '../../../transaction/domain/entities/transaction_item.dart';
import '../../../transaction/domain/entities/transaction_batch.dart';

/// Extension to convert TransferResponseModel to Transfer entity
extension TransferResponseModelMapper on TransferResponseModel {
  Transfer toDomain() {
    return Transfer(
      id: id,
      transferType: transferType,
      transferNumber: transferNumber,
      status: status,
      sourceBranchId: sourceBranchId,
      destinationBranchId: destinationBranchId,
      relatedTransferId: relatedTransferId,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      sourceBranchName: sourceBranchName,
      destinationBranchName: destinationBranchName,
    );
  }
}

/// Extension to convert TransferData to TransferModel
extension TransferDataMapper on TransferData {
  TransferModel toModel() {
    return TransferModel(
      destinationBranchId: destinationBranchId,
      relatedTransferId: relatedTransferId,
      notes: notes,
      items: items.map((item) => item.toTransferItemModel()).toList(),
    );
  }
}

/// Extension to convert TransactionItem to TransferItemModel
extension TransactionItemToTransferMapper on TransactionItem {
  TransferItemModel toTransferItemModel() {
    return TransferItemModel(
      itemId: itemId,
      batches: batches.map((batch) => batch.toTransferBatchModel()).toList(),
    );
  }
}

/// Extension to convert TransactionBatch to TransferBatchModel
extension TransactionBatchToTransferMapper on TransactionBatch {
  TransferBatchModel toTransferBatchModel() {
    return TransferBatchModel(
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
      expirationDate: expirationDate,
      allocatedFrom: null,
    );
  }
}

