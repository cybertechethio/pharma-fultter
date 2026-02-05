// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyRequestModel _$CompanyRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CompanyRequestModel', json, ($checkedConvert) {
      final val = _CompanyRequestModel(
        name: $checkedConvert('name', (v) => v as String?),
        phone1: $checkedConvert('phone1', (v) => v as String?),
        phone2: $checkedConvert('phone2', (v) => v as String?),
        logoUrl: $checkedConvert('logoUrl', (v) => v as String?),
        tinNumber: $checkedConvert('tinNumber', (v) => v as String?),
        tradeName: $checkedConvert('tradeName', (v) => v as String?),
        city: $checkedConvert('city', (v) => v as String?),
        wereda: $checkedConvert('wereda', (v) => v as String?),
        autoPrint: $checkedConvert('autoPrint', (v) => v as bool?),
        defaultStartDate: $checkedConvert(
          'defaultStartDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        businessType: $checkedConvert('businessType', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CompanyRequestModelToJson(
  _CompanyRequestModel instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'phone1': ?instance.phone1,
  'phone2': ?instance.phone2,
  'logoUrl': ?instance.logoUrl,
  'tinNumber': ?instance.tinNumber,
  'tradeName': ?instance.tradeName,
  'city': ?instance.city,
  'wereda': ?instance.wereda,
  'autoPrint': ?instance.autoPrint,
  'defaultStartDate': ?instance.defaultStartDate?.toIso8601String(),
  'businessType': ?instance.businessType,
};
