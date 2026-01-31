import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<Transaction>>> call({
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getTransactions(page: page, limit: limit);
  }
}

