// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockModel _$StockModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StockModel', json, ($checkedConvert) {
  final val = _StockModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
    branchId: $checkedConvert('branchId', (v) => (v as num).toInt()),
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    totalQuantity: $checkedConvert('totalQuantity', (v) => v as String),
    lowStockThreshold: $checkedConvert(
      'lowStockThreshold',
      (v) => v as String?,
    ),
    lowStockStatus: $checkedConvert('lowStockStatus', (v) => v as String),
    location: $checkedConvert('location', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    item: $checkedConvert(
      'item',
      (v) =>
          v == null ? null : StockItemModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$StockModelToJson(_StockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'itemId': instance.itemId,
      'totalQuantity': instance.totalQuantity,
      'lowStockThreshold': ?instance.lowStockThreshold,
      'lowStockStatus': instance.lowStockStatus,
      'location': ?instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'item': ?instance.item?.toJson(),
    };
