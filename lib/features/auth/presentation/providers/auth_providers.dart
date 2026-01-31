import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:isar_community/isar.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/datasources/auth_remote_data_source_impl.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_local_data_source_impl.dart';
import '../../data/datasources/auth_api_service.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/refresh_token_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/verify_account_usecase.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/validate_otp_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../../domain/usecases/upload_profile_picture_usecase.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../../domain/usecases/resend_otp_usecase.dart';
import '../../domain/usecases/switch_company_usecase.dart';
import '../../domain/usecases/switch_branch_usecase.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../core/database/isar_database.dart';
import '../../../setting/domain/entities/company.dart';
import '../../../branch/domain/entities/branch.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
Future<Isar> isarDatabase(Ref ref) async {
  return await IsarDatabase.instance;
}

@Riverpod(keepAlive: true)
AuthApiService authApiService(Ref ref) {
  return AuthApiService.create();
}

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(ref.watch(authApiServiceProvider));
}

@Riverpod(keepAlive: true)
Future<AuthLocalDataSource> authLocalDataSource(Ref ref) async {
  final isar = await ref.watch(isarDatabaseProvider.future);
  return AuthLocalDataSourceImpl(
    ref.watch(flutterSecureStorageProvider),
    isar,
  );
}

@Riverpod(keepAlive: true)
Future<AuthRepository> authRepository(Ref ref) async {
  final localDataSource = await ref.watch(authLocalDataSourceProvider.future);
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    localDataSource,
  );
}

@Riverpod(keepAlive: true)
Future<LoginUseCase> loginUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LoginUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<RegisterUseCase> registerUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return RegisterUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<LogoutUseCase> logoutUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return LogoutUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<RefreshTokenUseCase> refreshTokenUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return RefreshTokenUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<GetCurrentUserUseCase> getCurrentUserUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return GetCurrentUserUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<VerifyAccountUseCase> verifyAccountUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return VerifyAccountUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<ForgotPasswordUseCase> forgotPasswordUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return ForgotPasswordUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<ValidateOtpUseCase> validateOtpUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return ValidateOtpUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<ResetPasswordUseCase> resetPasswordUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return ResetPasswordUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<ChangePasswordUseCase> changePasswordUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return ChangePasswordUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<UpdateProfileUseCase> updateProfileUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return UpdateProfileUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<UploadProfilePictureUseCase> uploadProfilePictureUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return UploadProfilePictureUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<DeleteAccountUseCase> deleteAccountUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return DeleteAccountUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<ResendOtpUseCase> resendOtpUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return ResendOtpUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<SwitchCompanyUseCase> switchCompanyUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SwitchCompanyUseCase(repository);
}

@Riverpod(keepAlive: true)
Future<SwitchBranchUseCase> switchBranchUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SwitchBranchUseCase(repository);
}

@riverpod
LoggingService loggingService(Ref ref) {
  return LoggingService();
}

@riverpod
Future<Company?> localCompanyProvider(Ref ref) async {
  final localDataSource = await ref.read(authLocalDataSourceProvider.future);
  return await localDataSource.getCompany();
}

@riverpod
Future<List<Branch>> localBranchesProvider(Ref ref) async {
  final localDataSource = await ref.read(authLocalDataSourceProvider.future);
  return await localDataSource.getBranches();
}