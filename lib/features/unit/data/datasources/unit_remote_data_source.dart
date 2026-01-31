import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/unit_model.dart';

abstract class UnitRemoteDataSource {
  Future<Either<Failure, List<UnitModel>>> getUnits({String? search});
  Future<Either<Failure, UnitModel>> createUnit({
    required String name,
    required String description,
  });
  Future<Either<Failure, UnitModel>> updateUnit({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, UnitModel>> deleteUnit({required String id});
}

