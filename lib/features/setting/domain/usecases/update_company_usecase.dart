import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';
import '../../data/models/company_request_model.dart';

class UpdateCompanyUseCase {
  final CompanyRepository _repository;

  UpdateCompanyUseCase(this._repository);

  Future<Either<Failure, Company>> call({
    required String companyId,
    required CompanyRequestModel request,
    String? logoFilePath,
  }) async {
    return await _repository.updateCompany(
      companyId: companyId,
      request: request,
      logoFilePath: logoFilePath,
    );
  }
}

