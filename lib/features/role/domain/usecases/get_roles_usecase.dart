import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/role.dart';
import '../repositories/role_repository.dart';

class GetRolesUseCase {
  final RoleRepository repository;

  GetRolesUseCase(this.repository);

  Future<Either<Failure, List<RoleEntity>>> call() async {
    return await repository.getRoles();
  }
}

