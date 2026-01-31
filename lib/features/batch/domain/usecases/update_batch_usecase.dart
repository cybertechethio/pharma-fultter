import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch.dart';
import '../repositories/batch_repository.dart';

class UpdateBatchUseCase {
  final BatchRepository repository;

  UpdateBatchUseCase(this.repository);

  Future<Either<Failure, BatchEntity>> call({
    required int id,
    required String batchName,
  }) async {
    return await repository.updateBatch(
      id: id,
      batchName: batchName,
    );
  }
}

