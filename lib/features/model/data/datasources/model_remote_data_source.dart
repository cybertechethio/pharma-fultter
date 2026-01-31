import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/model_model.dart';

abstract class ModelRemoteDataSource {
  Future<Either<Failure, List<ModelModel>>> getModels();
  Future<Either<Failure, ModelModel>> createModel({
    required String name,
    required String description,
  });
  Future<Either<Failure, ModelModel>> updateModel({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, ModelModel>> deleteModel({required String id});
}

