import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/stock_status_enum.dart';
import 'stock_item.dart';

part 'stock.freezed.dart';

@freezed
sealed class Stock with _$Stock {
  const factory Stock({
    required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    required String totalQuantity,
    String? lowStockThreshold,
    required StockStatus lowStockStatus,
    String? location,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    StockItem? item,
  }) = _Stock;
}

