import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class UpdateTransferStatusUseCase {
  final TransferRepository _repository;

  UpdateTransferStatusUseCase(this._repository);

  Future<Either<Failure, Transfer>> call({
    required int id,
    required String status,
  }) async {
    return await _repository.updateStatus(
      id: id,
      status: status,
    );
  }
}

