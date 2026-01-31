import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class ValidateOtpUseCase {
  final AuthRepository _repository;

  ValidateOtpUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String identifier,
    required String otp,
  }) async {
    return await _repository.validateOtp(identifier: identifier, otp: otp);
  }
}
