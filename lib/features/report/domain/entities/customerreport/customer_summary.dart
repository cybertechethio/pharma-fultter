import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_summary.freezed.dart';

@freezed
sealed class CustomerSummary with _$CustomerSummary {
  const factory CustomerSummary({
    required int totalCustomers,
    required int totalOrders,
    required double totalAmount,
    required double totalPaid,
    required double totalUnpaid,
    required double totalToPayCustomers,
    required double totalCustomersOweUs,
    required double netBalance,
  }) = _CustomerSummary;
}

