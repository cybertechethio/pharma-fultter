import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transaction_detail.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionDetailUseCase {
  final TransactionRepository repository;

  GetTransactionDetailUseCase(this.repository);

  Future<Either<Failure, TransactionDetail>> call(int id) async {
    return await repository.getTransactionDetail(id);
  }
}

