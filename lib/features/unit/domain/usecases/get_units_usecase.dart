import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/unit.dart';
import '../repositories/unit_repository.dart';

class GetUnitsUseCase {
  final UnitRepository repository;

  GetUnitsUseCase(this.repository);

  Future<Either<Failure, List<UnitEntity>>> call({String? search}) async {
    return await repository.getUnits(search: search);
  }
}

