import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/salesreport/sales_report.dart';
import '../../domain/entities/purchasereport/purchase_report.dart';
import '../../domain/entities/customerreport/customer_report.dart';
import '../../domain/entities/expensereport/expense_report.dart';
import '../../domain/entities/bestsellerreport/best_seller.dart';
import '../../domain/entities/annualreport/annual_report.dart';
import '../../domain/entities/profitlossreport/profit_loss_report.dart';
import '../../domain/repositories/report_repository.dart';
import '../datasources/report_remote_data_source.dart';
import '../mappers/sales_report_mapper.dart';
import '../mappers/purchase_report_mapper.dart';
import '../mappers/customer_report_mapper.dart';
import '../mappers/expense_report_mapper.dart';
import '../mappers/best_seller_mapper.dart';
import '../mappers/annual_report_mapper.dart';
import '../mappers/profit_loss_report_mapper.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource _remoteDataSource;

  ReportRepositoryImpl(this._remoteDataSource);

  @override
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
  }) async {
    final response = await _remoteDataSource.getSalesReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      customerId: customerId,
      status: status,
      page: page,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (paginatedModel) {
        // Unwrap the report model from the list and convert to domain
        final reportModel = paginatedModel.data.first;
        return Right(PaginatedResponse(
          data: [reportModel.toDomain()], // Wrap converted entity in list
          pagination: paginatedModel.pagination,
        ));
      },
    );
  }

  @override
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
  }) async {
    final response = await _remoteDataSource.getPurchaseReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      supplierId: supplierId,
      status: status,
      page: page,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (paginatedModel) {
        // Unwrap the report model from the list and convert to domain
        final reportModel = paginatedModel.data.first;
        return Right(PaginatedResponse(
          data: [reportModel.toDomain()], // Wrap converted entity in list
          pagination: paginatedModel.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<CustomerReport>>> getCustomerReport({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  }) async {
    final response = await _remoteDataSource.getCustomerReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      customerId: customerId,
      page: page,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (paginatedModel) {
        // Unwrap the report model from the list and convert to domain
        final reportModel = paginatedModel.data.first;
        return Right(PaginatedResponse(
          data: [reportModel.toDomain()], // Wrap converted entity in list
          pagination: paginatedModel.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<ExpenseReport>>> getExpenseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  }) async {
    final response = await _remoteDataSource.getExpenseReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      categoryId: categoryId,
      page: page,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (paginatedModel) {
        // Unwrap the report model from the list and convert to domain
        final reportModel = paginatedModel.data.first;
        return Right(PaginatedResponse(
          data: [reportModel.toDomain()], // Wrap converted entity in list
          pagination: paginatedModel.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, List<BestSeller>>> getBestSellerReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  }) async {
    final response = await _remoteDataSource.getBestSellerReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((model) => model.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, AnnualReport>> getAnnualReport({
    required DateTime startDate,
  }) async {
    final response = await _remoteDataSource.getAnnualReport(
      startDate: startDate,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, ProfitLossReport>> getProfitLossReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  }) async {
    final response = await _remoteDataSource.getProfitLossReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

