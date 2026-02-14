// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_item_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerItemDataModel _$CustomerItemDataModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CustomerItemDataModel', json, ($checkedConvert) {
  final val = _CustomerItemDataModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    reference: $checkedConvert('reference', (v) => v as String),
    code: $checkedConvert('code', (v) => v as String?),
    customerId: $checkedConvert(
      'customerId',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    customerName: $checkedConvert('customerName', (v) => v as String),
    customerImageUrl: $checkedConvert('customerImageUrl', (v) => v as String?),
    totalOrders: $checkedConvert(
      'totalOrders',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    totalAmount: $checkedConvert(
      'totalAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    paidAmount: $checkedConvert(
      'paidAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    dueAmount: $checkedConvert(
      'dueAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CustomerItemDataModelToJson(
  _CustomerItemDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reference': instance.reference,
  'code': ?instance.code,
  'customerId': instance.customerId,
  'customerName': instance.customerName,
  'customerImageUrl': ?instance.customerImageUrl,
  'totalOrders': instance.totalOrders,
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'dueAmount': instance.dueAmount,
};
