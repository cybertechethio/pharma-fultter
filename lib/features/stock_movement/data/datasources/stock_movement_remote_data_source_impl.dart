import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/stock_movement_model.dart';
import 'stock_movement_api_service.dart';
import 'stock_movement_remote_data_source.dart';

class StockMovementRemoteDataSourceImpl implements StockMovementRemoteDataSource {
  final StockMovementApiService _api;

  StockMovementRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<StockMovementModel>>> getStockMovements({
    required int itemId,
    int page = 1,
    int limit = 500,
  }) async {
    LoggingService.auth('Starting get stock movements process', {
      'itemId': itemId,
      'page': page,
      'limit': limit,
    });
    try {
      final ApiResponse<List<StockMovementModel>> response = await _api.getAll(
        itemId: itemId,
        page: page,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          if (pagination == null) {
            LoggingService.warning('Get stock movements: pagination data missing');
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get stock movements successful', {
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
          LoggingService.auth('Get stock movements failed - server error', {
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
      LoggingService.error('Get stock movements data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get stock movements response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get stock movements unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get stock movements failed: ${e.toString()}'));
    }
  }
}
