import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/batch_consolidation_request_model.dart';
import '../repositories/batch_repository.dart';

class ConsolidateBatchUseCase {
  final BatchRepository repository;

  ConsolidateBatchUseCase(this.repository);

  Future<Either<Failure, void>> call(
    BatchConsolidationRequestModel request,
  ) async {
    return repository.consolidation(request);
  }
}
