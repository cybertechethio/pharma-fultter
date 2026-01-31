import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../entities/auth_token.dart';
import '../entities/current_context.dart';

abstract class AuthRepository {

  Future<Either<Failure, User>> register({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  });

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> loginUser({
    required String identifier,
    required String password,
  });

  Future<Either<Failure, Unit>> logoutUser();

  Future<Either<Failure, User?>> getCurrentUser();

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> verifyAccount({
    required String identifier,
    required String otp,
  });

  Future<Either<Failure, User?>> forgotPassword({
    required String identifier,
  });

  Future<Either<Failure, User?>> resendOtp({
    required String identifier,
  });

  Future<Either<Failure, User>> validateOtp({
    required String identifier,
    required String otp,
  });

  Future<Either<Failure, AuthToken>> refreshToken({
    required String refreshToken,
  });

  Future<Either<Failure, User>> updateUserProfile({
    required User user,
  });

  Future<Either<Failure, User>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  });

  Future<Either<Failure, User>> deleteAccount({
    required String password,
  });

  Future<Either<Failure, User>> uploadProfilePicture({
    required File imageFile,
  });

  Future<Either<Failure, CurrentContext>> switchCompany({
    required String companyId,
  });

  Future<Either<Failure, CurrentContext>> switchBranch({
    required String branchId,
  });
}
