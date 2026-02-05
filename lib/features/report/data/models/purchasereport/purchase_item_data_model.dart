// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/json_type_converters.dart';

part 'purchase_item_data_model.freezed.dart';
part 'purchase_item_data_model.g.dart';

@freezed
sealed class PurchaseItemDataModel with _$PurchaseItemDataModel {
  const factory PurchaseItemDataModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String transactionNumber,
    required DateTime date,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)
    required int? supplierId,
    required String? supplierName,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int itemId,
    required String itemName,
    String? itemCode,
    String? sku,
    String? category,
    String? brand,
    String? imageUrl,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int quantity,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double unitPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)
    double? costPrice,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double subtotal,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double taxAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    String? paymentMethod,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int branchId,
    required String branchName,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int instockQty,
  }) = _PurchaseItemDataModel;

  factory PurchaseItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemDataModelFromJson(json);
}

