import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/expense.dart';
import '../../domain/entities/expense_detail.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_remote_data_source.dart';
import '../mappers/expense_mapper.dart';
import '../mappers/expense_detail_mapper.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remote;

  ExpenseRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, Expense>> createExpense({
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  }) async {
    final result = await _remote.create(
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentFilePaths: attachmentFilePaths,
      paymentMethods: paymentMethods,
    );

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<Expense>>> getExpenses({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  }) async {
    final result = await _remote.getAll(
      page: page,
      limit: limit,
      fromDate: fromDate,
      toDate: toDate,
      search: search,
      branchId: branchId,
    );

    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, ExpenseDetail>> getExpenseById({
    required String id,
  }) async {
    final result = await _remote.getById(id: id);

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Expense>> updateExpense({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentUrls,
    required List<String>? attachmentFilePaths,
  }) async {
    final result = await _remote.update(
      id: id,
      expenseDate: expenseDate,
      name: name,
      notes: notes,
      attachmentUrls: attachmentUrls,
      attachmentFilePaths: attachmentFilePaths,
    );

    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Expense>> deleteExpense({
    required String id,
  }) async {
    final result = await _remote.delete(id: id);

      return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Unit>> createExpensePaymentMethod({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    final result = await _remote.createPaymentMethod(
      expenseId: expenseId,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
      attachment: attachment,
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => Right(unit),
    );
  }

  @override
  Future<Either<Failure, Unit>> updateExpensePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  }) async {
    final result = await _remote.updatePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
      attachment: attachment,
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => Right(unit),
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteExpensePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  }) async {
    final result = await _remote.deletePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
    );

    return result.fold(
      (failure) => Left(failure),
      (_) => Right(unit),
    );
  }
}
