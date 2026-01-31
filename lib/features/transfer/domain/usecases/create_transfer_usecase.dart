import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transfer.dart';
import '../entities/transfer_data.dart';
import '../repositories/transfer_repository.dart';

class CreateTransferUseCase {
  final TransferRepository repository;

  CreateTransferUseCase(this.repository);

  Future<Either<Failure, Transfer>> call({
    required TransferData data,
  }) async {
    return await repository.createTransfer(data: data);
  }
}













