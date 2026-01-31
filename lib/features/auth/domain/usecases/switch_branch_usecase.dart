import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/current_context.dart';
import '../repositories/auth_repository.dart';

class SwitchBranchUseCase {
  final AuthRepository _repository;

  SwitchBranchUseCase(this._repository);

  Future<Either<Failure, CurrentContext>> call({
    required String branchId,
  }) async {
    return await _repository.switchBranch(branchId: branchId);
  }
}

