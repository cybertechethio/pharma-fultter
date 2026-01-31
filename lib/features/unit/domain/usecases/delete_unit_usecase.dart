import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/unit.dart';
import '../repositories/unit_repository.dart';

class DeleteUnitUseCase {
  final UnitRepository repository;

  DeleteUnitUseCase(this.repository);

  Future<Either<Failure, UnitEntity>> call({required String id}) async {
    return await repository.deleteUnit(id: id);
  }
}

