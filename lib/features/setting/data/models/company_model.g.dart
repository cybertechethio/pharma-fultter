// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyModel _$CompanyModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CompanyModel', json, ($checkedConvert) {
  final val = _CompanyModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    name: $checkedConvert('name', (v) => v as String),
    phone1: $checkedConvert('phone1', (v) => v as String?),
    phone2: $checkedConvert('phone2', (v) => v as String?),
    logoUrl: $checkedConvert('logoUrl', (v) => v as String?),
    tinNumber: $checkedConvert('tinNumber', (v) => v as String?),
    tradeName: $checkedConvert('tradeName', (v) => v as String?),
    city: $checkedConvert('city', (v) => v as String?),
    wereda: $checkedConvert('wereda', (v) => v as String?),
    autoPrint: $checkedConvert('autoPrint', (v) => v as bool? ?? false),
    defaultStartDate: $checkedConvert(
      'defaultStartDate',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    businessType: $checkedConvert('businessType', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone1': ?instance.phone1,
      'phone2': ?instance.phone2,
      'logoUrl': ?instance.logoUrl,
      'tinNumber': ?instance.tinNumber,
      'tradeName': ?instance.tradeName,
      'city': ?instance.city,
      'wereda': ?instance.wereda,
      'autoPrint': instance.autoPrint,
      'defaultStartDate': ?instance.defaultStartDate?.toIso8601String(),
      'businessType': ?instance.businessType,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };
