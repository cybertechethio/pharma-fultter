import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/batch.dart';
import '../repositories/batch_repository.dart';

class GetBatchesByItemUseCase {
  final BatchRepository repository;

  GetBatchesByItemUseCase(this.repository);

  Future<Either<Failure, List<BatchEntity>>> call(int itemId) async {
    return await repository.getBatchesByItemId(itemId);
  }
}
