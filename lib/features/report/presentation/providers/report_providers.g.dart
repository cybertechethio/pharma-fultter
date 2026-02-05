// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reportApiService)
const reportApiServiceProvider = ReportApiServiceProvider._();

final class ReportApiServiceProvider
    extends
        $FunctionalProvider<
          ReportApiService,
          ReportApiService,
          ReportApiService
        >
    with $Provider<ReportApiService> {
  const ReportApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportApiServiceHash();

  @$internal
  @override
  $ProviderElement<ReportApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportApiService create(Ref ref) {
    return reportApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportApiService>(value),
    );
  }
}

String _$reportApiServiceHash() => r'5510d4de403c9f8663a6c5dacd9b40edc6f92aae';

@ProviderFor(reportRemoteDataSource)
const reportRemoteDataSourceProvider = ReportRemoteDataSourceProvider._();

final class ReportRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ReportRemoteDataSource,
          ReportRemoteDataSource,
          ReportRemoteDataSource
        >
    with $Provider<ReportRemoteDataSource> {
  const ReportRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ReportRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReportRemoteDataSource create(Ref ref) {
    return reportRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRemoteDataSource>(value),
    );
  }
}

String _$reportRemoteDataSourceHash() =>
    r'291a67ac3e79944bc8a726c87653927c99b9345b';

@ProviderFor(reportRepository)
const reportRepositoryProvider = ReportRepositoryProvider._();

final class ReportRepositoryProvider
    extends
        $FunctionalProvider<
          ReportRepository,
          ReportRepository,
          ReportRepository
        >
    with $Provider<ReportRepository> {
  const ReportRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReportRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportRepository create(Ref ref) {
    return reportRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRepository>(value),
    );
  }
}

String _$reportRepositoryHash() => r'619dd9197c77714f555ae5100aef641680e96c99';

@ProviderFor(getSalesReportUseCase)
const getSalesReportUseCaseProvider = GetSalesReportUseCaseProvider._();

final class GetSalesReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetSalesReportUseCase,
          GetSalesReportUseCase,
          GetSalesReportUseCase
        >
    with $Provider<GetSalesReportUseCase> {
  const GetSalesReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSalesReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSalesReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSalesReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSalesReportUseCase create(Ref ref) {
    return getSalesReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSalesReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSalesReportUseCase>(value),
    );
  }
}

String _$getSalesReportUseCaseHash() =>
    r'9b635549cd25e20ecf36bf9d5fce097c9b64e0a3';

@ProviderFor(getPurchaseReportUseCase)
const getPurchaseReportUseCaseProvider = GetPurchaseReportUseCaseProvider._();

final class GetPurchaseReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetPurchaseReportUseCase,
          GetPurchaseReportUseCase,
          GetPurchaseReportUseCase
        >
    with $Provider<GetPurchaseReportUseCase> {
  const GetPurchaseReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPurchaseReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPurchaseReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPurchaseReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPurchaseReportUseCase create(Ref ref) {
    return getPurchaseReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPurchaseReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPurchaseReportUseCase>(value),
    );
  }
}

String _$getPurchaseReportUseCaseHash() =>
    r'be8ce83eb4bfe3b4c93e5aef2f6218644bc12cd1';

@ProviderFor(getCustomerReportUseCase)
const getCustomerReportUseCaseProvider = GetCustomerReportUseCaseProvider._();

final class GetCustomerReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetCustomerReportUseCase,
          GetCustomerReportUseCase,
          GetCustomerReportUseCase
        >
    with $Provider<GetCustomerReportUseCase> {
  const GetCustomerReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCustomerReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCustomerReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCustomerReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCustomerReportUseCase create(Ref ref) {
    return getCustomerReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCustomerReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCustomerReportUseCase>(value),
    );
  }
}

String _$getCustomerReportUseCaseHash() =>
    r'3a3c12aae0f582ec57fd280901fac6aa7628b09d';

@ProviderFor(getExpenseReportUseCase)
const getExpenseReportUseCaseProvider = GetExpenseReportUseCaseProvider._();

final class GetExpenseReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetExpenseReportUseCase,
          GetExpenseReportUseCase,
          GetExpenseReportUseCase
        >
    with $Provider<GetExpenseReportUseCase> {
  const GetExpenseReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExpenseReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExpenseReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExpenseReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExpenseReportUseCase create(Ref ref) {
    return getExpenseReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExpenseReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExpenseReportUseCase>(value),
    );
  }
}

String _$getExpenseReportUseCaseHash() =>
    r'5712a93957a40fa54093e56a92df68a859b8817f';

@ProviderFor(getBestSellerReportUseCase)
const getBestSellerReportUseCaseProvider =
    GetBestSellerReportUseCaseProvider._();

