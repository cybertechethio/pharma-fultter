import '../../domain/entities/batch.dart';
import '../models/batch_model.dart';

extension BatchMapper on BatchModel {
  BatchEntity toDomain() {
    return BatchEntity(
      id: id,
      companyId: companyId,
      itemId: itemId,
      batchNumber: batchNumber,
      batchName: batchName,
      itemName: itemName,
      expirationDate: expirationDate,
      manufacturingDate: manufacturingDate,
      costPrice: costPrice,
      supplierBatchNumber: supplierBatchNumber,
      notes: notes,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

