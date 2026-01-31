import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/branch_model.dart';

abstract class BranchRemoteDataSource {
  Future<Either<Failure, BranchModel>> createBranch({
    required String name,
  });

  Future<Either<Failure, List<BranchModel>>> getBranches();

  Future<Either<Failure, BranchModel>> updateBranch({
    required String branchId,
    required String name,
  });

  Future<Either<Failure, BranchModel>> deleteBranch({
    required String branchId,
  });
}
