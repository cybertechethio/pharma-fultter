// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(flutterSecureStorage)
const flutterSecureStorageProvider = FlutterSecureStorageProvider._();

final class FlutterSecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  const FlutterSecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterSecureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterSecureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return flutterSecureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$flutterSecureStorageHash() =>
    r'74fc6ea2bb3b1f668a5f3e4f549614146c526484';

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  const SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'd22b545aefe95500327f9dce52c645d746349271';

@ProviderFor(isarDatabase)
const isarDatabaseProvider = IsarDatabaseProvider._();

final class IsarDatabaseProvider
    extends $FunctionalProvider<AsyncValue<Isar>, Isar, FutureOr<Isar>>
    with $FutureModifier<Isar>, $FutureProvider<Isar> {
  const IsarDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Isar> create(Ref ref) {
    return isarDatabase(ref);
  }
}

String _$isarDatabaseHash() => r'594449cdd645dd911dce95d4da99dcd42ffd34c2';

@ProviderFor(authApiService)
const authApiServiceProvider = AuthApiServiceProvider._();

final class AuthApiServiceProvider
    extends $FunctionalProvider<AuthApiService, AuthApiService, AuthApiService>
    with $Provider<AuthApiService> {
  const AuthApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authApiServiceHash();

  @$internal
  @override
  $ProviderElement<AuthApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthApiService create(Ref ref) {
    return authApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthApiService>(value),
    );
  }
}

String _$authApiServiceHash() => r'6774563e211b93d2a0d0493fccdd0a8fc10ea06a';

@ProviderFor(authRemoteDataSource)
const authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDataSource,
          AuthRemoteDataSource,
          AuthRemoteDataSource
        >
    with $Provider<AuthRemoteDataSource> {
  const AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'526be47417229eaee77422ce8b32221c1ec7b730';

@ProviderFor(authLocalDataSource)
const authLocalDataSourceProvider = AuthLocalDataSourceProvider._();

final class AuthLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthLocalDataSource>,
          AuthLocalDataSource,
          FutureOr<AuthLocalDataSource>
        >
    with
        $FutureModifier<AuthLocalDataSource>,
        $FutureProvider<AuthLocalDataSource> {
  const AuthLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<AuthLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthLocalDataSource> create(Ref ref) {
    return authLocalDataSource(ref);
  }
}

String _$authLocalDataSourceHash() =>
    r'ac24e6353b1165fd8e03e980bf6d60fce9d96505';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthRepository>,
          AuthRepository,
          FutureOr<AuthRepository>
        >
    with $FutureModifier<AuthRepository>, $FutureProvider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<AuthRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthRepository> create(Ref ref) {
    return authRepository(ref);
  }
}

String _$authRepositoryHash() => r'824cb91dac6869bdf357a1cf0dc8d0815edd09e6';

@ProviderFor(loginUseCase)
const loginUseCaseProvider = LoginUseCaseProvider._();

final class LoginUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginUseCase>,
          LoginUseCase,
          FutureOr<LoginUseCase>
        >
    with $FutureModifier<LoginUseCase>, $FutureProvider<LoginUseCase> {
  const LoginUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<LoginUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginUseCase> create(Ref ref) {
    return loginUseCase(ref);
  }
}

String _$loginUseCaseHash() => r'9047123c6967f744ad2426261affa8bd46bf5977';

@ProviderFor(registerUseCase)
const registerUseCaseProvider = RegisterUseCaseProvider._();

final class RegisterUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<RegisterUseCase>,
          RegisterUseCase,
          FutureOr<RegisterUseCase>
        >
    with $FutureModifier<RegisterUseCase>, $FutureProvider<RegisterUseCase> {
  const RegisterUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<RegisterUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RegisterUseCase> create(Ref ref) {
    return registerUseCase(ref);
  }
}

String _$registerUseCaseHash() => r'dc8ec92019af79d18f87e3178e0c3348072fba18';

@ProviderFor(logoutUseCase)
const logoutUseCaseProvider = LogoutUseCaseProvider._();

