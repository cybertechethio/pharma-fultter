import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/company.dart';
import '../../data/models/company_request_model.dart';

abstract class CompanyRepository {
  Future<Either<Failure, Company>> getCompany({
    required String companyId,
  });

  Future<Either<Failure, Company>> updateCompany({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  });
}

