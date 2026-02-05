import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, List<UserModel>>> getUsers();
  Future<Either<Failure, UserModel>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
    required String userType,
  });
  Future<Either<Failure, UserModel>> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
    required String userType,
  });
  Future<Either<Failure, UserModel>> deleteUser({required int id});
}

