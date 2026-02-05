import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/dashboard.dart';
import '../../data/datasources/dashboard_api_service.dart';
import '../../data/datasources/dashboard_remote_data_source.dart';
import '../../data/datasources/dashboard_remote_data_source_impl.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_usecase.dart';

part 'dashboard_providers.g.dart';

@riverpod
DashboardApiService dashboardApiService(Ref ref) {
  return const DashboardApiService();
}

@riverpod
DashboardRemoteDataSource dashboardRemoteDataSource(Ref ref) {
  return DashboardRemoteDataSourceImpl(
    ref.watch(dashboardApiServiceProvider),
  );
}

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepositoryImpl(
    ref.watch(dashboardRemoteDataSourceProvider),
  );
}

@riverpod
GetDashboardUseCase getDashboardUseCase(Ref ref) {
  return GetDashboardUseCase(
    ref.watch(dashboardRepositoryProvider),
  );
}

@riverpod
Future<Dashboard> getDashboard(
  Ref ref, {
  required DateTime startDate,
  required DateTime endDate,
}) async {
  final useCase = ref.read(getDashboardUseCaseProvider);
  final result = await useCase.call(
    startDate: startDate,
    endDate: endDate,
  );

  return result.fold(
    (failure) => throw failure,
    (dashboard) => dashboard,
  );
}

