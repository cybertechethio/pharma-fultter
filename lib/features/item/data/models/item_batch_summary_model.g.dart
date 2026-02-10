// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_batch_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemBatchSummaryModel _$ItemBatchSummaryModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ItemBatchSummaryModel', json, ($checkedConvert) {
  final val = _ItemBatchSummaryModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    batchName: $checkedConvert('batchName', (v) => v as String?),
    costPrice: $checkedConvert(
      'costPrice',
      (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
    ),
    unitPrice: $checkedConvert(
      'unitPrice',
      (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
    ),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ItemBatchSummaryModelToJson(
  _ItemBatchSummaryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'batchNumber': instance.batchNumber,
  'batchName': ?instance.batchName,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
  'quantity': instance.quantity,
};
