// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetailModel _$PaymentDetailModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PaymentDetailModel', json, ($checkedConvert) {
  final val = _PaymentDetailModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
    totalAmount: $checkedConvert(
      'totalAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    paidAmount: $checkedConvert(
      'paidAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    paymentType: $checkedConvert('paymentType', (v) => _paymentTypeFromJson(v)),
    createdAt: $checkedConvert(
      'createdAt',
      (v) => JsonTypeConverters.dateTimeFromDynamic(v),
    ),
    paymentMethods: $checkedConvert(
      'paymentMethods',
      (v) => (v as List<dynamic>)
          .map(
            (e) => PaymentMethodDetailModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$PaymentDetailModelToJson(_PaymentDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'paymentMethods': instance.paymentMethods.map((e) => e.toJson()).toList(),
    };

const _$PaymentTypeEnumMap = {
  PaymentType.payment: 'payment',
  PaymentType.refund: 'refund',
};
