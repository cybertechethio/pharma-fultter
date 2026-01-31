import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/role.dart';
import '../repositories/role_repository.dart';

class DeleteRoleUseCase {
  final RoleRepository repository;

  DeleteRoleUseCase(this.repository);

  Future<Either<Failure, RoleEntity>> call({
    required int id,
  }) async {
    return await repository.deleteRole(id: id);
  }
}

