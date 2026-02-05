import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/batch_split_request_model.dart';
import '../repositories/batch_repository.dart';

class SplitBatchUseCase {
  final BatchRepository repository;

  SplitBatchUseCase(this.repository);

  Future<Either<Failure, void>> call(BatchSplitRequestModel request) async {
    return repository.split(request);
  }
}
