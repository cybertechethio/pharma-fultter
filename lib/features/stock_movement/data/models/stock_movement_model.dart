// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/stock_movement_type_enum.dart';
import '../../../../core/enums/stock_movement_status_enum.dart';
import 'stock_movement_item_model.dart';

part 'stock_movement_model.freezed.dart';
part 'stock_movement_model.g.dart';

@freezed
sealed class StockMovementModel with _$StockMovementModel {
  const factory StockMovementModel({
    required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    int? transactionId,
    @JsonKey(fromJson: _typeFromJson) required StockMovementType type,
    required String quantity,
    String? previousStock,
    String? newStock,
    int? sourceBranchId,
    int? destinationBranchId,
    int? transferId,
    int? reversesMovementId,
    String? notes,
    @JsonKey(fromJson: _statusFromJson) required StockMovementStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updaterName,
    String? sourceBranchName,
    String? destinationBranchName,
    StockMovementItemModel? item,
  }) = _StockMovementModel;

  factory StockMovementModel.fromJson(Map<String, dynamic> json) =>
      _$StockMovementModelFromJson(json);
}

StockMovementType _typeFromJson(dynamic value) {
  if (value is String) {
    return StockMovementTypeExtension.fromString(value);
  }
  return StockMovementType.adjustment;
}

StockMovementStatus _statusFromJson(dynamic value) {
  if (value is String) {
    return StockMovementStatusExtension.fromString(value);
  }
  return StockMovementStatus.completed;
}
