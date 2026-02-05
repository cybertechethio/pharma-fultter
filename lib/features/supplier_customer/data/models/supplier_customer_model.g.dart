// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierCustomerModel _$SupplierCustomerModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SupplierCustomerModel', json, ($checkedConvert) {
  final val = _SupplierCustomerModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    name: $checkedConvert('name', (v) => v as String),
    phone: $checkedConvert('phone', (v) => v as String),
    accountCode: $checkedConvert('accountCode', (v) => v as String),
    tinNumber: $checkedConvert('tinNumber', (v) => v as String? ?? 'N/A'),
    type: $checkedConvert('type', (v) => v as String),
    balance: $checkedConvert('balance', (v) => v as String? ?? '0.0'),
    isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$SupplierCustomerModelToJson(
  _SupplierCustomerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'accountCode': instance.accountCode,
  'tinNumber': instance.tinNumber,
  'type': instance.type,
  'balance': instance.balance,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};
