import '../../domain/entities/item_batch_summary.dart';
import '../../domain/entities/item_with_batches.dart';
import '../models/item_batch_summary_model.dart';
import '../models/item_with_batches_model.dart';

extension ItemBatchSummaryMapper on ItemBatchSummaryModel {
  ItemBatchSummary toDomain() {
    return ItemBatchSummary(
      id: id,
      batchNumber: batchNumber,
      batchName: batchName,
      costPrice: costPrice,
      unitPrice: unitPrice,
      quantity: quantity,
    );
  }
}

extension ItemWithBatchesMapper on ItemWithBatchesModel {
  ItemWithBatches toDomain() {
    return ItemWithBatches(
      id: id,
      name: name,
      code: code,
      batches: batches.map((b) => b.toDomain()).toList(),
    );
  }
}
