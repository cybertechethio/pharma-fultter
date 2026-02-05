// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_operation_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchOperationItemModel _$BatchOperationItemModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BatchOperationItemModel', json, ($checkedConvert) {
  final val = _BatchOperationItemModel(
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
    costPrice: $checkedConvert('costPrice', (v) => (v as num?)?.toDouble()),
    unitPrice: $checkedConvert('unitPrice', (v) => (v as num?)?.toDouble()),
    expirationDate: $checkedConvert('expirationDate', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BatchOperationItemModelToJson(
  _BatchOperationItemModel instance,
) => <String, dynamic>{
  'batchNumber': instance.batchNumber,
  'quantity': ?instance.quantity,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
  'expirationDate': ?instance.expirationDate,
};
