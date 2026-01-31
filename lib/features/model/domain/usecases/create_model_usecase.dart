import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/model.dart';
import '../repositories/model_repository.dart';

class CreateModelUseCase {
  final ModelRepository repository;

  CreateModelUseCase(this.repository);

  Future<Either<Failure, ModelEntity>> call({
    required String name,
    required String description,
  }) async {
    return await repository.createModel(
      name: name,
      description: description,
    );
  }
}

