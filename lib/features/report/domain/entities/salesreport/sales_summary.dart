import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_summary.freezed.dart';

@freezed
sealed class SalesSummary with _$SalesSummary {
  const factory SalesSummary({
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
  }) = _SalesSummary;
}

