import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/salesreport/sales_report_model.dart';
import '../models/purchasereport/purchase_report_model.dart';
import '../models/customerreport/customer_report_model.dart';
import '../models/expensereport/expense_report_model.dart';
import '../models/bestsellerreport/best_seller_model.dart';
import '../models/annualreport/annual_report_model.dart';
import '../models/profitlossreport/profit_loss_report_model.dart';

abstract class ReportRemoteDataSource {
  // Sales Report
  Future<Either<Failure, PaginatedResponse<SalesReportModel>>> getSalesReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? customerId,
    String? status,
    int page = 1,
    int limit = 25,
  });

  // Purchase Report
  Future<Either<Failure, PaginatedResponse<PurchaseReportModel>>> getPurchaseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? supplierId,
    String? status,
    int page = 1,
    int limit = 25,
  });

  // Customer Report
  Future<Either<Failure, PaginatedResponse<CustomerReportModel>>> getCustomerReport({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  });

  // Expense Report
  Future<Either<Failure, PaginatedResponse<ExpenseReportModel>>> getExpenseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  });

  // Best Seller Report
  Future<Either<Failure, List<BestSellerModel>>> getBestSellerReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  });

  // Annual Report
  Future<Either<Failure, AnnualReportModel>> getAnnualReport({
    required DateTime startDate,
  });

  // Profit-Loss Report
  Future<Either<Failure, ProfitLossReportModel>> getProfitLossReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  });
}

