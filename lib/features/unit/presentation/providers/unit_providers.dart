import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/unit_api_service.dart';
import '../../data/datasources/unit_remote_data_source.dart';
import '../../data/datasources/unit_remote_data_source_impl.dart';
import '../../data/repositories/unit_repository_impl.dart';
import '../../domain/repositories/unit_repository.dart';
import '../../domain/usecases/get_units_usecase.dart';
import '../../domain/usecases/create_unit_usecase.dart';
import '../../domain/usecases/update_unit_usecase.dart';
import '../../domain/usecases/delete_unit_usecase.dart';

part 'unit_providers.g.dart';

@riverpod
UnitApiService unitApiService(Ref ref) {
  return const UnitApiService();
}

@riverpod
UnitRemoteDataSource unitRemoteDataSource(Ref ref) {
  return UnitRemoteDataSourceImpl(
    ref.watch(unitApiServiceProvider),
  );
}

@riverpod
UnitRepository unitRepository(Ref ref) {
  return UnitRepositoryImpl(
    ref.watch(unitRemoteDataSourceProvider),
  );
}

@riverpod
GetUnitsUseCase getUnitsUseCase(Ref ref) {
  return GetUnitsUseCase(
    ref.watch(unitRepositoryProvider),
  );
}

@riverpod
CreateUnitUseCase createUnitUseCase(Ref ref) {
  return CreateUnitUseCase(
    ref.watch(unitRepositoryProvider),
  );
}

@riverpod
UpdateUnitUseCase updateUnitUseCase(Ref ref) {
  return UpdateUnitUseCase(
    ref.watch(unitRepositoryProvider),
  );
}

@riverpod
DeleteUnitUseCase deleteUnitUseCase(Ref ref) {
  return DeleteUnitUseCase(
    ref.watch(unitRepositoryProvider),
  );
}

