import '../../domain/entities/profitlossreport/profit_loss_item_data.dart';
import '../../domain/entities/profitlossreport/profit_loss_totals.dart';
import '../../domain/entities/profitlossreport/profit_loss_report_details.dart';
import '../../domain/entities/profitlossreport/profit_loss_day_data.dart';
import '../../domain/entities/profitlossreport/profit_loss_week_data.dart';
import '../../domain/entities/profitlossreport/profit_loss_month_data.dart';
import '../../domain/entities/profitlossreport/profit_loss_graph.dart';
import '../../domain/entities/profitlossreport/profit_loss_report.dart';
import '../models/profitlossreport/profit_loss_item_data_model.dart';
import '../models/profitlossreport/profit_loss_totals_model.dart';
import '../models/profitlossreport/profit_loss_report_details_model.dart';
import '../models/profitlossreport/profit_loss_day_data_model.dart';
import '../models/profitlossreport/profit_loss_week_data_model.dart';
import '../models/profitlossreport/profit_loss_month_data_model.dart';
import '../models/profitlossreport/profit_loss_graph_model.dart';
import '../models/profitlossreport/profit_loss_report_model.dart';

// ProfitLossItemData Mapper
extension ProfitLossItemDataMapper on ProfitLossItemDataModel {
  ProfitLossItemData toDomain() {
    return ProfitLossItemData(
      itemType: itemType,
      sales: sales,
      cost: cost,
      vat: vat,
      grossProfit: grossProfit,
    );
  }
}

// ProfitLossTotals Mapper
extension ProfitLossTotalsMapper on ProfitLossTotalsModel {
  ProfitLossTotals toDomain() {
    return ProfitLossTotals(
      sales: sales,
      cost: cost,
      vat: vat,
      grossProfit: grossProfit,
    );
  }
}

// ProfitLossDayData Mapper
extension ProfitLossDayDataMapper on ProfitLossDayDataModel {
  ProfitLossDayData toDomain() {
    return ProfitLossDayData(
      date: date,
      sales: sales,
      profit: profit,
    );
  }
}

// ProfitLossWeekData Mapper
extension ProfitLossWeekDataMapper on ProfitLossWeekDataModel {
  ProfitLossWeekData toDomain() {
    return ProfitLossWeekData(
      week: week,
      sales: sales,
      profit: profit,
    );
  }
}

// ProfitLossMonthData Mapper
extension ProfitLossMonthDataMapper on ProfitLossMonthDataModel {
  ProfitLossMonthData toDomain() {
    return ProfitLossMonthData(
      month: month,
      sales: sales,
      profit: profit,
    );
  }
}

// ProfitLossGraph Mapper
extension ProfitLossGraphMapper on ProfitLossGraphModel {
  ProfitLossGraph toDomain() {
    return ProfitLossGraph(
      granularity: granularity,
      days: days?.map((e) => e.toDomain()).toList(),
      weeks: weeks?.map((e) => e.toDomain()).toList(),
      months: months?.map((e) => e.toDomain()).toList(),
    );
  }
}

// ProfitLossReportDetails Mapper
extension ProfitLossReportDetailsMapper on ProfitLossReportDetailsModel {
  ProfitLossReportDetails toDomain() {
    return ProfitLossReportDetails(
      date: date,
      items: items.map((e) => e.toDomain()).toList(),
      totals: totals.toDomain(),
    );
  }
}

// ProfitLossReport Mapper
extension ProfitLossReportMapper on ProfitLossReportModel {
  ProfitLossReport toDomain() {
    return ProfitLossReport(
      report: report.toDomain(),
      graph: graph.toDomain(),
      graph10Days: graph10Days.toDomain(),
      graphDateRange: graphDateRange?.toDomain(),
    );
  }
}

