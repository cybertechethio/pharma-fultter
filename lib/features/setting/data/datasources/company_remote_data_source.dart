import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/company_model.dart';
import '../models/company_request_model.dart';

abstract class CompanyRemoteDataSource {
  Future<Either<Failure, CompanyModel>> getCompany({
    required String companyId,
  });

  Future<Either<Failure, CompanyModel>> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  });
}

