import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/domain/usecases/get_current_user_usecase.dart';
import '../../../auth/domain/usecases/update_profile_usecase.dart';
import '../../../auth/domain/usecases/upload_profile_picture_usecase.dart';
import '../../../auth/domain/usecases/change_password_usecase.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';
import '../../../auth/domain/usecases/delete_account_usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/domain/entities/user.dart';

part 'profile_providers.g.dart';

/// Provider for GetCurrentUserUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<GetCurrentUserUseCase> getCurrentUserUseCaseForProfile(Ref ref) async {
  return await ref.watch(getCurrentUserUseCaseProvider.future);
}

/// Provider for UpdateProfileUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<UpdateProfileUseCase> updateProfileUseCaseForProfile(Ref ref) async {
  return await ref.watch(updateProfileUseCaseProvider.future);
}

/// Provider for ChangePasswordUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<ChangePasswordUseCase> changePasswordUseCaseForProfile(Ref ref) async {
  return await ref.watch(changePasswordUseCaseProvider.future);
}

/// Provider for LogoutUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<LogoutUseCase> logoutUseCaseForProfile(Ref ref) async {
  return await ref.watch(logoutUseCaseProvider.future);
}

/// Provider for UploadProfilePictureUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<UploadProfilePictureUseCase> uploadProfilePictureUseCaseForProfile(Ref ref) async {
  return await ref.watch(uploadProfilePictureUseCaseProvider.future);
}

/// Provider for DeleteAccountUseCase (from auth feature)
/// Re-exports the auth feature's use case for profile feature usage
@Riverpod(keepAlive: true)
Future<DeleteAccountUseCase> deleteAccountUseCaseForProfile(Ref ref) async {
  return await ref.watch(deleteAccountUseCaseProvider.future);
}

/// Provider that loads user from local storage immediately for fast display
/// This provides cached user data instantly for immediate UI rendering
/// Note: Profile provider should be triggered separately for fresh data refresh
@riverpod
Future<User?> cachedUser(Ref ref) async {
  try {
    final localDataSource = await ref.read(authLocalDataSourceProvider.future);
    final user = await localDataSource.getUser();
    return user;
  } catch (e) {
    return null;
  }
}

