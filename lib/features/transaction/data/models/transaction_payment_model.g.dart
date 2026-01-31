// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionPaymentModel _$TransactionPaymentModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionPaymentModel', json, ($checkedConvert) {
  final val = _TransactionPaymentModel(
    method: $checkedConvert(
      'method',
      (v) => $enumDecode(_$PaymentMethodTypeEnumMap, v),
    ),
    amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
    referenceNumber: $checkedConvert('referenceNumber', (v) => v as String?),
    bankId: $checkedConvert('bankId', (v) => (v as num?)?.toInt()),
    attachment: $checkedConvert('attachment', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$TransactionPaymentModelToJson(
  _TransactionPaymentModel instance,
) => <String, dynamic>{
  'method': _paymentMethodToJson(instance.method),
  'amount': instance.amount,
  'referenceNumber': ?instance.referenceNumber,
  'bankId': ?instance.bankId,
  'attachment': ?instance.attachment,
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.cash: 'cash',
  PaymentMethodType.telebirr: 'telebirr',
  PaymentMethodType.mPesa: 'mPesa',
  PaymentMethodType.bankTransfer: 'bankTransfer',
  PaymentMethodType.check: 'check',
  PaymentMethodType.other: 'other',
};
