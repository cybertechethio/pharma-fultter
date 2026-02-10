// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransferFormNotifier)
const transferFormProvider = TransferFormNotifierProvider._();

final class TransferFormNotifierProvider
    extends $NotifierProvider<TransferFormNotifier, TransferFormState> {
  const TransferFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferFormNotifierHash();

  @$internal
  @override
  TransferFormNotifier create() => TransferFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransferFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransferFormState>(value),
    );
  }
}

String _$transferFormNotifierHash() =>
    r'2ad96e44a8736a3ef6039b41350f5132a837503d';

abstract class _$TransferFormNotifier extends $Notifier<TransferFormState> {
  TransferFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TransferFormState, TransferFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransferFormState, TransferFormState>,
              TransferFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
