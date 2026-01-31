import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/branch.dart';

abstract class BranchRepository {
  Future<Either<Failure, Branch>> createBranch({
    required String name,
  });

  Future<Either<Failure, List<Branch>>> getBranches();

  Future<Either<Failure, Branch>> updateBranch({
    required String branchId,
    required String name,
  });

  Future<Either<Failure, Branch>> deleteBranch({
    required String branchId,
  });
}
