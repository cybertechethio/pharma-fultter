// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'top_selling_product_model.dart';
import 'low_stock_product_model.dart';
import 'top_customer_model.dart';

part 'dash_list_model.freezed.dart';
part 'dash_list_model.g.dart';

@freezed
sealed class DashListModel with _$DashListModel {
  const factory DashListModel({
    required List<TopSellingProductModel> topSellingProducts,
    required List<LowStockProductModel> lowStockProducts,
    required List<TopCustomerModel> topCustomers,
  }) = _DashListModel;

  factory DashListModel.fromJson(Map<String, dynamic> json) =>
      _$DashListModelFromJson(json);
}

