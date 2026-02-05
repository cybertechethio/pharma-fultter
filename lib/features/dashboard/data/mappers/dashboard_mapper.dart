import '../../domain/entities/dashboard.dart';
import '../../domain/entities/summary.dart';
import '../../domain/entities/chart.dart';
import '../../domain/entities/chart_salespurchase.dart';
import '../../domain/entities/chart_customer.dart';
import '../../domain/entities/chart_salesstatistics.dart';
import '../../domain/entities/chart_heatmap.dart';
import '../../domain/entities/salespurchase_data.dart';
import '../../domain/entities/salesstatistics_data.dart';
import '../../domain/entities/heatmap_data.dart';
import '../../domain/entities/dash_list.dart';
import '../../domain/entities/top_selling_product.dart';
import '../../domain/entities/low_stock_product.dart';
import '../../domain/entities/top_customer.dart';
import '../../domain/entities/alert.dart';
import '../../domain/entities/overall_info.dart';
import '../models/dashboard_model.dart';
import '../models/summary_model.dart';
import '../models/chart_model.dart';
import '../models/chart_salespurchase_model.dart';
import '../models/chart_customer_model.dart';
import '../models/chart_salesstatistics_model.dart';
import '../models/chart_heatmap_model.dart';
import '../models/salespurchase_data_model.dart';
import '../models/salesstatistics_data_model.dart';
import '../models/heatmap_data_model.dart';
import '../models/dash_list_model.dart';
import '../models/top_selling_product_model.dart';
import '../models/low_stock_product_model.dart';
import '../models/top_customer_model.dart';
import '../models/alert_model.dart';
import '../models/overall_info_model.dart';

// Summary Mapper
extension SummaryMapper on SummaryModel {
  Summary toDomain() {
    return Summary(
      totalSales: totalSales,
      totalSalesReturn: totalSalesReturn,
      totalPurchase: totalPurchase,
      totalPurchaseReturn: totalPurchaseReturn,
      profit: profit,
      invoiceDue: invoiceDue,
      invoiceDuePercentageChange: invoiceDuePercentageChange,
      totalExpenses: totalExpenses,
      totalExpensesPercentageChange: totalExpensesPercentageChange,
      totalPaymentReturns: totalPaymentReturns,
      totalPaymentReturnsPercentageChange: totalPaymentReturnsPercentageChange,
    );
  }
}

// SalesPurchaseData Mapper
extension SalesPurchaseDataMapper on SalesPurchaseDataModel {
  SalesPurchaseData toDomain() {
    return SalesPurchaseData(
      date: date,
      sales: sales,
      purchase: purchase,
    );
  }
}

// ChartSalesPerchase Mapper
extension ChartSalesPerchaseMapper on ChartSalesPerchaseModel {
  ChartSalesPerchase toDomain() {
    return ChartSalesPerchase(
      data: data.map((e) => e.toDomain()).toList(),
      totalSales: totalSales,
      totalPurchase: totalPurchase,
    );
  }
}

// ChartCustomer Mapper
extension ChartCustomerMapper on ChartCustomerModel {
  ChartCustomer toDomain() {
    return ChartCustomer(
      firstTime: firstTime,
      returning: returning,
      firstTimePercentage: firstTimePercentage,
      returningPercentage: returningPercentage,
    );
  }
}

// SalesStatisticsData Mapper
extension SalesStatisticsDataMapper on SalesStatisticsDataModel {
  SalesStatisticsData toDomain() {
    return SalesStatisticsData(
      date: date,
      revenue: revenue,
      expense: expense,
    );
  }
}

// ChartSalesStatistics Mapper
extension ChartSalesStatisticsMapper on ChartSalesStatisticsModel {
  ChartSalesStatistics toDomain() {
    return ChartSalesStatistics(
      data: data.map((e) => e.toDomain()).toList(),
      totalRevenue: totalRevenue,
      totalExpense: totalExpense,
    );
  }
}

// HeatmapData Mapper
extension HeatmapDataMapper on HeatmapDataModel {
  HeatmapData toDomain() {
    return HeatmapData(
      date: date,
      value: value,
    );
  }
}

// ChartHeatmap Mapper
extension ChartHeatmapMapper on ChartHeatmapModel {
  ChartHeatmap toDomain() {
    return ChartHeatmap(
      data: data.map((e) => e.toDomain()).toList(),
    );
  }
}

// Chart Mapper
extension ChartMapper on ChartModel {
  Chart toDomain() {
    return Chart(
      salesPurchase: salesPurchase.toDomain(),
      customer: customer.toDomain(),
      salesStatistics: salesStatistics.toDomain(),
      heatmap: heatmap.toDomain(),
    );
  }
}

// TopSellingProduct Mapper
extension TopSellingProductMapper on TopSellingProductModel {
  TopSellingProduct toDomain() {
    return TopSellingProduct(
      id: id,
      name: name,
      imageUrl: imageUrl,
      price: price,
      sales: sales,
      growth: growth,
    );
  }
}

// LowStockProduct Mapper
extension LowStockProductMapper on LowStockProductModel {
  LowStockProduct toDomain() {
    return LowStockProduct(
      id: id,
      name: name,
      imageUrl: imageUrl,
      code: code,
      stock: stock,
    );
  }
}

// TopCustomer Mapper
extension TopCustomerMapper on TopCustomerModel {
  TopCustomer toDomain() {
    return TopCustomer(
      id: id,
      name: name,
      imageUrl: imageUrl,
      location: location,
      orders: orders,
      total: total,
    );
  }
}

// DashList Mapper
extension DashListMapper on DashListModel {
  DashList toDomain() {
    return DashList(
      topSellingProducts: topSellingProducts.map((e) => e.toDomain()).toList(),
      lowStockProducts: lowStockProducts.map((e) => e.toDomain()).toList(),
      topCustomers: topCustomers.map((e) => e.toDomain()).toList(),
    );
  }
}

// Alert Mapper
extension AlertMapper on AlertModel {
  Alert toDomain() {
    return Alert(
      id: id,
      name: name,
      stock: stock,
      threshold: threshold,
    );
  }
}

// OverallInfo Mapper
extension OverallInfoMapper on OverallInfoModel {
  OverallInfo toDomain() {
    return OverallInfo(
      suppliers: suppliers,
      customers: customers,
      orders: orders,
    );
  }
}

// Dashboard Mapper
extension DashboardMapper on DashboardModel {
  Dashboard toDomain() {
    return Dashboard(
      summary: summary.toDomain(),
      charts: charts.toDomain(),
      lists: lists.toDomain(),
      alerts: alerts?.toDomain(),
      overallInfo: overallInfo.toDomain(),
    );
  }
}

