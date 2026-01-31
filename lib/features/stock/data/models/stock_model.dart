// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../item/data/models/item_model.dart';
import 'stock_batch_model.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

@freezed
sealed class StockModel with _$StockModel {
  const factory StockModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    required ItemModel item,
    @Default('0') String totalQuantity,
    @Default('0') String lowStockThreshold,
    @JsonKey(fromJson: _stockStatusFromJson) required StockStatus lowStockStatus,
    String? location,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
    @Default([]) List<StockBatchModel> branchStockBatches,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}

StockStatus _stockStatusFromJson(dynamic value) {
  if (value is String) {
    return StockStatusExtension.fromString(value);
  }
  return StockStatus.newStatus; // Default fallback
}

