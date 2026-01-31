// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupplierCustomerUiEvents)
const supplierCustomerUiEventsProvider = SupplierCustomerUiEventsFamily._();

final class SupplierCustomerUiEventsProvider
    extends
        $NotifierProvider<SupplierCustomerUiEvents, SupplierCustomerUiEvent?> {
  const SupplierCustomerUiEventsProvider._({
    required SupplierCustomerUiEventsFamily super.from,
    required SupplierCustomerType super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerUiEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerUiEventsHash();

  @override
  String toString() {
    return r'supplierCustomerUiEventsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierCustomerUiEvents create() => SupplierCustomerUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupplierCustomerUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupplierCustomerUiEvent?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerUiEventsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerUiEventsHash() =>
    r'3d4a14ce34cc7c28b959150e60d1fae4c225f546';

final class SupplierCustomerUiEventsFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierCustomerUiEvents,
          SupplierCustomerUiEvent?,
          SupplierCustomerUiEvent?,
          SupplierCustomerUiEvent?,
          SupplierCustomerType
        > {
  const SupplierCustomerUiEventsFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerUiEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerUiEventsProvider call(SupplierCustomerType type) =>
      SupplierCustomerUiEventsProvider._(argument: type, from: this);

  @override
  String toString() => r'supplierCustomerUiEventsProvider';
}

abstract class _$SupplierCustomerUiEvents
    extends $Notifier<SupplierCustomerUiEvent?> {
  late final _$args = ref.$arg as SupplierCustomerType;
  SupplierCustomerType get type => _$args;

  SupplierCustomerUiEvent? build(SupplierCustomerType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<SupplierCustomerUiEvent?, SupplierCustomerUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SupplierCustomerUiEvent?, SupplierCustomerUiEvent?>,
              SupplierCustomerUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
