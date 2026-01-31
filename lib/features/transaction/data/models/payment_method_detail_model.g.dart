// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodDetailModel _$PaymentMethodDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PaymentMethodDetailModel', json, ($checkedConvert) {
  final val = _PaymentMethodDetailModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    method: $checkedConvert('method', (v) => _paymentMethodFromJson(v)),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    attachment: $checkedConvert('attachment', (v) => v as String?),
    referenceNumber: $checkedConvert('referenceNumber', (v) => v as String?),
    bankName: $checkedConvert('bankName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$PaymentMethodDetailModelToJson(
  _PaymentMethodDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'method': _$PaymentMethodTypeEnumMap[instance.method]!,
  'amount': instance.amount,
  'attachment': ?instance.attachment,
  'referenceNumber': ?instance.referenceNumber,
  'bankName': ?instance.bankName,
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.cash: 'cash',
  PaymentMethodType.telebirr: 'telebirr',
  PaymentMethodType.mPesa: 'mPesa',
  PaymentMethodType.bankTransfer: 'bankTransfer',
  PaymentMethodType.check: 'check',
  PaymentMethodType.other: 'other',
};
