// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionItemDetailModel _$TransactionItemDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TransactionItemDetailModel',
  json,
  ($checkedConvert) {
    final val = _TransactionItemDetailModel(
      id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
      itemId: $checkedConvert(
        'itemId',
        (v) => JsonTypeConverters.intFromDynamic(v),
      ),
      itemName: $checkedConvert('itemName', (v) => v as String),
      itemCode: $checkedConvert('itemCode', (v) => v as String),
      quantity: $checkedConvert(
        'quantity',
        (v) => JsonTypeConverters.doubleFromDynamic(v),
      ),
      taxRate: $checkedConvert(
        'taxRate',
        (v) => JsonTypeConverters.intFromDynamic(v),
      ),
      total: $checkedConvert(
        'total',
        (v) => JsonTypeConverters.doubleFromDynamic(v),
      ),
      createdAt: $checkedConvert(
        'createdAt',
        (v) => JsonTypeConverters.dateTimeFromDynamic(v),
      ),
      batches: $checkedConvert(
        'transactionItemBatches',
        (v) => _batchesFromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'batches': 'transactionItemBatches'},
);

Map<String, dynamic> _$TransactionItemDetailModelToJson(
  _TransactionItemDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'itemId': instance.itemId,
  'itemName': instance.itemName,
  'itemCode': instance.itemCode,
  'quantity': instance.quantity,
  'taxRate': instance.taxRate,
  'total': instance.total,
  'createdAt': instance.createdAt.toIso8601String(),
  'transactionItemBatches': instance.batches.map((e) => e.toJson()).toList(),
};
