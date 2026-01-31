// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionCreateLoading)
const transactionCreateLoadingProvider = TransactionCreateLoadingProvider._();

final class TransactionCreateLoadingProvider
    extends $NotifierProvider<TransactionCreateLoading, bool> {
  const TransactionCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionCreateLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionCreateLoadingHash();

  @$internal
  @override
  TransactionCreateLoading create() => TransactionCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$transactionCreateLoadingHash() =>
    r'802c6a09070d6490df9ad195b99a58a5e0afc9c5';

abstract class _$TransactionCreateLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TransactionReverseLoading)
const transactionReverseLoadingProvider = TransactionReverseLoadingProvider._();

final class TransactionReverseLoadingProvider
    extends $NotifierProvider<TransactionReverseLoading, bool> {
  const TransactionReverseLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionReverseLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionReverseLoadingHash();

  @$internal
  @override
  TransactionReverseLoading create() => TransactionReverseLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$transactionReverseLoadingHash() =>
    r'a44eac5159c87ebeddbd01ae1f7d6e575271c84b';

abstract class _$TransactionReverseLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