final class LogoutUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogoutUseCase>,
          LogoutUseCase,
          FutureOr<LogoutUseCase>
        >
    with $FutureModifier<LogoutUseCase>, $FutureProvider<LogoutUseCase> {
  const LogoutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<LogoutUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LogoutUseCase> create(Ref ref) {
    return logoutUseCase(ref);
  }
}

String _$logoutUseCaseHash() => r'1b9dd502ecd76335bf1576ae06fde138c8ac8d2a';

@ProviderFor(refreshTokenUseCase)
const refreshTokenUseCaseProvider = RefreshTokenUseCaseProvider._();

final class RefreshTokenUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<RefreshTokenUseCase>,
          RefreshTokenUseCase,
          FutureOr<RefreshTokenUseCase>
        >
    with
        $FutureModifier<RefreshTokenUseCase>,
        $FutureProvider<RefreshTokenUseCase> {
  const RefreshTokenUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshTokenUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshTokenUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<RefreshTokenUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RefreshTokenUseCase> create(Ref ref) {
    return refreshTokenUseCase(ref);
  }
}

String _$refreshTokenUseCaseHash() =>
    r'd860ef0aad3176c311c71b6040737c7d5eb631ab';

@ProviderFor(getCurrentUserUseCase)
const getCurrentUserUseCaseProvider = GetCurrentUserUseCaseProvider._();

final class GetCurrentUserUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetCurrentUserUseCase>,
          GetCurrentUserUseCase,
          FutureOr<GetCurrentUserUseCase>
        >
    with
        $FutureModifier<GetCurrentUserUseCase>,
        $FutureProvider<GetCurrentUserUseCase> {
  const GetCurrentUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<GetCurrentUserUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetCurrentUserUseCase> create(Ref ref) {
    return getCurrentUserUseCase(ref);
  }
}

String _$getCurrentUserUseCaseHash() =>
    r'434aa952b4da98a57ee264c33896f0133b72209b';

@ProviderFor(verifyAccountUseCase)
const verifyAccountUseCaseProvider = VerifyAccountUseCaseProvider._();

final class VerifyAccountUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<VerifyAccountUseCase>,
          VerifyAccountUseCase,
          FutureOr<VerifyAccountUseCase>
        >
    with
        $FutureModifier<VerifyAccountUseCase>,
        $FutureProvider<VerifyAccountUseCase> {
  const VerifyAccountUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyAccountUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyAccountUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<VerifyAccountUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VerifyAccountUseCase> create(Ref ref) {
    return verifyAccountUseCase(ref);
  }
}

String _$verifyAccountUseCaseHash() =>
    r'9fd8a4f4a8572ce5ec60d052075f0e594a80c2fb';

@ProviderFor(forgotPasswordUseCase)
const forgotPasswordUseCaseProvider = ForgotPasswordUseCaseProvider._();

final class ForgotPasswordUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ForgotPasswordUseCase>,
          ForgotPasswordUseCase,
          FutureOr<ForgotPasswordUseCase>
        >
    with
        $FutureModifier<ForgotPasswordUseCase>,
        $FutureProvider<ForgotPasswordUseCase> {
  const ForgotPasswordUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPasswordUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ForgotPasswordUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ForgotPasswordUseCase> create(Ref ref) {
    return forgotPasswordUseCase(ref);
  }
}

String _$forgotPasswordUseCaseHash() =>
    r'822655d929b7c3b2f29862990326d91326da2fbe';

@ProviderFor(validateOtpUseCase)
const validateOtpUseCaseProvider = ValidateOtpUseCaseProvider._();

final class ValidateOtpUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ValidateOtpUseCase>,
          ValidateOtpUseCase,
          FutureOr<ValidateOtpUseCase>
        >
    with
        $FutureModifier<ValidateOtpUseCase>,
        $FutureProvider<ValidateOtpUseCase> {
  const ValidateOtpUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'validateOtpUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$validateOtpUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ValidateOtpUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ValidateOtpUseCase> create(Ref ref) {
    return validateOtpUseCase(ref);
  }
}

