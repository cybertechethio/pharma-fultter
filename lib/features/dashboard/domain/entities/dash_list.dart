import 'package:freezed_annotation/freezed_annotation.dart';
import 'top_selling_product.dart';
import 'low_stock_product.dart';
import 'top_customer.dart';

part 'dash_list.freezed.dart';

@freezed
sealed class DashList with _$DashList {
  const factory DashList({
    required List<TopSellingProduct> topSellingProducts,
    required List<LowStockProduct> lowStockProducts,
    required List<TopCustomer> topCustomers,
  }) = _DashList;
}

