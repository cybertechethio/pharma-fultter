import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/create_trans_request.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class CreateTransactionUseCase {
  final TransactionRepository repository;

  CreateTransactionUseCase(this.repository);

  Future<Either<Failure, Transaction>> call({
    required CreateTransRequest data,
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

