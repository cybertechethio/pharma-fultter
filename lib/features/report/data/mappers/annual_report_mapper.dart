import '../../domain/entities/annualreport/annual_item_data.dart';
import '../../domain/entities/annualreport/annual_totals.dart';
import '../../domain/entities/annualreport/annual_report_details.dart';
import '../../domain/entities/annualreport/annual_month_data.dart';
import '../../domain/entities/annualreport/annual_months.dart';
import '../../domain/entities/annualreport/annual_item_type_data.dart';
import '../../domain/entities/annualreport/annual_item_types_breakdown.dart';
import '../../domain/entities/annualreport/annual_chart_data.dart';
import '../../domain/entities/annualreport/annual_report.dart';
import '../models/annualreport/annual_item_data_model.dart';
import '../models/annualreport/annual_totals_model.dart';
import '../models/annualreport/annual_report_details_model.dart';
import '../models/annualreport/annual_month_data_model.dart';
import '../models/annualreport/annual_months_model.dart';
import '../models/annualreport/annual_item_type_data_model.dart';
import '../models/annualreport/annual_item_types_breakdown_model.dart';
import '../models/annualreport/annual_chart_data_model.dart';
import '../models/annualreport/annual_report_model.dart';

// AnnualItemData Mapper
extension AnnualItemDataMapper on AnnualItemDataModel {
  AnnualItemData toDomain() {
    return AnnualItemData(
      itemType: itemType,
      sales: sales,
      cost: cost,
      vat: vat,
      grossProfit: grossProfit,
    );
  }
}

// AnnualTotals Mapper
extension AnnualTotalsMapper on AnnualTotalsModel {
  AnnualTotals toDomain() {
    return AnnualTotals(
      sales: sales,
      cost: cost,
      vat: vat,
      grossProfit: grossProfit,
    );
  }
}

// AnnualMonthData Mapper
extension AnnualMonthDataMapper on AnnualMonthDataModel {
  AnnualMonthData toDomain() {
    return AnnualMonthData(
      month: month,
      sales: sales,
      profit: profit,
    );
  }
}

// AnnualMonths Mapper
extension AnnualMonthsMapper on AnnualMonthsModel {
  AnnualMonths toDomain() {
    return AnnualMonths(
      months: months.map((e) => e.toDomain()).toList(),
    );
  }
}

// AnnualItemTypeData Mapper
extension AnnualItemTypeDataMapper on AnnualItemTypeDataModel {
  AnnualItemTypeData toDomain() {
    return AnnualItemTypeData(
      sales: sales,
      cost: cost,
      grossProfit: grossProfit,
    );
  }
}

// AnnualItemTypesBreakdown Mapper
extension AnnualItemTypesBreakdownMapper on AnnualItemTypesBreakdownModel {
  AnnualItemTypesBreakdown toDomain() {
    return AnnualItemTypesBreakdown(
      direct: direct.toDomain(),
      processed: processed.toDomain(),
    );
  }
}

// AnnualChartData Mapper
extension AnnualChartDataMapper on AnnualChartDataModel {
  AnnualChartData toDomain() {
    return AnnualChartData(
      salesProfitTrend: salesProfitTrend.toDomain(),
      itemTypesBreakdown: itemTypesBreakdown.toDomain(),
    );
  }
}

// AnnualReportDetails Mapper
extension AnnualReportDetailsMapper on AnnualReportDetailsModel {
  AnnualReportDetails toDomain() {
    return AnnualReportDetails(
      startDate: startDate,
      endDate: endDate,
      items: items.map((e) => e.toDomain()).toList(),
      totals: totals.toDomain(),
      expenses: expenses,
      netProfit: netProfit,
    );
  }
}

// AnnualReport Mapper
extension AnnualReportMapper on AnnualReportModel {
  AnnualReport toDomain() {
    return AnnualReport(
      report: report.toDomain(),
      charts: charts.toDomain(),
    );
  }
}

