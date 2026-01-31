// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionDetailResponseModel _$TransactionDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionDetailResponseModel', json, ($checkedConvert) {
  final val = _TransactionDetailResponseModel(
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
    attachments: $checkedConvert(
      'attachments',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    payment: $checkedConvert(
      'payment',
      (v) => v == null
          ? null
          : PaymentDetailModel.fromJson(v as Map<String, dynamic>),
    ),
    transactionItems: $checkedConvert(
      'transactionItems',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                TransactionItemDetailModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$TransactionDetailResponseModelToJson(
  _TransactionDetailResponseModel instance,
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
  'attachments': instance.attachments,
  'payment': ?instance.payment?.toJson(),
  'transactionItems': instance.transactionItems.map((e) => e.toJson()).toList(),
};

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.sale: 'sale',
  TransactionType.adjustment: 'adjustment',
  TransactionType.purchaseReverse: 'purchaseReverse',
  TransactionType.saleReverse: 'saleReverse',
};
