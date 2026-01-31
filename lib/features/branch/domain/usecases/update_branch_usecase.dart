import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/branch.dart';
import '../repositories/branch_repository.dart';

class UpdateBranchUseCase {
  final BranchRepository _repository;

  UpdateBranchUseCase(this._repository);

  Future<Either<Failure, Branch>> call({
    required String branchId,
    required String name,
  }) async {
    return await _repository.updateBranch(
      branchId: branchId,
      name: name,
    );
  }
}
