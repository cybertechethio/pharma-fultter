import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/create_trans_request.dart';
import '../models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<TransactionModel>>> getTransactions({
    int page = 1,
    int limit = 25,
    TransactionType? transactionType,
  });
  
  Future<Either<Failure, TransactionModel>> getTransactionDetail(int id);
  
  Future<Either<Failure, TransactionModel>> createTransaction({
    required CreateTransRequest request,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  Future<Either<Failure, TransactionModel>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  });
}

