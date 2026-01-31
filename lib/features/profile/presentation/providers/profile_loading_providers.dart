import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_loading_providers.g.dart';

/// Provider for profile loading state
@riverpod
class ProfileLoading extends _$ProfileLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

/// Provider for profile update loading state
@riverpod
class ProfileUpdateLoading extends _$ProfileUpdateLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

/// Provider for password change loading state
@riverpod
class PasswordChangeLoading extends _$PasswordChangeLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

/// Provider for logout loading state
@riverpod
class LogoutLoading extends _$LogoutLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

/// Provider for account deletion loading state
@riverpod
class AccountDeletionLoading extends _$AccountDeletionLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

/// Provider for profile picture upload loading state
@riverpod
class ProfilePictureUploadLoading extends _$ProfilePictureUploadLoading {
  @override
  bool build() => false;
  
  void setLoading(bool value) => state = value;
}

