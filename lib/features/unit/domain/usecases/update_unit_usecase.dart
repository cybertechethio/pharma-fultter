import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/unit.dart';
import '../repositories/unit_repository.dart';

class UpdateUnitUseCase {
  final UnitRepository repository;

  UpdateUnitUseCase(this.repository);

  Future<Either<Failure, UnitEntity>> call({
    required String id,
    required String name,
    required String description,
  }) async {
    return await repository.updateUnit(
      id: id,
      name: name,
      description: description,
    );
  }
}

