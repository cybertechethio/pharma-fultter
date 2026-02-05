// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentMethodUiEvents)
const paymentMethodUiEventsProvider = PaymentMethodUiEventsProvider._();

final class PaymentMethodUiEventsProvider
    extends $NotifierProvider<PaymentMethodUiEvents, PaymentMethodUiEvent?> {
  const PaymentMethodUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentMethodUiEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentMethodUiEventsHash();

  @$internal
  @override
  PaymentMethodUiEvents create() => PaymentMethodUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentMethodUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentMethodUiEvent?>(value),
    );
  }
}

String _$paymentMethodUiEventsHash() =>
    r'b9007d5f63bede6871919c04c650bcf8b74fda6c';

abstract class _$PaymentMethodUiEvents
    extends $Notifier<PaymentMethodUiEvent?> {
  PaymentMethodUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PaymentMethodUiEvent?, PaymentMethodUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentMethodUiEvent?, PaymentMethodUiEvent?>,
              PaymentMethodUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
