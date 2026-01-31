import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/branch.dart';
import '../repositories/branch_repository.dart';

class CreateBranchUseCase {
  final BranchRepository _repository;

  CreateBranchUseCase(this._repository);

  Future<Either<Failure, Branch>> call({
    required String name,
  }) async {
    return await _repository.createBranch(
      name: name,
    );
  }
}
