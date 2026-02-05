// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodRequest _$PaymentMethodRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PaymentMethodRequest', json, ($checkedConvert) {
  final val = _PaymentMethodRequest(
    method: $checkedConvert('method', (v) => v as String),
    amount: $checkedConvert('amount', (v) => (v as num?)?.toDouble()),
    bankId: $checkedConvert('bankId', (v) => (v as num?)?.toInt()),
    referenceNumber: $checkedConvert('referenceNumber', (v) => v as String?),
    attachment: $checkedConvert('attachment', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$PaymentMethodRequestToJson(
  _PaymentMethodRequest instance,
) => <String, dynamic>{
  'method': instance.method,
  'amount': ?instance.amount,
  'bankId': ?instance.bankId,
  'referenceNumber': ?instance.referenceNumber,
  'attachment': ?instance.attachment,
};
