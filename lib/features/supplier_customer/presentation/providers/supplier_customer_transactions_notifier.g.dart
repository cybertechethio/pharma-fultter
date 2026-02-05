// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_transactions_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supplierCustomerTransactions)
const supplierCustomerTransactionsProvider =
    SupplierCustomerTransactionsFamily._();

final class SupplierCustomerTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Transaction>>,
          List<Transaction>,
          FutureOr<List<Transaction>>
        >
    with
        $FutureModifier<List<Transaction>>,
        $FutureProvider<List<Transaction>> {
  const SupplierCustomerTransactionsProvider._({
    required SupplierCustomerTransactionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerTransactionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerTransactionsHash();

  @override
  String toString() {
    return r'supplierCustomerTransactionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Transaction>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Transaction>> create(Ref ref) {
    final argument = this.argument as String;
    return supplierCustomerTransactions(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerTransactionsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerTransactionsHash() =>
    r'7c01fa21ba3333341f28ad8b89a9a4859db4c936';

final class SupplierCustomerTransactionsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Transaction>>, String> {
  const SupplierCustomerTransactionsFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerTransactionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerTransactionsProvider call(String supplierCustomerId) =>
      SupplierCustomerTransactionsProvider._(
        argument: supplierCustomerId,
        from: this,
      );

  @override
  String toString() => r'supplierCustomerTransactionsProvider';
}
