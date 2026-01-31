import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/model.dart';
import '../repositories/model_repository.dart';

class DeleteModelUseCase {
  final ModelRepository repository;

  DeleteModelUseCase(this.repository);

  Future<Either<Failure, ModelEntity>> call({required String id}) async {
    return await repository.deleteModel(id: id);
  }
}

