import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/batch_transfer_request_model.dart';
import '../repositories/batch_repository.dart';

class TransferBatchUseCase {
  final BatchRepository repository;

  TransferBatchUseCase(this.repository);

  Future<Either<Failure, void>> call(BatchTransferRequestModel request) async {
    return repository.transfer(request);
  }
}
