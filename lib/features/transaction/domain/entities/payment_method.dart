import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/payment_method_type_enum.dart';

part 'payment_method.freezed.dart';

@freezed
sealed class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required int id,
    required PaymentMethodType method,
    required double amount,
    int? bankId,
    String? bankName,
    String? referenceNumber,
    String? attachment,
  }) = _PaymentMethod;
}

