import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  // Initial state
  const factory AuthState.initial() = AuthInitial;
  
  // Loading states
  const factory AuthState.loading({required String message}) = AuthLoading;
  
  // Authentication states (LoginUseCase)
  const factory AuthState.authenticated({
    required String message,
    required User user, 
    required AuthToken tokens
  }) = Authenticated;
  const factory AuthState.unauthenticated({required String message}) = Unauthenticated;
  
  // Registration states (RegisterUseCase)
  const factory AuthState.registered({
    required String message,
    required User user
  }) = Registered;
  
  // Account verification states (VerifyAccountUseCase)
  const factory AuthState.accountVerified({
    required String message,
    required User user, 
    required AuthToken tokens
  }) = AccountVerified;
  
  // OTP validation states (ValidateOtpUseCase)
  const factory AuthState.otpValidated({
    required String message,
    required User user
  }) = OtpValidated;
  
  // Password reset states (ForgotPasswordUseCase, ResetPasswordUseCase)
  const factory AuthState.forgotPasswordSent({
    required String message,
    User? user
  }) = ForgotPasswordSent;
  const factory AuthState.passwordReset({
    required String message,
    required User user, 
    required AuthToken tokens
  }) = PasswordReset;
  
  // Password change states (ChangePasswordUseCase)
  const factory AuthState.passwordChanged({
    required String message,
    required User user
  }) = PasswordChanged;
  
  // Profile update states (UpdateProfileUseCase)
  const factory AuthState.profileUpdated({
    required String message,
    required User user
  }) = ProfileUpdated;
  
  // Account management states (DeleteAccountUseCase)
  const factory AuthState.accountDeleted({required String message}) = AccountDeleted;
  
  // OTP resend states (ResendOtpUseCase)
  const factory AuthState.otpResent({
    required String message,
    User? user
  }) = OtpResent;
  
  // Error state
  const factory AuthState.error({required Failure failure}) = AuthError;
}
