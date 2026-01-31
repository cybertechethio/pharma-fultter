import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_role_model.dart';
import 'user_role_api_service.dart';
import 'user_role_remote_data_source.dart';

class UserRoleRemoteDataSourceImpl implements UserRoleRemoteDataSource {
  final UserRoleApiService _api;

  UserRoleRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, List<UserBranchRoleAssignmentModel>>> getUserRoleAssignments({
    required int userId,
  }) async {
    LoggingService.auth('Starting get user role assignments process', {
      'userId': userId,
    });
    try {
      final ApiResponse<List<UserBranchRoleAssignmentModel>> response = 
          await _api.getUserRoleAssignments(userId: userId);
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get user role assignments successful', {
            'userId': userId,
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get user role assignments failed - server error', {
            'userId': userId,
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
      LoggingService.error('Get user role assignments data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get user role assignments response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get user role assignments unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get user role assignments failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<UserBranchRoleAssignmentModel>>> assignUserRoles({
    required int userId,
    required List<Map<String, dynamic>> assignments,
  }) async {
    LoggingService.auth('Starting assign user roles process', {
      'userId': userId,
      'assignmentsCount': assignments.length,
    });
    try {
      final response = await _api.assignUserRoles(
        userId: userId,
        assignments: assignments,
      );
      return response.when(
        success: (success, message, data, meta, pagination    ) {
          LoggingService.auth('Assign user roles successful', {
            'userId': userId,
            'branchesCount': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Assign user roles failed - server error', {
            'userId': userId,
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
      LoggingService.error('Assign user roles data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Assign user roles response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Assign user roles unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Assign user roles failed: ${e.toString()}'));
    }
  }
}

