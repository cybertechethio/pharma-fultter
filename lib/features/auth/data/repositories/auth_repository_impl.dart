import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:cyber_pos/features/auth/data/mappers/auth_token_mapper.dart';
import 'package:cyber_pos/features/auth/data/mappers/user_mapper.dart';
import 'package:cyber_pos/features/auth/data/mappers/user_or_null_response_mapper.dart';
import 'package:cyber_pos/features/auth/data/mappers/current_context_mapper.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/entities/current_context.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/auth_local_data_source.dart';
import '../mappers/generic_response_mapper.dart';
import '../../../../core/errors/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> register({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    print('9...................................................🚀 REPOSITORY IMPL STARTED:');
    print('📍 Phone: $phone');
    print('📍 Email: $email');
    print('📍 First Name: $firstName');
    print('📍 Last Name: $lastName');
    print('📍 Company Name: $companyName');
    
    print('10...................................................🚀 CALLING REMOTE DATA SOURCE:');
    final response = await _remoteDataSource.registerUser(
      phone: phone,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
    );
    
    print('11...................................................🚀 REMOTE DATA SOURCE RESULT: $response');

    return response.fold(
      (failure) {
        print('12...................................................❌ REPOSITORY FAILURE: $failure');
        return Left(failure);
      },
      (userModel) async {
        print('13...................................................✅ REPOSITORY SUCCESS: Converting to domain');
        final user = userModel.toDomain();
        print('14...................................................✅ DOMAIN USER: $user');
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> loginUser({
    required String identifier,
    required String password,
  }) async {
    final response = await _remoteDataSource.loginUser(
      identifier: identifier,
      password: password,
    );

    return response.fold(
      (failure) => Left(failure),
      (genericResponseModel) async {
        final result = genericResponseModel.toDomain();
        await _localDataSource.saveTokens(result.tokens);
        await _localDataSource.saveUser(result.user);
        await _localDataSource.saveCurrentContext(result.currentContext);
        if (result.currentCompany != null) {
          await _localDataSource.saveCompany(result.currentCompany!);
        }
        return Right((user: result.user, tokens: result.tokens, currentContext: result.currentContext));
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    final response = await _remoteDataSource.logoutUser();

    return response.fold(
      (failure) => Left(failure),
      (_) async {
        await _localDataSource.clearTokens();
        await _localDataSource.clearUser();
        await _localDataSource.clearCurrentContext();
        await _localDataSource.clearCompany();
        await _localDataSource.clearBranches();
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    // First try to fetch from server to get latest user data (including profile picture)
    final remoteResponse = await _remoteDataSource.getCurrentUser();
    
    return remoteResponse.fold(
      // If server call fails, fall back to local storage
      (failure) async {
        try {
          final localUser = await _localDataSource.getUser();
          return Right(localUser);
        } catch (e) {
          return Left(Failure.storageError('Failed to get current user: ${e.toString()}'));
        }
      },
      // If server call succeeds, update local storage and return fresh data
      (userModel) async {
        final updatedUser = userModel.toDomain();
        await _localDataSource.saveUser(updatedUser);
        return Right(updatedUser);
      },
    );
  }

  @override
  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> verifyAccount({
    required String identifier,
    required String otp,
  }) async {
    final response = await _remoteDataSource.verifyAccount(
      identifier: identifier,
      otp: otp,
    );

    return response.fold(
      (failure) => Left(failure),
      (genericResponseModel) async {
        final result = genericResponseModel.toDomain();
        await _localDataSource.saveTokens(result.tokens);
        await _localDataSource.saveUser(result.user);
        await _localDataSource.saveCurrentContext(result.currentContext);
        if (result.currentCompany != null) {
          await _localDataSource.saveCompany(result.currentCompany!);
        }
        return Right((user: result.user, tokens: result.tokens, currentContext: result.currentContext));
      },
    );
  }

  @override
  Future<Either<Failure, User?>> forgotPassword({
    required String identifier,
  }) async {
    final response = await _remoteDataSource.forgotPassword(
      identifier: identifier,
    );

    return response.fold(
      (failure) => Left(failure),
      (userOrNullResponseModel) async {
        final user = userOrNullResponseModel.toDomain();
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, User?>> resendOtp({
    required String identifier,
  }) async {
    final response = await _remoteDataSource.resendOtp(
      identifier: identifier,
    );

    return response.fold(
      (failure) => Left(failure),
      (userOrNullResponseModel) async {
        final user = userOrNullResponseModel.toDomain();
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, User>> validateOtp({
    required String identifier,
    required String otp,
  }) async {
    final response = await _remoteDataSource.validateOtp(
      identifier: identifier,
      otp: otp,
    );

    return response.fold(
      (failure) => Left(failure),
      (userModel) async {
        final user = userModel.toDomain();
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, AuthToken>> refreshToken({
    required String refreshToken,
  }) async {
    final response = await _remoteDataSource.refreshToken(
      refreshToken: refreshToken,
    );

    return response.fold(
      (failure) => Left(failure),
      (authTokenModel) async {
        final tokens = authTokenModel.toDomain();
        await _localDataSource.saveTokens(tokens);
        return Right(tokens);
      },
    );
  }

  @override
  Future<Either<Failure, User>> updateUserProfile({
    required User user,
  }) async {
    final response = await _remoteDataSource.updateUserProfile(
      user: user.toModel(),
    );

    return response.fold(
      (failure) => Left(failure),
      (userModel) async {
        final updatedUser = userModel.toDomain();
        await _localDataSource.saveUser(updatedUser);
        return Right(updatedUser);
      },
    );
  }

  @override
  Future<Either<Failure, User>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await _remoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    return response.fold(
      (failure) => Left(failure),
      (userModel) async {
        final user = userModel.toDomain();
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    final response = await _remoteDataSource.resetPassword(
      identifier: identifier,
      resetToken: resetToken,
      newPassword: newPassword,
    );

    return response.fold(
      (failure) => Left(failure),
      (genericResponseModel) async {
        final result = genericResponseModel.toDomain();
        await _localDataSource.saveTokens(result.tokens);
        await _localDataSource.saveUser(result.user);
        await _localDataSource.saveCurrentContext(result.currentContext);
        if (result.currentCompany != null) {
          await _localDataSource.saveCompany(result.currentCompany!);
        }
        return Right((user: result.user, tokens: result.tokens, currentContext: result.currentContext));
      },
    );
  }

  @override
  Future<Either<Failure, User>> uploadProfilePicture({
    required File imageFile,
  }) async {
    final response = await _remoteDataSource.uploadProfilePicture(
      imageFile: imageFile,
    );

    return response.fold(
      (failure) => Left(failure),
      (userModel) async {
        final updatedUser = userModel.toDomain();
        await _localDataSource.saveUser(updatedUser);
        return Right(updatedUser);
      },
    );
  }

  @override
  Future<Either<Failure, User>> deleteAccount({
    required String password,
  }) async {
    final response = await _remoteDataSource.deleteAccount(
      password: password,
    );

    return response.fold(
      (failure) => Left(failure),
      (userModel) async {
        final user = userModel.toDomain();
        await _localDataSource.clearTokens();
        await _localDataSource.clearUser();
        await _localDataSource.clearCurrentContext();
        await _localDataSource.clearCompany();
        await _localDataSource.clearBranches();
        return Right(user);
      },
    );
  }

  @override
  Future<Either<Failure, CurrentContext>> switchCompany({
    required String companyId,
  }) async {
    final response = await _remoteDataSource.switchCompany(companyId: companyId);

    return response.fold(
      (failure) => Left(failure),
      (contextModel) async {
        // Convert model to domain entity
        final context = contextModel.toDomain();
        // Update local storage with the new context
        await _localDataSource.saveCurrentContext(context);
        return Right(context);
      },
    );
  }

  @override
  Future<Either<Failure, CurrentContext>> switchBranch({
    required String branchId,
  }) async {
    final response = await _remoteDataSource.switchBranch(branchId: branchId);

    return response.fold(
      (failure) => Left(failure),
      (contextModel) async {
        // Convert model to domain entity
        final context = contextModel.toDomain();
        // Update local storage with the new context
        await _localDataSource.saveCurrentContext(context);
        return Right(context);
      },
    );
  }
}