import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpensesUseCase {
  final ExpenseRepository _repository;

  GetExpensesUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<Expense>>> call({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  }) async {
    return await _repository.getExpenses(
      page: page,
      limit: limit,
      fromDate: fromDate,
      toDate: toDate,
      search: search,
      branchId: branchId,
    );
  }
}
