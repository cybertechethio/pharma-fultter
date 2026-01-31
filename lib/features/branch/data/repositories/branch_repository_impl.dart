import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/branch.dart';
import '../../domain/repositories/branch_repository.dart';
import '../datasources/branch_remote_data_source.dart';
import '../mappers/branch_mapper.dart';

class BranchRepositoryImpl implements BranchRepository {
  final BranchRemoteDataSource _remoteDataSource;

  BranchRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Branch>> createBranch({
    required String name,
  }) async {
    final response = await _remoteDataSource.createBranch(
      name: name,
    );

    return response.fold(
      (failure) => Left(failure),
      (branchModel) => Right(branchModel.toDomain()),
    );
  }

  @override
  Future<Either<Failure, List<Branch>>> getBranches() async {
    final response = await _remoteDataSource.getBranches();

    return response.fold(
      (failure) => Left(failure),
      (branchModels) => Right(branchModels.map((model) => model.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, Branch>> updateBranch({
    required String branchId,
    required String name,
  }) async {
    final response = await _remoteDataSource.updateBranch(
      branchId: branchId,
      name: name,
    );

    return response.fold(
      (failure) => Left(failure),
      (branchModel) => Right(branchModel.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Branch>> deleteBranch({
    required String branchId,
  }) async {
    final response = await _remoteDataSource.deleteBranch(
      branchId: branchId,
    );

    return response.fold(
      (failure) => Left(failure),
      (branchModel) => Right(branchModel.toDomain()),
    );
  }
}
