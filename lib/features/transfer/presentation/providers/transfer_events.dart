import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transfer.dart';
import '../../../../core/errors/failure.dart';

part 'transfer_events.g.dart';

sealed class TransferUiEvent {}

class TransferCreated extends TransferUiEvent {
  final Transfer entity;
  final String message;
  TransferCreated(this.entity, this.message);
}

class TransferFailure extends TransferUiEvent {
  final Failure failure;
  TransferFailure(this.failure);
}

class TransferStatusUpdated extends TransferUiEvent {
  final int id;
  final String status; // "completed" or "rejected"
  final String message;
  TransferStatusUpdated(this.id, this.status, this.message);
}

@riverpod
class TransferUiEvents extends _$TransferUiEvents {
  @override
  TransferUiEvent? build() {
    return null;
  }

  void emit(TransferUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

