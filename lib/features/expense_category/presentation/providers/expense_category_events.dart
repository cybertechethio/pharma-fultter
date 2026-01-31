import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/expense_category.dart';
import '../../../../core/errors/failure.dart';

part 'expense_category_events.g.dart';

sealed class ExpenseCategoryUiEvent {}

class ExpenseCategoryCreated extends ExpenseCategoryUiEvent {
  final ExpenseCategory entity;
  final String message;
  ExpenseCategoryCreated(this.entity, this.message);
}

class ExpenseCategoryUpdated extends ExpenseCategoryUiEvent {
  final ExpenseCategory entity;
  final String message;
  ExpenseCategoryUpdated(this.entity, this.message);
}

class ExpenseCategoryDeleted extends ExpenseCategoryUiEvent {
  final String id;
  final String message;
  ExpenseCategoryDeleted(this.id, this.message);
}

class ExpenseCategoryFailure extends ExpenseCategoryUiEvent {
  final Failure failure;
  ExpenseCategoryFailure(this.failure);
}

@riverpod
class ExpenseCategoryUiEvents extends _$ExpenseCategoryUiEvents {
  @override
  ExpenseCategoryUiEvent? build() {
    return null;
  }

  void emit(ExpenseCategoryUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}
