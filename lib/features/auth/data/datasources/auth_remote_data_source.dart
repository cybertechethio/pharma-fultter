import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/auth_token_model.dart';
import '../models/generic_response_model.dart';
import '../models/user_model.dart';
import '../models/user_or_null_response_model.dart';
import '../models/current_context_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, GenericResponseModel>> loginUser({
    required String identifier,
    required String password,
  });
  
  Future<Either<Failure, UserModel>> registerUser({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  });
  
  Future<Either<Failure, AuthTokenModel>> refreshToken({
    required String refreshToken,
  });
  
  Future<Either<Failure, Unit>> logoutUser();
  
  Future<Either<Failure, GenericResponseModel>> verifyAccount({
    required String identifier,
    required String otp,
  });
  
  Future<Either<Failure, UserOrNullResponseModel>> forgotPassword({
    required String identifier,
  });
  
  Future<Either<Failure, UserOrNullResponseModel>> resendOtp({
    required String identifier,
  });
  
  Future<Either<Failure, UserModel>> validateOtp({
    required String identifier,
    required String otp,
  });
  
  Future<Either<Failure, UserModel>> updateUserProfile({
    required UserModel user,
  });
  
  Future<Either<Failure, UserModel>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  Future<Either<Failure, GenericResponseModel>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  });
  
  Future<Either<Failure, UserModel>> deleteAccount({
    required String password,
  });
  
  Future<Either<Failure, UserModel>> getCurrentUser();

  Future<Either<Failure, UserModel>> uploadProfilePicture({
    required File imageFile,
  });

  Future<Either<Failure, CurrentContextModel>> switchCompany({
    required String companyId,
  });

  Future<Either<Failure, CurrentContextModel>> switchBranch({
    required String branchId,
  });
}
