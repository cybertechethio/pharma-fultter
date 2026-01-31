import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/stock_model.dart';
import 'stock_api_service.dart';
import 'stock_remote_data_source.dart';

class StockRemoteDataSourceImpl implements StockRemoteDataSource {
  final StockApiService _api;

  StockRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<StockModel>>> getStocks({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    LoggingService.auth('Starting get stocks process', {
      'page': page,
      'limit': limit,
      'search': search,
    });
    try {
      final ApiResponse<List<StockModel>> response = await _api.getAll(
        page: page,
        limit: limit,
        search: search,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          if (pagination == null) {
            LoggingService.warning('Get stocks: pagination data missing - endpoint may not support pagination');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get stocks successful', {
            'count': data.length,
            'currentPage': pagination.currentPage,
            'totalPages': pagination.totalPages,
            'hasNextPage': pagination.hasNextPage,
            'message': message,
          });

          return Right(PaginatedResponse(
            data: data,
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          LoggingService.auth('Get stocks failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Get stocks data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get stocks response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get stocks unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get stocks failed: ${e.toString()}'));
    }
  }
}

