import '../../domain/entities/batch.dart';
import '../../domain/entities/batch_input.dart';
import '../models/batch_model.dart';
import '../models/batch_request_model.dart';

extension BatchInputMapper on BatchInput {
  /// Maps domain input to data-layer request model. For update, API service removes [itemId] from payload.
  BatchRequestModel toRequestModel({int? itemIdOverride}) {
    return BatchRequestModel(
      itemId: itemIdOverride ?? itemId ?? 0,
      batchName: batchName,
      costPrice: costPrice,
      unitPrice: unitPrice,
      expirationDate: expirationDate,
      manufacturingDate: manufacturingDate,
      supplierBatchNumber: supplierBatchNumber,
      notes: notes,
    );
  }
}

extension BatchMapper on BatchModel {
  BatchEntity toDomain() {
    return BatchEntity(
      id: id,
      itemId: itemId,
      batchNumber: batchNumber,
      batchName: batchName,
      itemName: itemName,
      itemCode: itemCode,
      expirationDate: expirationDate,
      manufacturingDate: manufacturingDate,
      costPrice: costPrice,
      unitPrice: unitPrice,
      supplierBatchNumber: supplierBatchNumber,
      notes: notes,
      isActive: isActive,
      quantity: quantity,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

