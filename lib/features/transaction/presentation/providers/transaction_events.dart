import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transaction.dart';
import '../../../../core/errors/failure.dart';

part 'transaction_events.g.dart';

sealed class TransactionUiEvent {}

class TransactionCreated extends TransactionUiEvent {
  final Transaction entity;
  final String message;
  TransactionCreated(this.entity, this.message);
}

class TransactionReversed extends TransactionUiEvent {
  final Transaction entity;
  final String message;
  TransactionReversed(this.entity, this.message);
}

class TransactionFailure extends TransactionUiEvent {
  final Failure failure;
  TransactionFailure(this.failure);
}

@riverpod
class TransactionUiEvents extends _$TransactionUiEvents {
  @override
  TransactionUiEvent? build() {
    return null;
  }

  void emit(TransactionUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

