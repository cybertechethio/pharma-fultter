// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodRequest _$PaymentMethodRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PaymentMethodRequest', json, ($checkedConvert) {
  final val = _PaymentMethodRequest(
    method: $checkedConvert('method', (v) => v as String),
    amount: $checkedConvert(
      'amount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
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
  'amount': instance.amount,
  'bankId': ?instance.bankId,
  'referenceNumber': ?instance.referenceNumber,
  'attachment': ?instance.attachment,
};

_SupplierCustomerPaymentRequest _$SupplierCustomerPaymentRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SupplierCustomerPaymentRequest', json, ($checkedConvert) {
  final val = _SupplierCustomerPaymentRequest(
    customerId: $checkedConvert('customerId', (v) => (v as num?)?.toInt()),
    supplierId: $checkedConvert('supplierId', (v) => (v as num?)?.toInt()),
    notes: $checkedConvert('notes', (v) => v as String?),
    paymentMethods: $checkedConvert(
      'paymentMethods',
      (v) => (v as List<dynamic>)
          .map((e) => PaymentMethodRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SupplierCustomerPaymentRequestToJson(
  _SupplierCustomerPaymentRequest instance,
) => <String, dynamic>{
  'customerId': ?instance.customerId,
  'supplierId': ?instance.supplierId,
  'notes': ?instance.notes,
  'paymentMethods': instance.paymentMethods.map((e) => e.toJson()).toList(),
};
