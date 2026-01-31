import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/role.dart';
import '../../../../core/errors/failure.dart';

part 'role_events.g.dart';

sealed class RoleUiEvent {}

class RoleCreated extends RoleUiEvent {
  final RoleEntity entity;
  final String message;
  RoleCreated(this.entity, this.message);
}

class RoleUpdated extends RoleUiEvent {
  final RoleEntity entity;
  final String message;
  RoleUpdated(this.entity, this.message);
}

class RoleDeleted extends RoleUiEvent {
  final int id;
  final String message;
  RoleDeleted(this.id, this.message);
}

class RoleFailure extends RoleUiEvent {
  final Failure failure;
  RoleFailure(this.failure);
}

@riverpod
class RoleUiEvents extends _$RoleUiEvents {
  @override
  RoleUiEvent? build() {
    return null;
  }

  void emit(RoleUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}


