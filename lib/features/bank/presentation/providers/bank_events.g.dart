// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BankUiEvents)
const bankUiEventsProvider = BankUiEventsProvider._();

final class BankUiEventsProvider
    extends $NotifierProvider<BankUiEvents, BankUiEvent?> {
  const BankUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankUiEventsHash();

  @$internal
  @override
  BankUiEvents create() => BankUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BankUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BankUiEvent?>(value),
    );
  }
}

String _$bankUiEventsHash() => r'0a6dbf94bb82def3b4a658b4f4eff3412f41c0b8';

abstract class _$BankUiEvents extends $Notifier<BankUiEvent?> {
  BankUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BankUiEvent?, BankUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BankUiEvent?, BankUiEvent?>,
              BankUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
