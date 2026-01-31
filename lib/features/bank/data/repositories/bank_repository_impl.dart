import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/bank.dart';
import '../../domain/repositories/bank_repository.dart';
import '../datasources/bank_remote_data_source.dart';
import '../mappers/bank_mapper.dart';

class BankRepositoryImpl implements BankRepository {
  final BankRemoteDataSource _remoteDataSource;

  BankRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BankEntity>>> getBanks({
    String? search,
  }) async {
    final response = await _remoteDataSource.getBanks(search: search);
    return response.fold(
      (failure) => Left(failure),
      (models) => Right(models.map((m) => m.toDomain()).toList()),
    );
  }

  @override
  Future<Either<Failure, BankEntity>> createBank({
    required String name,
  }) async {
    final response = await _remoteDataSource.createBank(name: name);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, BankEntity>> updateBank({
    required int id,
    required String name,
  }) async {
    final response = await _remoteDataSource.updateBank(id: id, name: name);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, BankEntity>> deleteBank({required int id}) async {
    final response = await _remoteDataSource.deleteBank(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

