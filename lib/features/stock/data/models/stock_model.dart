// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'stock_item_model.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

@freezed
sealed class StockModel with _$StockModel {
  const factory StockModel({
    required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    required String totalQuantity,
    String? lowStockThreshold,
    required String lowStockStatus,
    String? location,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    StockItemModel? item,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}

