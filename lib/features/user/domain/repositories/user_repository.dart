import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
  
  Future<Either<Failure, UserEntity>> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  });
  
  Future<Either<Failure, UserEntity>> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  });
  
  Future<Either<Failure, UserEntity>> deleteUser({
    required int id,
  });
}

