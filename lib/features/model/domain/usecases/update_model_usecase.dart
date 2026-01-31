import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/model.dart';
import '../repositories/model_repository.dart';

class UpdateModelUseCase {
  final ModelRepository repository;

  UpdateModelUseCase(this.repository);

  Future<Either<Failure, ModelEntity>> call({
    required String id,
    required String name,
    required String description,
  }) async {
    return await repository.updateModel(
      id: id,
      name: name,
      description: description,
    );
  }
}

