// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransactionModel', json, ($checkedConvert) {
      final val = _TransactionModel(
        transactionType: $checkedConvert(
          'transactionType',
          (v) => $enumDecode(_$TransactionTypeEnumMap, v),
        ),
        supplierId: $checkedConvert('supplierId', (v) => (v as num?)?.toInt()),
        customerId: $checkedConvert('customerId', (v) => (v as num?)?.toInt()),
        branchId: $checkedConvert('branchId', (v) => (v as num?)?.toInt()),
        notes: $checkedConvert('notes', (v) => v as String?),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => TransactionItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        paymentMethods: $checkedConvert(
          'paymentMethods',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) =>
                    TransactionPaymentModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransactionModelToJson(
  _TransactionModel instance,
) => <String, dynamic>{
  'transactionType': _transactionTypeToJson(instance.transactionType),
  'supplierId': ?instance.supplierId,
  'customerId': ?instance.customerId,
  'branchId': ?instance.branchId,
  'notes': ?instance.notes,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'paymentMethods': ?instance.paymentMethods?.map((e) => e.toJson()).toList(),
  'attachments': ?instance.attachments,
};

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.sale: 'sale',
  TransactionType.adjustment: 'adjustment',
  TransactionType.purchaseReverse: 'purchaseReverse',
  TransactionType.saleReverse: 'saleReverse',
};
