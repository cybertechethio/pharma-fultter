import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/create_transfer_request.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class CreateTransferUseCase {
  final TransferRepository repository;

  CreateTransferUseCase(this.repository);

  Future<Either<Failure, Transfer>> call({
    required CreateTransferRequest data,
  }) async {
    return await repository.createTransfer(data: data);
  }
}

