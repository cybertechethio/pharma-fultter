import 'package:freezed_annotation/freezed_annotation.dart';
import 'salespurchase_data.dart';

part 'chart_salespurchase.freezed.dart';

@freezed
sealed class ChartSalesPerchase with _$ChartSalesPerchase {
  const factory ChartSalesPerchase({
    required List<SalesPurchaseData> data,
    required double totalSales,
    required double totalPurchase,
  }) = _ChartSalesPerchase;
}