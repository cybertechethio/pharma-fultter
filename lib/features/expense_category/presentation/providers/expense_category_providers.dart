import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/expense_category_api_service.dart';
import '../../data/datasources/expense_category_remote_data_source.dart';
import '../../data/datasources/expense_category_remote_data_source_impl.dart';
import '../../data/repositories/expense_category_repository_impl.dart';
import '../../domain/repositories/expense_category_repository.dart';
import '../../domain/usecases/get_expense_categories_usecase.dart';
import '../../domain/usecases/create_expense_category_usecase.dart';
import '../../domain/usecases/update_expense_category_usecase.dart';
import '../../domain/usecases/delete_expense_category_usecase.dart';

part 'expense_category_providers.g.dart';

@Riverpod(keepAlive: true)
ExpenseCategoryApiService expenseCategoryApiService(Ref ref) {
  return const ExpenseCategoryApiService();
}

@Riverpod(keepAlive: true)
ExpenseCategoryRemoteDataSource expenseCategoryRemoteDataSource(Ref ref) {
  return ExpenseCategoryRemoteDataSourceImpl(
    ref.watch(expenseCategoryApiServiceProvider),
  );
}

@Riverpod(keepAlive: true)
ExpenseCategoryRepository expenseCategoryRepository(Ref ref) {
  return ExpenseCategoryRepositoryImpl(
    ref.watch(expenseCategoryRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
GetExpenseCategoriesUseCase getExpenseCategoriesUseCase(Ref ref) {
  return GetExpenseCategoriesUseCase(
    ref.watch(expenseCategoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateExpenseCategoryUseCase createExpenseCategoryUseCase(Ref ref) {
  return CreateExpenseCategoryUseCase(
    ref.watch(expenseCategoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateExpenseCategoryUseCase updateExpenseCategoryUseCase(Ref ref) {
  return UpdateExpenseCategoryUseCase(
    ref.watch(expenseCategoryRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteExpenseCategoryUseCase deleteExpenseCategoryUseCase(Ref ref) {
  return DeleteExpenseCategoryUseCase(
    ref.watch(expenseCategoryRepositoryProvider),
  );
}
