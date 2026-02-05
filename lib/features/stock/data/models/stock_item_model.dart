// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item_model.freezed.dart';
part 'stock_item_model.g.dart';

@freezed
sealed class StockItemModel with _$StockItemModel {
  const factory StockItemModel({
    required int id,
    required String name,
    String? code,
    String? categories,
    String? subCategories,
    String? brands,
    String? units,
    String? models,
    String? color,
    String? size,
    String? material,
    String? weight,
    String? unitPrice,
  }) = _StockItemModel;

  factory StockItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemModelFromJson(json);
}

