import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/unit.dart';
import '../repositories/unit_repository.dart';

class CreateUnitUseCase {
  final UnitRepository repository;

  CreateUnitUseCase(this.repository);

  Future<Either<Failure, UnitEntity>> call({
    required String name,
    required String description,
  }) async {
    return await repository.createUnit(
      name: name,
      description: description,
    );
  }
}

