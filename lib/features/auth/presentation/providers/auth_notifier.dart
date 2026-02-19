import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';
import 'auth_state.dart';
import 'auth_providers.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthState> build() async {
    return const AuthState.initial();
  }

  /// Login user with identifier and password
  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Logging in...'));
    
    try {
      final useCase = await ref.read(loginUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
        password: password,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (data) => state = AsyncValue.data(AuthState.authenticated(
          message: 'Login successful! Welcome back.',
          user: data.user,
          tokens: data.tokens,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Register new user
  Future<void> register({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
      print('2...................................................🚀 SUBMITTING REGISTRATION:');
      print('📍 Phone: $phone');
      print('📍 Email: $email');
      print('📍 First Name: $firstName');
      print('📍 Last Name: $lastName');
      print('📍 Company Name: $companyName');

    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Creating account...'));
      print('3...................................................🚀 SUBMITTING REGISTRATION:');

    
    try {
      print('4...................................................🚀 CALLING REGISTER USE CASE:');
      print('4a...................................................🚀 GETTING PROVIDER:');
      final useCase = await ref.read(registerUseCaseProvider.future);
      print('4b...................................................🚀 USE CASE: $useCase');
      print('4c...................................................🚀 CALLING USE CASE:');
      final result = await useCase.call(
        phone: phone,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        companyName: companyName,
      );
      print('4d...................................................🚀 USE CASE CALL COMPLETED');
      print('5...................................................🚀 REGISTER USE CASE RESULT: $result');
      
      result.fold(
        (failure) {
          print('19...................................................❌ AUTH NOTIFIER FAILURE: $failure');
          state = AsyncValue.data(AuthState.error(failure: failure));
        },
        (user) {
          print('20...................................................✅ AUTH NOTIFIER SUCCESS: $user');
          state = AsyncValue.data(AuthState.registered(
            message: 'Account created successfully! Please verify your account.',
            user: user,
          ));
        },
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Verify account with OTP
  Future<void> verifyAccount({
    required String identifier,
    required String otp,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Verifying account...'));
    
    try {
      final useCase = await ref.read(verifyAccountUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
        otp: otp,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (data) => state = AsyncValue.data(AuthState.accountVerified(
          message: 'Account verified successfully! You can now access all features.',
          user: data.user,
          tokens: data.tokens,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Validate OTP
  Future<void> validateOtp({
    required String identifier,
    required String otp,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Validating OTP...'));
    
    try {
      final useCase = await ref.read(validateOtpUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
        otp: otp,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (user) => state = AsyncValue.data(AuthState.otpValidated(
          message: 'OTP validated successfully!',
          user: user,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Send forgot password request
  Future<void> forgotPassword({
    required String identifier,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Sending reset link...'));
    
    try {
      final useCase = await ref.read(forgotPasswordUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (user) => state = AsyncValue.data(AuthState.forgotPasswordSent(
          message: user != null 
            ? 'Password reset link sent to your phone number.'
            : 'If an account exists with this phone number, a reset link has been sent.',
          user: user,
        )),
      );
    } catch (e) { 
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Reset password with OTP
  Future<void> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Resetting password...'));
    
    try {
      final useCase = await ref.read(resetPasswordUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
        resetToken: resetToken,
        newPassword: newPassword,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (data) => state = AsyncValue.data(AuthState.passwordReset(
          message: 'Password reset successfully! You can now login with your new password.',
          user: data.user,
          tokens: data.tokens,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Changing password...'));
    
    try {
      final useCase = await ref.read(changePasswordUseCaseProvider.future);
      final result = await useCase.call(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (user) => state = AsyncValue.data(AuthState.passwordChanged(
          message: 'Password changed successfully!',
          user: user,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Update user profile
  Future<void> updateProfile({
    required User user,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Updating profile...'));
    
    try {
      final useCase = await ref.read(updateProfileUseCaseProvider.future);
      final result = await useCase.call(
        user: user,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (updatedUser) => state = AsyncValue.data(AuthState.profileUpdated(
          message: 'Profile updated successfully!',
          user: updatedUser,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Delete account
  Future<void> deleteAccount({
    required String password,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Deleting account...'));
    
    try {
      final useCase = await ref.read(deleteAccountUseCaseProvider.future);
      final result = await useCase.call(
        password: password,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (_) => state = AsyncValue.data(AuthState.accountDeleted(
          message: 'Account deleted successfully. We\'re sorry to see you go.',
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Resend OTP
  Future<void> resendOtp({
    required String identifier,
  }) async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Resending OTP...'));
    
    try {
      final useCase = await ref.read(resendOtpUseCaseProvider.future);
      final result = await useCase.call(
        identifier: identifier,
      );
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (user) => state = AsyncValue.data(AuthState.otpResent(
          message: user != null 
            ? 'OTP resent successfully! Please check your phone.'
            : 'If an account exists with this phone number, an OTP has been resent.',
          user: user,
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
  ///
  /// Logout user
  Future<void> logout() async {
    // Set loading state
    state = const AsyncValue.data(AuthState.loading(message: 'Logging out...'));
    
    try {
      final useCase = await ref.read(logoutUseCaseProvider.future);
      final result = await useCase.call();
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (_) => state = AsyncValue.data(AuthState.unauthenticated(
          message: 'Logged out successfully!',
        )),
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Refresh authentication state
  Future<void> refreshAuth() async {
    state = const AsyncValue.data(AuthState.loading(message: 'Refreshing...'));
    
    try {
      final useCase = await ref.read(getCurrentUserUseCaseProvider.future);
      final result = await useCase.call();
      
      result.fold(
        (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
        (user) {
          if (user != null) {
            state = AsyncValue.data(AuthState.authenticated(
              message: 'Authentication refreshed!',
              user: user,
              tokens: const AuthToken(accessToken: '', refreshToken: ''), // TODO: Get from storage
            ));
          } else {
            state = AsyncValue.data(AuthState.unauthenticated(
              message: 'No authenticated user found.',
            ));
          }
        },
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
