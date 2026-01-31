import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/branch.dart';
import '../repositories/branch_repository.dart';

class GetBranchesUseCase {
  final BranchRepository _repository;

  GetBranchesUseCase(this._repository);

  Future<Either<Failure, List<Branch>>> call() async {
    return await _repository.getBranches();
  }
}
