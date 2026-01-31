import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/branch.dart';
import '../../../../core/errors/failure.dart';

part 'branch_events.g.dart';

sealed class BranchUiEvent {}

class BranchCreated extends BranchUiEvent {
  final Branch entity;
  final String message;
  BranchCreated(this.entity, this.message);
}

class BranchUpdated extends BranchUiEvent {
  final Branch entity;
  final String message;
  BranchUpdated(this.entity, this.message);
}

class BranchDeleted extends BranchUiEvent {
  final String id;
  final String message;
  BranchDeleted(this.id, this.message);
}

class BranchFailure extends BranchUiEvent {
  final Failure failure;
  BranchFailure(this.failure);
}

@Riverpod(keepAlive: true)
class BranchUiEvents extends _$BranchUiEvents {
  @override
  BranchUiEvent? build() {
    return null;
  }

  void emit(BranchUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

