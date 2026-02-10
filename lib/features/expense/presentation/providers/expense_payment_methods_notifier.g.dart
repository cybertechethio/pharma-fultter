// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_payment_methods_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpensePaymentMethodsNotifier)
const expensePaymentMethodsProvider = ExpensePaymentMethodsNotifierProvider._();

final class ExpensePaymentMethodsNotifierProvider
    extends $NotifierProvider<ExpensePaymentMethodsNotifier, void> {
  const ExpensePaymentMethodsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expensePaymentMethodsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensePaymentMethodsNotifierHash();

  @$internal
  @override
  ExpensePaymentMethodsNotifier create() => ExpensePaymentMethodsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$expensePaymentMethodsNotifierHash() =>
    r'1e2499fcad596fa331d6aa8ec9fada05f6057c73';

abstract class _$ExpensePaymentMethodsNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
