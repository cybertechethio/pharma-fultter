// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_trans_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionBatchRequest _$CreateTransactionBatchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransactionBatchRequest', json, ($checkedConvert) {
  final val = _CreateTransactionBatchRequest(
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    quantity: $checkedConvert(
      'quantity',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    costPrice: $checkedConvert(
      'costPrice',
      (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
    ),
    unitPrice: $checkedConvert(
      'unitPrice',
      (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransactionBatchRequestToJson(
  _CreateTransactionBatchRequest instance,
) => <String, dynamic>{
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
  'costPrice': ?instance.costPrice,
  'unitPrice': ?instance.unitPrice,
};

_CreateTransItemRequest _$CreateTransItemRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransItemRequest', json, ($checkedConvert) {
  final val = _CreateTransItemRequest(
    itemId: $checkedConvert(
      'itemId',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    batches: $checkedConvert(
      'batches',
      (v) => (v as List<dynamic>)
          .map(
            (e) => CreateTransactionBatchRequest.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransItemRequestToJson(
  _CreateTransItemRequest instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'batches': instance.batches.map((e) => e.toJson()).toList(),
};

_CreateTransRequest _$CreateTransRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransRequest', json, ($checkedConvert) {
  final val = _CreateTransRequest(
    transactionType: $checkedConvert(
      'transactionType',
      (v) => $enumDecode(_$TransactionTypeEnumMap, v),
    ),
    supplierId: $checkedConvert(
      'supplierId',
      (v) => JsonTypeConverters.intFromDynamicNullable(v),
    ),
    customerId: $checkedConvert(
      'customerId',
      (v) => JsonTypeConverters.intFromDynamicNullable(v),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
    attachments: $checkedConvert(
      'attachments',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map(
            (e) => CreateTransItemRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    paymentMethods: $checkedConvert(
      'paymentMethods',
      (v) => (v as List<dynamic>?)
          ?.map((e) => PaymentMethodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransRequestToJson(
  _CreateTransRequest instance,
) => <String, dynamic>{
  'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
  'supplierId': ?instance.supplierId,
  'customerId': ?instance.customerId,
  'notes': ?instance.notes,
  'attachments': instance.attachments,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'paymentMethods': ?instance.paymentMethods?.map((e) => e.toJson()).toList(),
};

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.imported: 'imported',
  TransactionType.sale: 'sale',
  TransactionType.adjustment: 'adjustment',
  TransactionType.waste: 'waste',
  TransactionType.damage: 'damage',
};
