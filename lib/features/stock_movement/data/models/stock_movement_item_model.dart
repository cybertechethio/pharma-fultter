// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_movement_item_model.freezed.dart';
part 'stock_movement_item_model.g.dart';

@freezed
sealed class StockMovementItemModel with _$StockMovementItemModel {
  const factory StockMovementItemModel({
    required int id,
    required String name,
    String? code,
  }) = _StockMovementItemModel;

  factory StockMovementItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockMovementItemModelFromJson(json);
}

