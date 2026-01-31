// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_batch_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionItemBatchDetailModel _$TransactionItemBatchDetailModelFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('_TransactionItemBatchDetailModel', json, ($checkedConvert) {
      final val = _TransactionItemBatchDetailModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        batchNumber: $checkedConvert('batchNumber', (v) => v as String),
        quantity: $checkedConvert(
          'quantity',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        costPrice: $checkedConvert(
          'costPrice',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        taxableAmount: $checkedConvert(
          'taxableAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        taxAmount: $checkedConvert(
          'taxAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        total: $checkedConvert(
          'total',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        expirationDate: $checkedConvert(
          'expirationDate',
          (v) => JsonTypeConverters.dateTimeFromDynamicNullable(v),
        ),
        allocatedFrom: $checkedConvert('allocatedFrom', (v) => v as String),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => JsonTypeConverters.dateTimeFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransactionItemBatchDetailModelToJson(
  _TransactionItemBatchDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
  'costPrice': instance.costPrice,
  'unitPrice': instance.unitPrice,
  'taxableAmount': instance.taxableAmount,
  'taxAmount': instance.taxAmount,
  'total': instance.total,
  'expirationDate': ?instance.expirationDate?.toIso8601String(),
  'allocatedFrom': instance.allocatedFrom,
  'createdAt': instance.createdAt.toIso8601String(),
};
