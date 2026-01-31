import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository _repository;

  ResendOtpUseCase(this._repository);

  Future<Either<Failure, User?>> call({
    required String identifier,
  }) async {
    return await _repository.resendOtp(identifier: identifier);
  }
}
