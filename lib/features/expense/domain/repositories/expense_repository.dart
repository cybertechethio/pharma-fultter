import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/expense.dart';
import '../entities/expense_detail.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, Expense>> createExpense({
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  });

  Future<Either<Failure, PaginatedResponse<Expense>>> getExpenses({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  });

  Future<Either<Failure, ExpenseDetail>> getExpenseById({
    required String id,
  });

  Future<Either<Failure, Expense>> updateExpense({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentUrls,
    required List<String>? attachmentFilePaths,
  });

  Future<Either<Failure, Expense>> deleteExpense({
    required String id,
  });

  Future<Either<Failure, Unit>> createExpensePaymentMethod({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  });

  Future<Either<Failure, Unit>> updateExpensePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  });

  Future<Either<Failure, Unit>> deleteExpensePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  });
}
