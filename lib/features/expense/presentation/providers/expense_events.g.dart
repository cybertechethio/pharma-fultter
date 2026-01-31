// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseUiEvents)
const expenseUiEventsProvider = ExpenseUiEventsProvider._();

final class ExpenseUiEventsProvider
    extends $NotifierProvider<ExpenseUiEvents, ExpenseUiEvent?> {
  const ExpenseUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseUiEventsHash();

  @$internal
  @override
  ExpenseUiEvents create() => ExpenseUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseUiEvent?>(value),
    );
  }
}

String _$expenseUiEventsHash() => r'e8fc2bbd6fd2a7cef74f07d0b8ad92fb9691bc45';

abstract class _$ExpenseUiEvents extends $Notifier<ExpenseUiEvent?> {
  ExpenseUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ExpenseUiEvent?, ExpenseUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExpenseUiEvent?, ExpenseUiEvent?>,
              ExpenseUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
