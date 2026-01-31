import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../entities/auth_token.dart';
import '../entities/current_context.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> call({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    return await _repository.resetPassword(
      identifier: identifier,
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}
