import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/failure.dart';

part 'user_role_events.g.dart';

sealed class UserRoleUiEvent {}

class UserRolesAssigned extends UserRoleUiEvent {
  final String message;
  UserRolesAssigned(this.message);
}

class UserRoleFailure extends UserRoleUiEvent {
  final Failure failure;
  UserRoleFailure(this.failure);
}

@riverpod
class UserRoleUiEvents extends _$UserRoleUiEvents {
  @override
  UserRoleUiEvent? build() {
    return null;
  }

  void emit(UserRoleUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

