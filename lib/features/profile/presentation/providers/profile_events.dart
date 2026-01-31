import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../core/errors/failure.dart';

part 'profile_events.g.dart';

/// UI events for profile feature
sealed class ProfileUiEvent {}

/// Event emitted when profile is updated successfully
class ProfileUpdated extends ProfileUiEvent {
  final User user;
  final String message;
  ProfileUpdated(this.user, this.message);
}

/// Event emitted when password is changed successfully
class PasswordChanged extends ProfileUiEvent {
  final User user;
  final String message;
  PasswordChanged(this.user, this.message);
}

/// Event emitted when profile picture is uploaded successfully
class ProfilePictureUploaded extends ProfileUiEvent {
  final User user;
  final String message;
  ProfilePictureUploaded(this.user, this.message);
}

/// Event emitted when user logs out successfully
class ProfileLoggedOut extends ProfileUiEvent {
  final String message;
  ProfileLoggedOut(this.message);
}

/// Event emitted when account is deleted successfully
class AccountDeleted extends ProfileUiEvent {
  final String message;
  AccountDeleted(this.message);
}

/// Event emitted when an error occurs
class ProfileFailure extends ProfileUiEvent {
  final Failure failure;
  ProfileFailure(this.failure);
}

/// Provider for managing profile UI events
@riverpod
class ProfileUiEvents extends _$ProfileUiEvents {
  @override
  ProfileUiEvent? build() {
    return null;
  }

  /// Emit a profile UI event
  void emit(ProfileUiEvent event) {
    state = event;
  }

  /// Clear the current event
  void clear() {
    state = null;
  }
}

