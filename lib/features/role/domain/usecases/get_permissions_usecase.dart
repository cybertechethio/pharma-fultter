import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/permission.dart';
import '../repositories/permission_repository.dart';

class GetPermissionsUseCase {
  final PermissionRepository repository;

  GetPermissionsUseCase(this.repository);

  Future<Either<Failure, Map<String, List<PermissionEntity>>>> call() async {
    return await repository.getPermissions();
  }
}

