import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch.dart';
import '../entities/batch_input.dart';
import '../repositories/batch_repository.dart';

class CreateBatchUseCase {
  final BatchRepository repository;

  CreateBatchUseCase(this.repository);

  Future<Either<Failure, BatchEntity>> call(BatchInput input) async {
    return await repository.createBatch(input);
  }
}

