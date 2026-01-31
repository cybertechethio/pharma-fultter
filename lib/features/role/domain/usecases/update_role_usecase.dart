import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/role.dart';
import '../repositories/role_repository.dart';

class UpdateRoleUseCase {
  final RoleRepository repository;

  UpdateRoleUseCase(this.repository);

  Future<Either<Failure, RoleEntity>> call({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    // Validation: At least 1 permission required
    if (permissionIds.isEmpty) {
      return Left(Failure.validationError('At least one permission is required'));
    }

    // Validation: Name must not be empty
    if (name.trim().isEmpty) {
      return Left(Failure.validationError('Role name is required'));
    }

    return await repository.updateRole(
      id: id,
      name: name.trim(),
      description: description?.trim(),
      permissionIds: permissionIds,
      isActive: isActive,
    );
  }
}

