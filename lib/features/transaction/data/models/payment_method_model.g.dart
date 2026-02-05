// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PaymentMethodModel', json, ($checkedConvert) {
      final val = _PaymentMethodModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        method: $checkedConvert('method', (v) => v as String),
        amount: $checkedConvert(
          'amount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        bankId: $checkedConvert('bankId', (v) => (v as num?)?.toInt()),
        bankName: $checkedConvert('bankName', (v) => v as String?),
        referenceNumber: $checkedConvert(
          'referenceNumber',
          (v) => v as String?,
        ),
        attachment: $checkedConvert('attachment', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PaymentMethodModelToJson(_PaymentMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'amount': instance.amount,
      'bankId': ?instance.bankId,
      'bankName': ?instance.bankName,
      'referenceNumber': ?instance.referenceNumber,
      'attachment': ?instance.attachment,
    };
