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
    r'729ee90f846752f680267e725cf2c43670bc53c8';

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
