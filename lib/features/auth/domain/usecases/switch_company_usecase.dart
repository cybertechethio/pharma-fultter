import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/current_context.dart';
import '../repositories/auth_repository.dart';

class SwitchCompanyUseCase {
  final AuthRepository _repository;

  SwitchCompanyUseCase(this._repository);

  Future<Either<Failure, CurrentContext>> call({
    required String companyId,
  }) async {
    return await _repository.switchCompany(companyId: companyId);
  }
}

