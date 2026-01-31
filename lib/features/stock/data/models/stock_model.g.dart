// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockModel _$StockModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StockModel', json, ($checkedConvert) {
  final val = _StockModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
    branchId: $checkedConvert('branchId', (v) => (v as num).toInt()),
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    item: $checkedConvert(
      'item',
      (v) => ItemModel.fromJson(v as Map<String, dynamic>),
    ),
    totalQuantity: $checkedConvert('totalQuantity', (v) => v as String? ?? '0'),
    lowStockThreshold: $checkedConvert(
      'lowStockThreshold',
      (v) => v as String? ?? '0',
    ),
    lowStockStatus: $checkedConvert(
      'lowStockStatus',
      (v) => _stockStatusFromJson(v),
    ),
    location: $checkedConvert('location', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    branchStockBatches: $checkedConvert(
      'branchStockBatches',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => StockBatchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'item': instance.item.toJson(),
      'totalQuantity': instance.totalQuantity,
      'lowStockThreshold': instance.lowStockThreshold,
      'lowStockStatus': _$StockStatusEnumMap[instance.lowStockStatus]!,
      'location': ?instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'branchStockBatches': instance.branchStockBatches
          .map((e) => e.toJson())
          .toList(),
    };

const _$StockStatusEnumMap = {
  StockStatus.inactive: 'inactive',
  StockStatus.critical: 'critical',
  StockStatus.ignored: 'ignored',
  StockStatus.newStatus: 'newStatus',
};
