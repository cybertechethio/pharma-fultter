import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_summary.freezed.dart';

@freezed
sealed class PurchaseSummary with _$PurchaseSummary {
  const factory PurchaseSummary({
    required double totalSales,
    required int totalQuantity,
    required double totalTax,
    required double totalDiscount,
    required int transactionCount,
    required double averageTransactionValue,
    required double totalAmount,
    required double totalPaid,
    required double totalUnpaid,
    required double overdue,
  }) = _PurchaseSummary;
}

