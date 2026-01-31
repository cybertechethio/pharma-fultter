import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../models/branch_model.dart';
import 'branch_remote_data_source.dart';
import 'branch_api_service.dart';
import '../../../../shared/models/api_response.dart';

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource {
  final BranchApiService _apiService;

  BranchRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, BranchModel>> createBranch({
    required String name,
  }) async {
    LoggingService.auth('Starting create branch process', {
      'name': name,
    });
    
    try {
      final response = await _apiService.createBranch(
        name: name,
      );
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Create branch successful', {
            'branchId': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Create branch failed - server error', {
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
      LoggingService.error('Create branch data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Create branch response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Create branch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Create branch failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<BranchModel>>> getBranches() async {
    LoggingService.auth('Starting get branches process');
    
    try {
      final response = await _apiService.getBranches();
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Get branches successful', {
            'count': data.length,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Get branches failed - server error', {
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
      LoggingService.error('Get branches data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get branches response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get branches unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get branches failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BranchModel>> updateBranch({
    required String branchId,
    required String name,
  }) async {
    LoggingService.auth('Starting update branch process', {
      'branchId': branchId,
      'name': name,
    });
    
    try {
      final response = await _apiService.updateBranch(
        branchId: branchId,
        name: name,
      );
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Update branch successful', {
            'branchId': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Update branch failed - server error', {
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
      LoggingService.error('Update branch data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Update branch response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Update branch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Update branch failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BranchModel>> deleteBranch({
    required String branchId,
  }) async {
    LoggingService.auth('Starting delete branch process', {
      'branchId': branchId,
    });
    
    try {
      final response = await _apiService.deleteBranch(
        branchId: branchId,
      );
      
      return response.when(
        success: (success, message, data, meta, pagination) {
          LoggingService.auth('Delete branch successful', {
            'branchId': data.id,
            'name': data.name,
            'message': message,
          });
          return Right(data);
        },
        error: (success, error, meta) {
          LoggingService.auth('Delete branch failed - server error', {
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
      LoggingService.error('Delete branch data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Delete branch response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Delete branch unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Delete branch failed: ${e.toString()}'));
    }
  }
}