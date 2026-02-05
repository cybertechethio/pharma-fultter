import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
    required String userType,
  }) async {
    // Validation: First name must not be empty
    if (firstName.trim().isEmpty) {
      return Left(Failure.validationError('First name is required'));
    }

    // Validation: Last name must not be empty
    if (lastName.trim().isEmpty) {
      return Left(Failure.validationError('Last name is required'));
    }

    // Validation: Email must not be empty
    if (email.trim().isEmpty) {
      return Left(Failure.validationError('Email is required'));
    }

    // Validation: Phone must not be empty
    if (phone.trim().isEmpty) {
      return Left(Failure.validationError('Phone number is required'));
    }

    return await repository.createUser(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim(),
      phone: phone.trim(),
      isActive: isActive,
      userType: userType,
    );
  }
}

