import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/salesreport/sales_report_model.dart';
import '../models/purchasereport/purchase_report_model.dart';
import '../models/customerreport/customer_report_model.dart';
import '../models/expensereport/expense_report_model.dart';
import '../models/bestsellerreport/best_seller_model.dart';
import '../models/annualreport/annual_report_model.dart';
import '../models/profitlossreport/profit_loss_report_model.dart';
import 'report_api_service.dart';
import 'report_remote_data_source.dart';

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final ReportApiService _api;

  ReportRemoteDataSourceImpl(this._api);

  @override
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
  }) async {
    try {
      final ApiResponse<SalesReportModel> response = await _api.getSalesReport(
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
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }
          return Right(PaginatedResponse(
            data: [data], // Wrap report model in list for PaginatedResponse
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get sales report failed: ${e.toString()}'));
    }
  }

  @override
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
  }) async {
    try {
      final ApiResponse<PurchaseReportModel> response = await _api.getPurchaseReport(
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
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }
          return Right(PaginatedResponse(
            data: [data], // Wrap report model in list for PaginatedResponse
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get purchase report failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<CustomerReportModel>>> getCustomerReport({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final ApiResponse<CustomerReportModel> response = await _api.getCustomerReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
        customerId: customerId,
        page: page,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }
          return Right(PaginatedResponse(
            data: [data], // Wrap report model in list for PaginatedResponse
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get customer report failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<ExpenseReportModel>>> getExpenseReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final ApiResponse<ExpenseReportModel> response = await _api.getExpenseReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
        categoryId: categoryId,
        page: page,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }
          return Right(PaginatedResponse(
            data: [data], // Wrap report model in list for PaginatedResponse
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get expense report failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<BestSellerModel>>> getBestSellerReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  }) async {
    try {
      final ApiResponse<List<BestSellerModel>> response = await _api.getBestSellerReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
        productId: productId,
        categoryId: categoryId,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          return Right(data);
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get best seller report failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AnnualReportModel>> getAnnualReport({
    required DateTime startDate,
  }) async {
    try {
      final ApiResponse<AnnualReportModel> response = await _api.getAnnualReport(
        startDate: startDate,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          return Right(data);
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get annual report failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProfitLossReportModel>> getProfitLossReport({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  }) async {
    try {
      final ApiResponse<ProfitLossReportModel> response = await _api.getProfitLossReport(
        startDate: startDate,
        endDate: endDate,
        branchId: branchId,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          return Right(data);
        },
        error: (success, error, meta) {
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Get profit-loss report failed: ${e.toString()}'));
    }
  }
}

