import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/company_model.dart';
import '../models/company_request_model.dart';
import 'company_remote_data_source.dart';
import 'company_api_service.dart';

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final CompanyApiService _apiService;

  CompanyRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, CompanyModel>> getCompany({
    required String companyId,
  }) async {
    LoggingService.auth('Starting get company process', {
      'companyId': companyId,
    });
    
    try {
      final response = await _apiService.getCompany(
        companyId: companyId,
      );
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get company successful', {
            'companyId': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get company failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      LoggingService.error('Get company data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get company response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get company unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get company failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CompanyModel>> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  }) async {
    LoggingService.auth('Starting update company process', {
      'companyId': companyId,
    });
    
    try {
      final response = await _apiService.updateCompany(
        companyId: companyId,
        request: request,
        logoFilePath: logoFilePath,
      );
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update company successful', {
            'companyId': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update company failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(
        Failure.networkError(NetworkExceptions.getErrorMessage(exception)),
      );
    } on TypeError catch (e) {
      LoggingService.error('Update company data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update company response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update company unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update company failed: ${e.toString()}'));
    }
  }
}

