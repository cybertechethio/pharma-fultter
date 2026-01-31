import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction.dart';
import 'payment_detail.dart';
import 'transaction_item_detail.dart';

part 'transaction_detail.freezed.dart';

@freezed
sealed class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    required Transaction transaction,
    required List<String> attachments,
    PaymentDetail? payment,
    required List<TransactionItemDetail> transactionItems,
  }) = _TransactionDetail;
}

