import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/payment_type_enum.dart';
import 'payment_method_detail.dart';

part 'payment_detail.freezed.dart';

@freezed
sealed class PaymentDetail with _$PaymentDetail {
  const factory PaymentDetail({
    required int id,
    required double totalAmount,
    required double paidAmount,
    required PaymentType paymentType,
    required DateTime createdAt,
    required List<PaymentMethodDetail> paymentMethods,
  }) = _PaymentDetail;
}

