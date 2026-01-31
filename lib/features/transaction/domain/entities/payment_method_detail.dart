import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/payment_method_type_enum.dart';

part 'payment_method_detail.freezed.dart';

@freezed
sealed class PaymentMethodDetail with _$PaymentMethodDetail {
  const factory PaymentMethodDetail({
    required int id,
    required PaymentMethodType method,
    required double amount,
    String? attachment,
    String? referenceNumber,
    String? bankName,
  }) = _PaymentMethodDetail;
}

