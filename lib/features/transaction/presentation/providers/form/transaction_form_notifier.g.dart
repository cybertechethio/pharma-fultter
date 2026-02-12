// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionFormNotifier)
const transactionFormProvider = TransactionFormNotifierProvider._();

final class TransactionFormNotifierProvider
    extends $NotifierProvider<TransactionFormNotifier, TransactionFormState> {
  const TransactionFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionFormNotifierHash();

  @$internal
  @override
  TransactionFormNotifier create() => TransactionFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionFormState>(value),
    );
  }
}

String _$transactionFormNotifierHash() =>
    r'72f376dc330b64f27ce502a9de8648ceac01c2d6';

abstract class _$TransactionFormNotifier
    extends $Notifier<TransactionFormState> {
  TransactionFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TransactionFormState, TransactionFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransactionFormState, TransactionFormState>,
              TransactionFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
