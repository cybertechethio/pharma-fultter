import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';

class GetCompanyUseCase {
  final CompanyRepository _repository;

  GetCompanyUseCase(this._repository);

  Future<Either<Failure, Company>> call({
    required String companyId,
  }) async {
    return await _repository.getCompany(companyId: companyId);
  }
}

