import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_remote_data_source.dart';
import '../mappers/company_mapper.dart';
import '../models/company_request_model.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource _remoteDataSource;

  CompanyRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Company>> getCompany({
    required String companyId,
  }) async {
    final response = await _remoteDataSource.getCompany(
      companyId: companyId,
    );

    return response.fold(
      (failure) => Left(failure),
      (companyModel) => Right(companyModel.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Company>> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  }) async {
    final response = await _remoteDataSource.updateCompany(
      companyId: companyId,
      request: request,
      logoFilePath: logoFilePath,
    );

    return response.fold(
      (failure) => Left(failure),
      (companyModel) => Right(companyModel.toDomain()),
    );
  }
}

