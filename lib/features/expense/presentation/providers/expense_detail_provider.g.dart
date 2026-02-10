// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expenseDetail)
const expenseDetailProvider = ExpenseDetailFamily._();

final class ExpenseDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ExpenseDetail>,
          ExpenseDetail,
          FutureOr<ExpenseDetail>
        >
    with $FutureModifier<ExpenseDetail>, $FutureProvider<ExpenseDetail> {
  const ExpenseDetailProvider._({
    required ExpenseDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'expenseDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$expenseDetailHash();

  @override
  String toString() {
    return r'expenseDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ExpenseDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ExpenseDetail> create(Ref ref) {
    final argument = this.argument as String;
    return expenseDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$expenseDetailHash() => r'ecc50a604f250d68db99ab7d2d6ccb814ba1014b';

final class ExpenseDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ExpenseDetail>, String> {
  const ExpenseDetailFamily._()
    : super(
        retry: null,
        name: r'expenseDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExpenseDetailProvider call(String expenseId) =>
      ExpenseDetailProvider._(argument: expenseId, from: this);

  @override
  String toString() => r'expenseDetailProvider';
}
