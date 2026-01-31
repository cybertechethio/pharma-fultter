// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/enums/payment_method_type_enum.dart';

part 'transaction_payment_model.freezed.dart';
part 'transaction_payment_model.g.dart';

@freezed
sealed class TransactionPaymentModel with _$TransactionPaymentModel {
  const factory TransactionPaymentModel({
    @JsonKey(toJson: _paymentMethodToJson)
    required PaymentMethodType method,
    required double amount,
    String? referenceNumber,
    int? bankId,
    String? attachment, // URL to uploaded attachment file
  }) = _TransactionPaymentModel;

  factory TransactionPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionPaymentModelFromJson(json);
}

String _paymentMethodToJson(PaymentMethodType method) => method.toApiString();

