import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/unit.dart';

abstract class UnitRepository {
  Future<Either<Failure, List<UnitEntity>>> getUnits({String? search});
  Future<Either<Failure, UnitEntity>> createUnit({
    required String name,
    required String description,
  });
  Future<Either<Failure, UnitEntity>> updateUnit({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, UnitEntity>> deleteUnit({required String id});
}

