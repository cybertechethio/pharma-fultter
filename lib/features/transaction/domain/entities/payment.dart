import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_method.dart';

part 'payment.freezed.dart';

@freezed
sealed class Payment with _$Payment {
  const factory Payment({
    required int id,
    required double totalAmount,
    required double paidAmount,
    String? notes,
    @Default([]) List<PaymentMethod> paymentMethods,
  }) = _Payment;
}

