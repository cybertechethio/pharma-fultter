import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/current_context.dart';
import '../entities/user.dart';
import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<Failure, ({User user, AuthToken tokens, CurrentContext currentContext})>> call({
    required String identifier,
    required String password,
  }) async {
    return await _repository.loginUser(
      identifier: identifier,
      password: password,
    );
  }
}
