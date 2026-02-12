// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PaymentModel', json, ($checkedConvert) {
      final val = _PaymentModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        totalAmount: $checkedConvert(
          'totalAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        paidAmount: $checkedConvert(
          'paidAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        paymentType: $checkedConvert('paymentType', (v) => v as String?),
        notes: $checkedConvert('notes', (v) => v as String?),
        paymentMethods: $checkedConvert(
          'paymentMethods',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        PaymentMethodModel.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'paymentType': ?instance.paymentType,
      'notes': ?instance.notes,
      'paymentMethods': instance.paymentMethods.map((e) => e.toJson()).toList(),
    };
