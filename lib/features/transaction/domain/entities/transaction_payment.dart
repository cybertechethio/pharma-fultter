import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/payment_method_type_enum.dart';

part 'transaction_payment.freezed.dart';

@freezed
sealed class TransactionPayment with _$TransactionPayment {
  const factory TransactionPayment({
    required PaymentMethodType method,
    required double amount,
    String? referenceNumber,
    int? bankId,
  }) = _TransactionPayment;
}

