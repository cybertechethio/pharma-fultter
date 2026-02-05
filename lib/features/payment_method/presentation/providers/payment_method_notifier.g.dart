// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for managing payment methods for a specific payment
/// Note: Payment methods are scoped to a paymentId

@ProviderFor(PaymentMethodNotifier)
const paymentMethodProvider = PaymentMethodNotifierProvider._();

/// Notifier for managing payment methods for a specific payment
/// Note: Payment methods are scoped to a paymentId
final class PaymentMethodNotifierProvider
    extends $AsyncNotifierProvider<PaymentMethodNotifier, void> {
  /// Notifier for managing payment methods for a specific payment
  /// Note: Payment methods are scoped to a paymentId
  const PaymentMethodNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodNotifierHash();

  @$internal
  @override
  PaymentMethodNotifier create() => PaymentMethodNotifier();
}

String _$paymentMethodNotifierHash() =>
    r'c2a5b0d26a7cb9fa15039aa3f1e0c7fd750b490b';

/// Notifier for managing payment methods for a specific payment
/// Note: Payment methods are scoped to a paymentId

abstract class _$PaymentMethodNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
