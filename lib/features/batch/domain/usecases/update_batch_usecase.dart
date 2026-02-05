import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch.dart';
import '../entities/batch_input.dart';
import '../repositories/batch_repository.dart';

class UpdateBatchUseCase {
  final BatchRepository repository;

  UpdateBatchUseCase(this.repository);

  Future<Either<Failure, BatchEntity>> call(int id, BatchInput input) async {
    return await repository.updateBatch(id, input);
  }
}

