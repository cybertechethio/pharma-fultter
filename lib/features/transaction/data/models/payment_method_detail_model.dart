// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'payment_method_detail_model.freezed.dart';
part 'payment_method_detail_model.g.dart';

@freezed
sealed class PaymentMethodDetailModel with _$PaymentMethodDetailModel {
  const factory PaymentMethodDetailModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    @JsonKey(fromJson: _paymentMethodFromJson) required PaymentMethodType method,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required double amount,
    String? attachment,
    String? referenceNumber,
    String? bankName,
  }) = _PaymentMethodDetailModel;

  factory PaymentMethodDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDetailModelFromJson(json);
}

PaymentMethodType _paymentMethodFromJson(dynamic value) {
  if (value is String) {
    return PaymentMethodTypeExtension.fromString(value);
  }
  throw ArgumentError(
    'Expected String for method, got ${value.runtimeType}. Value: $value',
  );
}

