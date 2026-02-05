// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_trans_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransItemRequest _$CreateTransItemRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransItemRequest', json, ($checkedConvert) {
  final val = _CreateTransItemRequest(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    quantity: $checkedConvert(
      'quantity',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransItemRequestToJson(
  _CreateTransItemRequest instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'quantity': instance.quantity,
};

_CreateTransRequest _$CreateTransRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransRequest', json, ($checkedConvert) {
  final val = _CreateTransRequest(
    transactionType: $checkedConvert(
      'transactionType',
      (v) => $enumDecode(_$TransactionTypeEnumMap, v),
    ),
    supplierId: $checkedConvert('supplierId', (v) => (v as num?)?.toInt()),
    customerId: $checkedConvert('customerId', (v) => (v as num?)?.toInt()),
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
  TransactionType.sale: 'sale',
  TransactionType.using: 'using',
  TransactionType.adjustment: 'adjustment',
  TransactionType.waste: 'waste',
  TransactionType.damage: 'damage',
  TransactionType.producing: 'producing',
  TransactionType.reverse: 'reverse',
};
