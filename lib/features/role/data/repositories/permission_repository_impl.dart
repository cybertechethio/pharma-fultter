import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/permission.dart';
import '../../domain/repositories/permission_repository.dart';
import '../datasources/permission_remote_data_source.dart';
import '../mappers/permission_mapper.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionRemoteDataSource _remote;

  PermissionRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, Map<String, List<PermissionEntity>>>> getPermissions({
    int page = 1,
    int limit = 1000,
    String? search,
  }) async {
    final response = await _remote.getPermissions(
      page: page,
      limit: limit,
      search: search,
    );
    
    return response.fold(
      (failure) => Left(failure),
      (groupedModels) {
        // Convert dynamic grouped permissions to map of category -> list of entities
        final Map<String, List<PermissionEntity>> grouped = {};
        
        groupedModels.forEach((category, permissions) {
          grouped[category] = permissions.map((p) => p.toDomain()).toList();
        });
        
        return Right(grouped);
      },
    );
  }
}

