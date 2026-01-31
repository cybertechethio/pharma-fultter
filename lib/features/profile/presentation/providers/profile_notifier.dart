import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/domain/entities/user.dart';
import 'profile_providers.dart';
import 'profile_events.dart';
import 'profile_loading_providers.dart';

part 'profile_notifier.g.dart';

/// Main notifier for profile feature
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<User?> build() async {
    return await _loadUser();
  }

  /// Load current user data
  Future<void> loadUser() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadUser());
  }

  /// Update user profile
  Future<void> updateProfile({
    required User user,
  }) async {
    final updateLoading = ref.read(profileUpdateLoadingProvider.notifier);
    updateLoading.setLoading(true);

    final useCase = await ref.read(updateProfileUseCaseForProfileProvider.future);
    final result = await useCase.call(user: user);

    result.fold(
      (failure) {
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileFailure(failure),
        );
      },
      (updatedUser) {
        state = AsyncValue.data(updatedUser);
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileUpdated(updatedUser, 'Profile updated successfully'),
        );
      },
    );

    updateLoading.setLoading(false);
  }

  /// Change user password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final passwordLoading = ref.read(passwordChangeLoadingProvider.notifier);
    passwordLoading.setLoading(true);

    final useCase = await ref.read(changePasswordUseCaseForProfileProvider.future);
    final result = await useCase.call(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    result.fold(
      (failure) {
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileFailure(failure),
        );
      },
      (updatedUser) {
        // Update state with new user data
        state = AsyncValue.data(updatedUser);
        ref.read(profileUiEventsProvider.notifier).emit(
          PasswordChanged(updatedUser, 'Password changed successfully'),
        );
      },
    );

    passwordLoading.setLoading(false);
  }

  /// Logout user
  Future<void> logout() async {
    final logoutLoading = ref.read(logoutLoadingProvider.notifier);
    logoutLoading.setLoading(true);

    final useCase = await ref.read(logoutUseCaseForProfileProvider.future);
    final result = await useCase.call();

    result.fold(
      (failure) {
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileFailure(failure),
        );
      },
      (_) {
        // Clear user state on logout
        state = const AsyncValue.data(null);
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileLoggedOut('Logged out successfully'),
        );
      },
    );

    logoutLoading.setLoading(false);
  }

  /// Upload profile picture
  Future<void> uploadProfilePicture({
    required File imageFile,
  }) async {
    final uploadLoading = ref.read(profilePictureUploadLoadingProvider.notifier);
    uploadLoading.setLoading(true);

    final useCase = await ref.read(uploadProfilePictureUseCaseForProfileProvider.future);
    final result = await useCase.call(imageFile: imageFile);

    result.fold(
      (failure) {
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileFailure(failure),
        );
      },
      (updatedUser) {
        state = AsyncValue.data(updatedUser);
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfilePictureUploaded(updatedUser, 'Profile picture uploaded successfully'),
        );
      },
    );

    uploadLoading.setLoading(false);
  }

  /// Delete user account
  Future<void> deleteAccount({
    required String password,
  }) async {
    final deleteLoading = ref.read(accountDeletionLoadingProvider.notifier);
    deleteLoading.setLoading(true);

    final useCase = await ref.read(deleteAccountUseCaseForProfileProvider.future);
    final result = await useCase.call(password: password);

    result.fold(
      (failure) {
        ref.read(profileUiEventsProvider.notifier).emit(
          ProfileFailure(failure),
        );
      },
      (_) {
        // Clear user state on account deletion
        state = const AsyncValue.data(null);
        ref.read(profileUiEventsProvider.notifier).emit(
          AccountDeleted('Account deleted successfully'),
        );
      },
    );

    deleteLoading.setLoading(false);
  }

  /// Private method to load user data
  Future<User?> _loadUser() async {
    final useCase = await ref.read(getCurrentUserUseCaseForProfileProvider.future);
    final result = await useCase.call();
    
    return result.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }
}

