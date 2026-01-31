// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseCategoryUiEvents)
const expenseCategoryUiEventsProvider = ExpenseCategoryUiEventsProvider._();

final class ExpenseCategoryUiEventsProvider
    extends
        $NotifierProvider<ExpenseCategoryUiEvents, ExpenseCategoryUiEvent?> {
  const ExpenseCategoryUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseCategoryUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseCategoryUiEventsHash();

  @$internal
  @override
  ExpenseCategoryUiEvents create() => ExpenseCategoryUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseCategoryUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseCategoryUiEvent?>(value),
    );
  }
}

String _$expenseCategoryUiEventsHash() =>
    r'651c29e1cc17eeb019b2c89bd4d1aa6ccf483d34';

abstract class _$ExpenseCategoryUiEvents
    extends $Notifier<ExpenseCategoryUiEvent?> {
  ExpenseCategoryUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ExpenseCategoryUiEvent?, ExpenseCategoryUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExpenseCategoryUiEvent?, ExpenseCategoryUiEvent?>,
              ExpenseCategoryUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
