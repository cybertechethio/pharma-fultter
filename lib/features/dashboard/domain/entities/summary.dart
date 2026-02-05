import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';

@freezed
sealed class Summary with _$Summary {
  const factory Summary({
    required double totalSales,
    required double totalSalesReturn,
    required double totalPurchase,
    required double totalPurchaseReturn,
    required double profit,
    required double invoiceDue,
    required double invoiceDuePercentageChange,
    required double totalExpenses,
    required double totalExpensesPercentageChange,
    required double totalPaymentReturns,
    required double totalPaymentReturnsPercentageChange,
  }) = _Summary;
}

