import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class ReverseTransactionUseCase {
  final TransactionRepository repository;

  ReverseTransactionUseCase(this.repository);

  Future<Either<Failure, Transaction>> call({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  }) async {
    return await repository.reverseTransaction(
      transactionType: transactionType,
      reversesTransactionId: reversesTransactionId,
      notes: notes,
    );
  }
}

