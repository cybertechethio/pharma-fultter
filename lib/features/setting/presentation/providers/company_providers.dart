import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/company_api_service.dart';
import '../../data/datasources/company_remote_data_source.dart';
import '../../data/datasources/company_remote_data_source_impl.dart';
import '../../data/repositories/company_repository_impl.dart';
import '../../domain/repositories/company_repository.dart';
import '../../domain/usecases/get_company_usecase.dart';
import '../../domain/usecases/update_company_usecase.dart';

part 'company_providers.g.dart';

@Riverpod(keepAlive: true)
CompanyApiService companyApiService(Ref ref) {
  return CompanyApiService.create();
}

@Riverpod(keepAlive: true)
CompanyRemoteDataSource companyRemoteDataSource(Ref ref) {
  return CompanyRemoteDataSourceImpl(
    ref.watch(companyApiServiceProvider),
  );
}

@Riverpod(keepAlive: true)
CompanyRepository companyRepository(Ref ref) {
  return CompanyRepositoryImpl(
    ref.watch(companyRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
GetCompanyUseCase getCompanyUseCase(Ref ref) {
  return GetCompanyUseCase(
    ref.watch(companyRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateCompanyUseCase updateCompanyUseCase(Ref ref) {
  return UpdateCompanyUseCase(
    ref.watch(companyRepositoryProvider),
  );
}

