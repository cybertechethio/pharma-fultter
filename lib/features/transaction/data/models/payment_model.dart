// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'payment_method_model.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
sealed class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required int id,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double paidAmount,
    String? paymentType,
    String? notes,
    @Default([]) List<PaymentMethodModel> paymentMethods,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

