import '../../domain/entities/expensereport/expense_item_data.dart';
import '../../domain/entities/expensereport/expense_summary.dart';
import '../../domain/entities/expensereport/expense_report.dart';
import '../models/expensereport/expense_item_data_model.dart';
import '../models/expensereport/expense_summary_model.dart';
import '../models/expensereport/expense_report_model.dart';

// ExpenseItemData Mapper
extension ExpenseItemDataMapper on ExpenseItemDataModel {
  ExpenseItemData toDomain() {
    return ExpenseItemData(
      id: id,
      expenseName: expenseName,
      category: category,
      description: description,
      date: date,
      amount: amount,
      paymentMethod: paymentMethod,
    );
  }
}

// ExpenseSummary Mapper
extension ExpenseSummaryMapper on ExpenseSummaryModel {
  ExpenseSummary toDomain() {
    return ExpenseSummary(
      totalExpenses: totalExpenses,
      totalAmount: totalAmount,
      averageExpense: averageExpense,
      largestExpense: largestExpense,
    );
  }
}

// ExpenseReport Mapper
extension ExpenseReportMapper on ExpenseReportModel {
  ExpenseReport toDomain() {
    return ExpenseReport(
      items: items.map((e) => e.toDomain()).toList(),
      summary: summary.toDomain(),
    );
  }
}

