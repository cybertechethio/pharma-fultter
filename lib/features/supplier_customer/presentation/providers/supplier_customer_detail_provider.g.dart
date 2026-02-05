// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// FutureProvider to fetch a single supplier/customer by ID

@ProviderFor(supplierCustomerDetail)
const supplierCustomerDetailProvider = SupplierCustomerDetailFamily._();

/// FutureProvider to fetch a single supplier/customer by ID

final class SupplierCustomerDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<SupplierCustomer>,
          SupplierCustomer,
          FutureOr<SupplierCustomer>
        >
    with $FutureModifier<SupplierCustomer>, $FutureProvider<SupplierCustomer> {
  /// FutureProvider to fetch a single supplier/customer by ID
  const SupplierCustomerDetailProvider._({
    required SupplierCustomerDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerDetailHash();

  @override
  String toString() {
    return r'supplierCustomerDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SupplierCustomer> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SupplierCustomer> create(Ref ref) {
    final argument = this.argument as String;
    return supplierCustomerDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerDetailProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerDetailHash() =>
    r'22754a4b528c958a2cac6817b4b3ab9ecb3b06d4';

/// FutureProvider to fetch a single supplier/customer by ID

final class SupplierCustomerDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SupplierCustomer>, String> {
  const SupplierCustomerDetailFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// FutureProvider to fetch a single supplier/customer by ID

  SupplierCustomerDetailProvider call(String id) =>
      SupplierCustomerDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'supplierCustomerDetailProvider';
}
