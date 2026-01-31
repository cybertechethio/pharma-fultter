// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionResponseModel _$TransactionResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionResponseModel', json, ($checkedConvert) {
  final val = _TransactionResponseModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    transactionType: $checkedConvert(
      'transactionType',
      (v) => _transactionTypeFromJson(v),
    ),
    transactionNumber: $checkedConvert('transactionNumber', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    subtotal: $checkedConvert(
      'subtotal',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalTax: $checkedConvert(
      'totalTax',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalAmount: $checkedConvert(
      'totalAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
    createdAt: $checkedConvert(
      'createdAt',
      (v) => JsonTypeConverters.dateTimeFromDynamic(v),
    ),
    creatorName: $checkedConvert('creatorName', (v) => v as String?),
    supplierName: $checkedConvert('supplierName', (v) => v as String?),
    customerName: $checkedConvert('customerName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$TransactionResponseModelToJson(
  _TransactionResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
  'transactionNumber': instance.transactionNumber,
  'status': instance.status,
  'subtotal': instance.subtotal,
  'totalTax': instance.totalTax,
  'totalAmount': instance.totalAmount,
  'notes': ?instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'creatorName': ?instance.creatorName,
  'supplierName': ?instance.supplierName,
  'customerName': ?instance.customerName,
};

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.sale: 'sale',
  TransactionType.adjustment: 'adjustment',
  TransactionType.purchaseReverse: 'purchaseReverse',
  TransactionType.saleReverse: 'saleReverse',
};
