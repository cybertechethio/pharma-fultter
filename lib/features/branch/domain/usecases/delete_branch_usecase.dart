import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/branch.dart';
import '../repositories/branch_repository.dart';

class DeleteBranchUseCase {
  final BranchRepository _repository;

  DeleteBranchUseCase(this._repository);

  Future<Either<Failure, Branch>> call({
    required String branchId,
  }) async {
    return await _repository.deleteBranch(
      branchId: branchId,
    );
  }
}
