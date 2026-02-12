import 'package:cyber_pos/features/transaction/data/mappers/transaction_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_remote_data_source.dart';
import '../models/create_trans_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource _remoteDataSource;

  TransactionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Transaction>>> getTransactions({
    int page = 1,
    int limit = 25,
    TransactionType? transactionType,
  }) async {
    final result = await _remoteDataSource.getTransactions(
      page: page,
      limit: limit,
      transactionType: transactionType,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionDetail(int id) async {
    final response = await _remoteDataSource.getTransactionDetail(id);

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Transaction>> createTransaction({
    required CreateTransRequest data,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    
    final response = await _remoteDataSource.createTransaction(
      request: data,
      receiptFilePaths: receiptFilePaths,
      paymentAttachmentFilePaths: paymentAttachmentFilePaths,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Transaction>> reverseTransaction({
    required int reversesTransactionId,
    String? notes,
  }) async {
    final response = await _remoteDataSource.reverseTransaction(
      reversesTransactionId: reversesTransactionId,
      notes: notes,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

