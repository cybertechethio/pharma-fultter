import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class GetTransferDetailUseCase { 
  final TransferRepository repository;

  GetTransferDetailUseCase(this.repository);

  Future<Either<Failure, Transfer>> call(int id) async {
    return await repository.getTransferDetail(id);
  }
}

