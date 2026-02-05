import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../data/models/create_trans_request.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, PaginatedResponse<Transaction>>> getTransactions({
    int page = 1,
    int limit = 25,
    TransactionType? transactionType,
  });
  
  Future<Either<Failure, Transaction>> getTransactionDetail(int id);
  
  Future<Either<Failure, Transaction>> createTransaction({
    required CreateTransRequest data,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  Future<Either<Failure, Transaction>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  });
}

