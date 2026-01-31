import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/permission_model.dart';
import 'permission_api_service.dart';
import 'permission_remote_data_source.dart';

class PermissionRemoteDataSourceImpl implements PermissionRemoteDataSource {
  final PermissionApiService _api;

  PermissionRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, Map<String, List<PermissionModel>>>> getPermissions({
    int page = 1,
    int limit = 1000,
    String? search,
  }) async {
    LoggingService.auth('Starting get permissions process');
    try {
      final ApiResponse<Map<String, List<PermissionModel>>> response = 
          await _api.getAll(page: page, limit: limit, search: search);
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          // Log dynamic categories
          final categoryInfo = data.map((key, value) => MapEntry(key, value.length));
          LoggingService.auth('Get permissions successful', {
            'categories': categoryInfo.keys.toList(),
            'totalPermissions': data.values.expand((e) => e).length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get permissions failed - server error', {
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
      LoggingService.error('Get permissions data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get permissions response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get permissions unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get permissions failed: ${e.toString()}'));
    }
  }
}

