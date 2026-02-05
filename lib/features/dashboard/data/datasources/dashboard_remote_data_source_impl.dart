import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/dashboard_model.dart';
import 'dashboard_api_service.dart';
import 'dashboard_remote_data_source.dart';

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DashboardApiService _api;

  DashboardRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, DashboardModel>> getDashboard({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
   
    try {
      final ApiResponse<DashboardModel> response = await _api.getDashboard(
        startDate: startDate,
        endDate: endDate,
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
      LoggingService.error('Get dashboard data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get dashboard response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get dashboard unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get dashboard failed: ${e.toString()}'));
    }
  }
}