String _$validateOtpUseCaseHash() =>
    r'd919ebda2d1571c5964f4c16a0baef74f0978412';

@ProviderFor(resetPasswordUseCase)
const resetPasswordUseCaseProvider = ResetPasswordUseCaseProvider._();

final class ResetPasswordUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ResetPasswordUseCase>,
          ResetPasswordUseCase,
          FutureOr<ResetPasswordUseCase>
        >
    with
        $FutureModifier<ResetPasswordUseCase>,
        $FutureProvider<ResetPasswordUseCase> {
  const ResetPasswordUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetPasswordUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ResetPasswordUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ResetPasswordUseCase> create(Ref ref) {
    return resetPasswordUseCase(ref);
  }
}

String _$resetPasswordUseCaseHash() =>
    r'de72c389cfe9f0117c09aaa72a230a7014951092';

@ProviderFor(changePasswordUseCase)
const changePasswordUseCaseProvider = ChangePasswordUseCaseProvider._();

final class ChangePasswordUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChangePasswordUseCase>,
          ChangePasswordUseCase,
          FutureOr<ChangePasswordUseCase>
        >
    with
        $FutureModifier<ChangePasswordUseCase>,
        $FutureProvider<ChangePasswordUseCase> {
  const ChangePasswordUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changePasswordUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changePasswordUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ChangePasswordUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ChangePasswordUseCase> create(Ref ref) {
    return changePasswordUseCase(ref);
  }
}

String _$changePasswordUseCaseHash() =>
    r'af17efb19a506ce9ab620e036eea3efc1ca52f1f';

@ProviderFor(updateProfileUseCase)
const updateProfileUseCaseProvider = UpdateProfileUseCaseProvider._();

final class UpdateProfileUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<UpdateProfileUseCase>,
          UpdateProfileUseCase,
          FutureOr<UpdateProfileUseCase>
        >
    with
        $FutureModifier<UpdateProfileUseCase>,
        $FutureProvider<UpdateProfileUseCase> {
  const UpdateProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProfileUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProfileUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<UpdateProfileUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UpdateProfileUseCase> create(Ref ref) {
    return updateProfileUseCase(ref);
  }
}

String _$updateProfileUseCaseHash() =>
    r'fd55d107b82403f96047f2d890f3771be37ccb52';

@ProviderFor(uploadProfilePictureUseCase)
const uploadProfilePictureUseCaseProvider =
    UploadProfilePictureUseCaseProvider._();

final class UploadProfilePictureUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<UploadProfilePictureUseCase>,
          UploadProfilePictureUseCase,
          FutureOr<UploadProfilePictureUseCase>
        >
    with
        $FutureModifier<UploadProfilePictureUseCase>,
        $FutureProvider<UploadProfilePictureUseCase> {
  const UploadProfilePictureUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadProfilePictureUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadProfilePictureUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<UploadProfilePictureUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UploadProfilePictureUseCase> create(Ref ref) {
    return uploadProfilePictureUseCase(ref);
  }
}

String _$uploadProfilePictureUseCaseHash() =>
    r'4b95d627cb7c8c569d4620e278b3a3dee993aa86';

@ProviderFor(deleteAccountUseCase)
const deleteAccountUseCaseProvider = DeleteAccountUseCaseProvider._();

final class DeleteAccountUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<DeleteAccountUseCase>,
          DeleteAccountUseCase,
          FutureOr<DeleteAccountUseCase>
        >
    with
        $FutureModifier<DeleteAccountUseCase>,
        $FutureProvider<DeleteAccountUseCase> {
  const DeleteAccountUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteAccountUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteAccountUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<DeleteAccountUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DeleteAccountUseCase> create(Ref ref) {
    return deleteAccountUseCase(ref);
  }
}

String _$deleteAccountUseCaseHash() =>
    r'd3ac8f3ac7282b10c6e4ec74911d8651a60fc9b7';

@ProviderFor(resendOtpUseCase)
const resendOtpUseCaseProvider = ResendOtpUseCaseProvider._();

