// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/enums/payment_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'payment_method_detail_model.dart';

part 'payment_detail_model.freezed.dart';
part 'payment_detail_model.g.dart';

@freezed
sealed class PaymentDetailModel with _$PaymentDetailModel {
  const factory PaymentDetailModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double paidAmount,
    @JsonKey(fromJson: _paymentTypeFromJson)
    required PaymentType paymentType,
    @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
    required DateTime createdAt,
    required List<PaymentMethodDetailModel> paymentMethods,
  }) = _PaymentDetailModel;

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailModelFromJson(json);
}

PaymentType _paymentTypeFromJson(dynamic value) {
  if (value is String) {
    return PaymentTypeExtension.fromString(value);
  }
  throw ArgumentError(
    'Expected String for payment_type, got ${value.runtimeType}. Value: $value',
  );
}

