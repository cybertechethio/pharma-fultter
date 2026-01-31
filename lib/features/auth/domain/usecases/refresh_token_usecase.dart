import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository _repository;

  RefreshTokenUseCase(this._repository);

  Future<Either<Failure, AuthToken>> call({
    required String refreshToken,
  }) async {
    return await _repository.refreshToken(refreshToken: refreshToken);
  }
}
