import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/transaction_model.dart';
import '../models/transaction_response_model.dart';
import '../models/transaction_detail_response_model.dart';

abstract class TransactionRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<TransactionResponseModel>>> getTransactions({
    int page = 1,
    int limit = 25,
  });
  
  Future<Either<Failure, TransactionDetailResponseModel>> getTransactionDetail(int id);
  
  Future<Either<Failure, TransactionResponseModel>> createTransaction({
    required TransactionModel request,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  });

  Future<Either<Failure, TransactionResponseModel>> reverseTransaction({
    required TransactionType transactionType,
    required int reversesTransactionId,
    String? notes,
  });
}

