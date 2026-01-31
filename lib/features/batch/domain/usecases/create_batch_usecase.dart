import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch.dart';
import '../repositories/batch_repository.dart';

class CreateBatchUseCase {
  final BatchRepository repository;

  CreateBatchUseCase(this.repository);

  Future<Either<Failure, BatchEntity>> call({
    required int itemId,
    required String batchName,
  }) async {
    return await repository.createBatch(
      itemId: itemId,
      batchName: batchName,
    );
  }
}

