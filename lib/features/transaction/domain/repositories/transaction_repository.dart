import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/transaction.dart';
import '../entities/transaction_data.dart';
import '../entities/transaction_detail.dart';

abstract class TransactionRepository {
  Future<Either<Failure, PaginatedResponse<Transaction>>> getTransactions({
    int page = 1,
    int limit = 25,
  });
  
  Future<Either<Failure, TransactionDetail>> getTransactionDetail(int id);
  
  Future<Either<Failure, Transaction>> createTransaction({
    required TransactionData data,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  Future<Either<Failure, Transaction>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  });
}