final class ResendOtpUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<ResendOtpUseCase>,
          ResendOtpUseCase,
          FutureOr<ResendOtpUseCase>
        >
    with $FutureModifier<ResendOtpUseCase>, $FutureProvider<ResendOtpUseCase> {
  const ResendOtpUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resendOtpUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resendOtpUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<ResendOtpUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ResendOtpUseCase> create(Ref ref) {
    return resendOtpUseCase(ref);
  }
}

String _$resendOtpUseCaseHash() => r'0470def101d45bc60e8c169124b91cf10b93db26';

@ProviderFor(switchCompanyUseCase)
const switchCompanyUseCaseProvider = SwitchCompanyUseCaseProvider._();

final class SwitchCompanyUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<SwitchCompanyUseCase>,
          SwitchCompanyUseCase,
          FutureOr<SwitchCompanyUseCase>
        >
    with
        $FutureModifier<SwitchCompanyUseCase>,
        $FutureProvider<SwitchCompanyUseCase> {
  const SwitchCompanyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'switchCompanyUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$switchCompanyUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<SwitchCompanyUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SwitchCompanyUseCase> create(Ref ref) {
    return switchCompanyUseCase(ref);
  }
}

String _$switchCompanyUseCaseHash() =>
    r'c99064db79053a2dd92e306304520cff5c91b200';

@ProviderFor(switchBranchUseCase)
const switchBranchUseCaseProvider = SwitchBranchUseCaseProvider._();

final class SwitchBranchUseCaseProvider
    extends
        $FunctionalProvider<
          AsyncValue<SwitchBranchUseCase>,
          SwitchBranchUseCase,
          FutureOr<SwitchBranchUseCase>
        >
    with
        $FutureModifier<SwitchBranchUseCase>,
        $FutureProvider<SwitchBranchUseCase> {
  const SwitchBranchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'switchBranchUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$switchBranchUseCaseHash();

  @$internal
  @override
  $FutureProviderElement<SwitchBranchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SwitchBranchUseCase> create(Ref ref) {
    return switchBranchUseCase(ref);
  }
}

String _$switchBranchUseCaseHash() =>
    r'279de5f0c2fae691ce1f0e515290f3bf224c270b';

@ProviderFor(loggingService)
const loggingServiceProvider = LoggingServiceProvider._();

final class LoggingServiceProvider
    extends $FunctionalProvider<LoggingService, LoggingService, LoggingService>
    with $Provider<LoggingService> {
  const LoggingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggingServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggingServiceHash();

  @$internal
  @override
  $ProviderElement<LoggingService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoggingService create(Ref ref) {
    return loggingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoggingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoggingService>(value),
    );
  }
}

String _$loggingServiceHash() => r'c084da141a43c0597d51df6af68e1b5442b190e2';

@ProviderFor(localCompanyProvider)
const localCompanyProviderProvider = LocalCompanyProviderProvider._();

final class LocalCompanyProviderProvider
    extends
        $FunctionalProvider<AsyncValue<Company?>, Company?, FutureOr<Company?>>
    with $FutureModifier<Company?>, $FutureProvider<Company?> {
  const LocalCompanyProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localCompanyProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localCompanyProviderHash();

  @$internal
  @override
  $FutureProviderElement<Company?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Company?> create(Ref ref) {
    return localCompanyProvider(ref);
  }
}

String _$localCompanyProviderHash() =>
    r'b9230bcfb0a6cb21210aa10f9f60143854be77b0';

@ProviderFor(localBranchesProvider)
const localBranchesProviderProvider = LocalBranchesProviderProvider._();

final class LocalBranchesProviderProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Branch>>,
          List<Branch>,
          FutureOr<List<Branch>>
        >
    with $FutureModifier<List<Branch>>, $FutureProvider<List<Branch>> {
  const LocalBranchesProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localBranchesProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localBranchesProviderHash();

  @$internal
  @override
  $FutureProviderElement<List<Branch>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Branch>> create(Ref ref) {
    return localBranchesProvider(ref);
  }
}

String _$localBranchesProviderHash() =>
    r'77374a79e4d0ab787490c9ec785ecd15a46949c0';
