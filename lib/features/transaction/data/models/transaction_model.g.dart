// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionModel', json, ($checkedConvert) {
  final val = _TransactionModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    transactionType: $checkedConvert('transactionType', (v) => v as String),
    transactionNumber: $checkedConvert('transactionNumber', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    supplierId: $checkedConvert('supplierId', (v) => (v as num?)?.toInt()),
    customerId: $checkedConvert('customerId', (v) => (v as num?)?.toInt()),
    supplierName: $checkedConvert('supplierName', (v) => v as String?),
    customerName: $checkedConvert('customerName', (v) => v as String?),
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
    attachments: $checkedConvert(
      'attachments',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    creatorName: $checkedConvert('creatorName', (v) => v as String?),
    updatorName: $checkedConvert('updatorName', (v) => v as String?),
    items: $checkedConvert(
      'items',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => TransItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    payment: $checkedConvert(
      'payment',
      (v) =>
          v == null ? null : PaymentModel.fromJson(v as Map<String, dynamic>),
    ),
    refund: $checkedConvert(
      'refund',
      (v) =>
          v == null ? null : PaymentModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionType': instance.transactionType,
      'transactionNumber': instance.transactionNumber,
      'status': instance.status,
      'supplierId': ?instance.supplierId,
      'customerId': ?instance.customerId,
      'supplierName': ?instance.supplierName,
      'customerName': ?instance.customerName,
      'subtotal': instance.subtotal,
      'totalTax': instance.totalTax,
      'totalAmount': instance.totalAmount,
      'notes': ?instance.notes,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'creatorName': ?instance.creatorName,
      'updatorName': ?instance.updatorName,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'payment': ?instance.payment?.toJson(),
      'refund': ?instance.refund?.toJson(),
    };
