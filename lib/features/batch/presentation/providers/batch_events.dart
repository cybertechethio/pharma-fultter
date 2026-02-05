import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/batch.dart';
import '../../../../core/errors/failure.dart';

part 'batch_events.g.dart';

sealed class BatchUiEvent {}

class BatchCreated extends BatchUiEvent {
  final BatchEntity entity;
  final String message;
  BatchCreated(this.entity, this.message);
}

class BatchUpdated extends BatchUiEvent {
  final BatchEntity entity;
  final String message;
  BatchUpdated(this.entity, this.message);
}

class BatchFailure extends BatchUiEvent {
  final Failure failure;
  BatchFailure(this.failure);
}

class BatchOperationSuccess extends BatchUiEvent {
  final String message;
  BatchOperationSuccess(this.message);
}

class BatchOperationFailure extends BatchUiEvent {
  final Failure failure;
  BatchOperationFailure(this.failure);
}

@riverpod
class BatchUiEvents extends _$BatchUiEvents {
  @override
  BatchUiEvent? build() {
    return null;
  }

  void emit(BatchUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

