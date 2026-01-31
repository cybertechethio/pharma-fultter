import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/bank.dart';
import '../../../../core/errors/failure.dart';

part 'bank_events.g.dart';

sealed class BankUiEvent {}

class BankCreated extends BankUiEvent {
  final BankEntity entity;
  final String message;
  BankCreated(this.entity, this.message);
}

class BankUpdated extends BankUiEvent {
  final BankEntity entity;
  final String message;
  BankUpdated(this.entity, this.message);
}

class BankDeleted extends BankUiEvent {
  final int id;
  final String message;
  BankDeleted(this.id, this.message);
}

class BankFailure extends BankUiEvent {
  final Failure failure;
  BankFailure(this.failure);
}

@riverpod
class BankUiEvents extends _$BankUiEvents {
  @override
  BankUiEvent? build() {
    return null;
  }

  void emit(BankUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

