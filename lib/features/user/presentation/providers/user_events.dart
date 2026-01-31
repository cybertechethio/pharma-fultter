import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import '../../../../core/errors/failure.dart';

part 'user_events.g.dart';

sealed class UserUiEvent {}

class UserCreated extends UserUiEvent {
  final UserEntity entity;
  final String message;
  UserCreated(this.entity, this.message);
}

class UserUpdated extends UserUiEvent {
  final UserEntity entity;
  final String message;
  UserUpdated(this.entity, this.message);
}

class UserDeleted extends UserUiEvent {
  final int id;
  final String message;
  UserDeleted(this.id, this.message);
}

class UserFailure extends UserUiEvent {
  final Failure failure;
  UserFailure(this.failure);
}

@riverpod
class UserUiEvents extends _$UserUiEvents {
  @override
  UserUiEvent? build() {
    return null;
  }

  void emit(UserUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

