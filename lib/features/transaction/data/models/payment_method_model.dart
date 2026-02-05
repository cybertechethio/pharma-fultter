// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

@freezed
sealed class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    required int id,
    required String method,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double amount,
    int? bankId,
    String? bankName,
    String? referenceNumber,
    String? attachment,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}

