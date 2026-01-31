import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/model.dart';

abstract class ModelRepository {
  Future<Either<Failure, List<ModelEntity>>> getModels();
  Future<Either<Failure, ModelEntity>> createModel({
    required String name,
    required String description,
  });
  Future<Either<Failure, ModelEntity>> updateModel({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, ModelEntity>> deleteModel({required String id});
}

