import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../item/domain/entities/item.dart';
import 'stock_batch.dart';

part 'stock.freezed.dart';

@freezed
sealed class Stock with _$Stock {
  const factory Stock({
    required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    required Item item,
    required String totalQuantity,
    required String lowStockThreshold,
    required StockStatus lowStockStatus,
    String? location,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
    required List<StockBatch> branchStockBatches,
  }) = _Stock;
}

