import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/upload_service.dart';
import '../../data/datasources/expense_api_service.dart';
import '../../data/datasources/expense_remote_data_source.dart';
import '../../data/datasources/expense_remote_data_source_impl.dart';
import '../../data/repositories/expense_repository_impl.dart';
import '../../domain/repositories/expense_repository.dart';
import '../../domain/usecases/create_expense_usecase.dart';
import '../../domain/usecases/get_expenses_usecase.dart';
import '../../domain/usecases/get_expense_by_id_usecase.dart';
import '../../domain/usecases/update_expense_usecase.dart';
import '../../domain/usecases/delete_expense_usecase.dart';
import '../../domain/usecases/create_expense_payment_method_usecase.dart';
import '../../domain/usecases/update_expense_payment_method_usecase.dart';
import '../../domain/usecases/delete_expense_payment_method_usecase.dart';

part 'expense_providers.g.dart';

@riverpod
ExpenseApiService expenseApiService(Ref ref) {
  return ExpenseApiService(
    uploadService: UploadService(),
  );
}

@riverpod
ExpenseRemoteDataSource expenseRemoteDataSource(Ref ref) {
  return ExpenseRemoteDataSourceImpl(
    ref.watch(expenseApiServiceProvider),
  );
}

@riverpod
ExpenseRepository expenseRepository(Ref ref) {
  return ExpenseRepositoryImpl(
    ref.watch(expenseRemoteDataSourceProvider),
  );
}

@riverpod
CreateExpenseUseCase createExpenseUseCase(Ref ref) {
  return CreateExpenseUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
GetExpensesUseCase getExpensesUseCase(Ref ref) {
  return GetExpensesUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetExpenseByIdUseCase getExpenseByIdUseCase(Ref ref) {
  return GetExpenseByIdUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
UpdateExpenseUseCase updateExpenseUseCase(Ref ref) {
  return UpdateExpenseUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
DeleteExpenseUseCase deleteExpenseUseCase(Ref ref) {
  return DeleteExpenseUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
CreateExpensePaymentMethodUseCase createExpensePaymentMethodUseCase(Ref ref) {
  return CreateExpensePaymentMethodUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
UpdateExpensePaymentMethodUseCase updateExpensePaymentMethodUseCase(Ref ref) {
  return UpdateExpensePaymentMethodUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}

@riverpod
DeleteExpensePaymentMethodUseCase deleteExpensePaymentMethodUseCase(Ref ref) {
  return DeleteExpensePaymentMethodUseCase(
    ref.watch(expenseRepositoryProvider),
  );
}
