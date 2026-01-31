
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/expense_category.dart';
import 'expense_category_events.dart';
import 'expense_category_loading_providers.dart';
import 'expense_category_providers.dart';

part 'expense_category_notifier.g.dart';

@riverpod
class ExpenseCategoryNotifier extends _$ExpenseCategoryNotifier {
  @override
  Future<List<ExpenseCategory>> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> create({
    required String name,
    required String description,
  }) async {
    // Start loading
    final createLoading = ref.read(expenseCategoryCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    // Call use case
    final useCase = ref.read(createExpenseCategoryUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    // Handle result with optimistic update
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(ExpenseCategoryFailure(failure));
      },
      (created) {
        // OPTIMISTIC UPDATE: Add to current list
        final current = state.value ?? const <ExpenseCategory>[];
        state = AsyncValue.data([created, ...current]);

        // Emit success event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(
          ExpenseCategoryCreated(created, 'Expense category created successfully'),
        );
      },
    );

    // Stop loading
    createLoading.setLoading(false);
  }

  Future<void> updateExpenseCategory({
    required String id,
    required String name,
    required String description,
  }) async {
    // Start loading
    final updateLoading = ref.read(expenseCategoryUpdateLoadingProvider.notifier);
    updateLoading.start(id);

    // Call use case
    final useCase = ref.read(updateExpenseCategoryUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    // Handle result with optimistic update
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(ExpenseCategoryFailure(failure));
      },
      (updated) {
        // OPTIMISTIC UPDATE: Update item in list
        final list = List<ExpenseCategory>.from(state.value ?? const <ExpenseCategory>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);

        // Emit success event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(
          ExpenseCategoryUpdated(updated, 'Expense category updated successfully'),
        );
      },
    );

    // Stop loading
    updateLoading.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    // Start loading
    final deleteLoading = ref.read(expenseCategoryDeleteLoadingProvider.notifier);
    deleteLoading.start(id);

    // Call use case
    final useCase = ref.read(deleteExpenseCategoryUseCaseProvider);
    final result = await useCase.call(id: id);

    // Handle result with optimistic update
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(ExpenseCategoryFailure(failure));
      },
      (deleted) {
        // OPTIMISTIC UPDATE: Remove from list
        final list = List<ExpenseCategory>.from(state.value ?? const <ExpenseCategory>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);

        // Emit success event
        ref.read(expenseCategoryUiEventsProvider.notifier).emit(
          ExpenseCategoryDeleted(id, 'Expense category deleted successfully'),
        );
      },
    );

    // Stop loading
    deleteLoading.stop(id);
  }

  Future<List<ExpenseCategory>> _load() async {
    final useCase = ref.read(getExpenseCategoriesUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}
