import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../entities/auth_token.dart';
import '../entities/current_context.dart';
import '../repositories/auth_repository.dart';

class VerifyAccountUseCase {
  final AuthRepository _repository;

  VerifyAccountUseCase(this._repository);

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> call({
    required String identifier,
    required String otp,
  }) async {
    return await _repository.verifyAccount(
      identifier: identifier,
      otp: otp,
    );
  }
}
