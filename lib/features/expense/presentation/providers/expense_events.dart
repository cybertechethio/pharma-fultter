import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/expense.dart';
import '../../../../core/errors/failure.dart';

part 'expense_events.g.dart';

sealed class ExpenseUiEvent {}

class ExpenseCreated extends ExpenseUiEvent {
  final Expense entity;
  final String message;
  ExpenseCreated(this.entity, this.message);
}

class ExpenseUpdated extends ExpenseUiEvent {
  final Expense entity;
  final String message;
  ExpenseUpdated(this.entity, this.message);
}

class ExpenseDeleted extends ExpenseUiEvent {
  final String id;
  final String message;
  ExpenseDeleted(this.id, this.message);
}

class ExpenseFailure extends ExpenseUiEvent {
  final Failure failure;
  ExpenseFailure(this.failure);
}

class ExpensePaymentMethodUpdated extends ExpenseUiEvent {
  final String paymentMethodId;
  final String message;
  ExpensePaymentMethodUpdated(this.paymentMethodId, this.message);
}

class ExpensePaymentMethodDeleted extends ExpenseUiEvent {
  final String id;
  final String message;
  ExpensePaymentMethodDeleted(this.id, this.message);
}

@riverpod
class ExpenseUiEvents extends _$ExpenseUiEvents {
  @override
  ExpenseUiEvent? build() {
    return null;
  }

  void emit(ExpenseUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}
