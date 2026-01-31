// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupplierCustomerNotifier)
const supplierCustomerProvider = SupplierCustomerNotifierFamily._();

final class SupplierCustomerNotifierProvider
    extends
        $AsyncNotifierProvider<
          SupplierCustomerNotifier,
          List<SupplierCustomer>
        > {
  const SupplierCustomerNotifierProvider._({
    required SupplierCustomerNotifierFamily super.from,
    required SupplierCustomerType super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerNotifierHash();

  @override
  String toString() {
    return r'supplierCustomerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierCustomerNotifier create() => SupplierCustomerNotifier();

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerNotifierHash() =>
    r'6d372233e239478a355e40677b4e3c331991d827';

final class SupplierCustomerNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierCustomerNotifier,
          AsyncValue<List<SupplierCustomer>>,
          List<SupplierCustomer>,
          FutureOr<List<SupplierCustomer>>,
          SupplierCustomerType
        > {
  const SupplierCustomerNotifierFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerNotifierProvider call(SupplierCustomerType type) =>
      SupplierCustomerNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'supplierCustomerProvider';
}

abstract class _$SupplierCustomerNotifier
    extends $AsyncNotifier<List<SupplierCustomer>> {
  late final _$args = ref.$arg as SupplierCustomerType;
  SupplierCustomerType get type => _$args;

  FutureOr<List<SupplierCustomer>> build(SupplierCustomerType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<List<SupplierCustomer>>, List<SupplierCustomer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SupplierCustomer>>,
                List<SupplierCustomer>
              >,
              AsyncValue<List<SupplierCustomer>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
