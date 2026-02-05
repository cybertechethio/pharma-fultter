import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/salesreport/sales_report.dart';
import '../entities/purchasereport/purchase_report.dart';
import '../entities/customerreport/customer_report.dart';
import '../entities/expensereport/expense_report.dart';
import '../entities/bestsellerreport/best_seller.dart';
import '../entities/annualreport/annual_report.dart';
import '../entities/profitlossreport/profit_loss_report.dart';

abstract class ReportRepository {
  // Sales Report
  Future<Either<Failure, PaginatedResponse<SalesReport>>> getSalesReport({
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
  Future<Either<Failure, PaginatedResponse<PurchaseReport>>> getPurchaseReport({
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
  Future<Either<Failure, PaginatedResponse<CustomerReport>>> getCustomerReport({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  });

  // Expense Report
  Future<Either<Failure, PaginatedResponse<ExpenseReport>>> getExpenseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  });

  // Best Seller Report
  Future<Either<Failure, List<BestSeller>>> getBestSellerReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  });

  // Annual Report
  Future<Either<Failure, AnnualReport>> getAnnualReport({
    required DateTime startDate,
  });

  // Profit-Loss Report
  Future<Either<Failure, ProfitLossReport>> getProfitLossReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  });
}

