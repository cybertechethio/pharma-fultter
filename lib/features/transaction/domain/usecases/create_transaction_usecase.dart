import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/transaction.dart';
import '../entities/transaction_data.dart';
import '../repositories/transaction_repository.dart';

class CreateTransactionUseCase {
  final TransactionRepository repository;

  CreateTransactionUseCase(this.repository);

  Future<Either<Failure, Transaction>> call({
    required TransactionData data,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    return await repository.createTransaction(
      data: data,
      receiptFilePaths: receiptFilePaths,
      paymentAttachmentFilePaths: paymentAttachmentFilePaths,
    );
  }
}