final class GetBestSellerReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetBestSellerReportUseCase,
          GetBestSellerReportUseCase,
          GetBestSellerReportUseCase
        >
    with $Provider<GetBestSellerReportUseCase> {
  const GetBestSellerReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBestSellerReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBestSellerReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBestSellerReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBestSellerReportUseCase create(Ref ref) {
    return getBestSellerReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBestSellerReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBestSellerReportUseCase>(value),
    );
  }
}

String _$getBestSellerReportUseCaseHash() =>
    r'444ffc48cf40b3118c3e46eae4efbae6b228d2ed';

@ProviderFor(getAnnualReportUseCase)
const getAnnualReportUseCaseProvider = GetAnnualReportUseCaseProvider._();

final class GetAnnualReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetAnnualReportUseCase,
          GetAnnualReportUseCase,
          GetAnnualReportUseCase
        >
    with $Provider<GetAnnualReportUseCase> {
  const GetAnnualReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAnnualReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAnnualReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAnnualReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAnnualReportUseCase create(Ref ref) {
    return getAnnualReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAnnualReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAnnualReportUseCase>(value),
    );
  }
}

String _$getAnnualReportUseCaseHash() =>
    r'432ac3d0df5a6f1c87c6bdca0f37230fb17a62d7';

@ProviderFor(getProfitLossReportUseCase)
const getProfitLossReportUseCaseProvider =
    GetProfitLossReportUseCaseProvider._();

final class GetProfitLossReportUseCaseProvider
    extends
        $FunctionalProvider<
          GetProfitLossReportUseCase,
          GetProfitLossReportUseCase,
          GetProfitLossReportUseCase
        >
    with $Provider<GetProfitLossReportUseCase> {
  const GetProfitLossReportUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProfitLossReportUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProfitLossReportUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProfitLossReportUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProfitLossReportUseCase create(Ref ref) {
    return getProfitLossReportUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProfitLossReportUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProfitLossReportUseCase>(value),
    );
  }
}

String _$getProfitLossReportUseCaseHash() =>
    r'db6a65f78a0a942977874710e3a0e0b4c4e03421';

@ProviderFor(getAnnualReport)
const getAnnualReportProvider = GetAnnualReportFamily._();

final class GetAnnualReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnnualReport>,
          AnnualReport,
          FutureOr<AnnualReport>
        >
    with $FutureModifier<AnnualReport>, $FutureProvider<AnnualReport> {
  const GetAnnualReportProvider._({
    required GetAnnualReportFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'getAnnualReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getAnnualReportHash();

  @override
  String toString() {
    return r'getAnnualReportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AnnualReport> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AnnualReport> create(Ref ref) {
    final argument = this.argument as DateTime;
    return getAnnualReport(ref, startDate: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAnnualReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getAnnualReportHash() => r'd025e220b9a7e66aac422c3ec4b8a25dd7d84779';

final class GetAnnualReportFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AnnualReport>, DateTime> {
  const GetAnnualReportFamily._()
    : super(
        retry: null,
        name: r'getAnnualReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetAnnualReportProvider call({required DateTime startDate}) =>
      GetAnnualReportProvider._(argument: startDate, from: this);

  @override
  String toString() => r'getAnnualReportProvider';
}

@ProviderFor(getProfitLossReport)
const getProfitLossReportProvider = GetProfitLossReportFamily._();

final class GetProfitLossReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfitLossReport>,
          ProfitLossReport,
          FutureOr<ProfitLossReport>
        >
    with $FutureModifier<ProfitLossReport>, $FutureProvider<ProfitLossReport> {
  const GetProfitLossReportProvider._({
    required GetProfitLossReportFamily super.from,
    required ({DateTime startDate, DateTime endDate, int? branchId})
    super.argument,
  }) : super(
         retry: null,
         name: r'getProfitLossReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getProfitLossReportHash();

  @override
  String toString() {
    return r'getProfitLossReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ProfitLossReport> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfitLossReport> create(Ref ref) {
    final argument =
        this.argument
            as ({DateTime startDate, DateTime endDate, int? branchId});
    return getProfitLossReport(
      ref,
      startDate: argument.startDate,
      endDate: argument.endDate,
      branchId: argument.branchId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetProfitLossReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getProfitLossReportHash() =>
    r'790a98a738a6f7e36839a9f50b4fc6b9f2e59738';

final class GetProfitLossReportFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ProfitLossReport>,
          ({DateTime startDate, DateTime endDate, int? branchId})
        > {
  const GetProfitLossReportFamily._()
    : super(
        retry: null,
        name: r'getProfitLossReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetProfitLossReportProvider call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  }) => GetProfitLossReportProvider._(
    argument: (startDate: startDate, endDate: endDate, branchId: branchId),
    from: this,
  );

  @override
  String toString() => r'getProfitLossReportProvider';
}
