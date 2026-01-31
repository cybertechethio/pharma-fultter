// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionBatchModel _$TransactionBatchModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionBatchModel', json, ($checkedConvert) {
  final val = _TransactionBatchModel(
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num).toDouble()),
    costPrice: $checkedConvert('costPrice', (v) => (v as num).toDouble()),
    unitPrice: $checkedConvert('unitPrice', (v) => (v as num).toDouble()),
  );
  return val;
});

Map<String, dynamic> _$TransactionBatchModelToJson(
  _TransactionBatchModel instance,
) => <String, dynamic>{
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
  'costPrice': instance.costPrice,
  'unitPrice': instance.unitPrice,
};
