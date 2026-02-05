// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentMethodCreateLoading)
const paymentMethodCreateLoadingProvider =
    PaymentMethodCreateLoadingProvider._();

final class PaymentMethodCreateLoadingProvider
    extends $NotifierProvider<PaymentMethodCreateLoading, bool> {
  const PaymentMethodCreateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodCreateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodCreateLoadingHash();

  @$internal
  @override
  PaymentMethodCreateLoading create() => PaymentMethodCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$paymentMethodCreateLoadingHash() =>
    r'5efd12473c1b33cf3a7710fa0ce16882b72b32bc';

abstract class _$PaymentMethodCreateLoading extends $Notifier<bool> {
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

@ProviderFor(PaymentMethodUpdateLoading)
const paymentMethodUpdateLoadingProvider =
    PaymentMethodUpdateLoadingProvider._();

final class PaymentMethodUpdateLoadingProvider
    extends $NotifierProvider<PaymentMethodUpdateLoading, Set<int>> {
  const PaymentMethodUpdateLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodUpdateLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodUpdateLoadingHash();

  @$internal
  @override
  PaymentMethodUpdateLoading create() => PaymentMethodUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$paymentMethodUpdateLoadingHash() =>
    r'803ce7d54f14f2f051a05daa8b32347d82d40917';

abstract class _$PaymentMethodUpdateLoading extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PaymentMethodDeleteLoading)
const paymentMethodDeleteLoadingProvider =
    PaymentMethodDeleteLoadingProvider._();

final class PaymentMethodDeleteLoadingProvider
    extends $NotifierProvider<PaymentMethodDeleteLoading, Set<int>> {
  const PaymentMethodDeleteLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodDeleteLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodDeleteLoadingHash();

  @$internal
  @override
  PaymentMethodDeleteLoading create() => PaymentMethodDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$paymentMethodDeleteLoadingHash() =>
    r'd0cfbea61f6128d474523d4b2f01aec5359ae339';

abstract class _$PaymentMethodDeleteLoading extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
