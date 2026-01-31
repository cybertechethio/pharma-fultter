import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/model.dart';
import '../repositories/model_repository.dart';

class GetModelsUseCase {
  final ModelRepository repository;

  GetModelsUseCase(this.repository);

  Future<Either<Failure, List<ModelEntity>>> call() async {
    return await repository.getModels();
  }
}

