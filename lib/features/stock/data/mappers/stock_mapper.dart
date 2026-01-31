import '../../domain/entities/stock.dart';
import '../../domain/entities/stock_batch.dart';
import '../../../item/data/mappers/item_mapper.dart';
import '../models/stock_model.dart';
import '../models/stock_batch_model.dart';

extension StockBatchMapper on StockBatchModel {
  StockBatch toDomain() {
    return StockBatch(
      id: id,
      batchId: batchId,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
      lastUsedAt: lastUsedAt,
      batchNumber: batchNumber,
      batchName: batchName,
      expirationDate: expirationDate,
    );
  }
}

extension StockMapper on StockModel {
  Stock toDomain() {
    return Stock(
      id: id,
      companyId: companyId,
      branchId: branchId,
      itemId: itemId,
      item: item.toDomain(),
      totalQuantity: totalQuantity,
      lowStockThreshold: lowStockThreshold,
      lowStockStatus: lowStockStatus, // Already StockStatus enum from model
      location: location,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      branchStockBatches: branchStockBatches.map((b) => b.toDomain()).toList(),
    );
  }
}

