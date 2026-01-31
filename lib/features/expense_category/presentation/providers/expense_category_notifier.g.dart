// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseCategoryNotifier)
const expenseCategoryProvider = ExpenseCategoryNotifierProvider._();

final class ExpenseCategoryNotifierProvider
    extends
        $AsyncNotifierProvider<ExpenseCategoryNotifier, List<ExpenseCategory>> {
  const ExpenseCategoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseCategoryNotifierHash();

  @$internal
  @override
  ExpenseCategoryNotifier create() => ExpenseCategoryNotifier();
}

String _$expenseCategoryNotifierHash() =>
    r'b4d0d838b269c9756d22a8562c154d73c42b4983';

abstract class _$ExpenseCategoryNotifier
    extends $AsyncNotifier<List<ExpenseCategory>> {
  FutureOr<List<ExpenseCategory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ExpenseCategory>>, List<ExpenseCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ExpenseCategory>>,
                List<ExpenseCategory>
              >,
              AsyncValue<List<ExpenseCategory>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
