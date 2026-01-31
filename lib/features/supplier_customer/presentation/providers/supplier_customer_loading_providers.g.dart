// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_customer_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupplierCustomerCreateLoading)
const supplierCustomerCreateLoadingProvider =
    SupplierCustomerCreateLoadingFamily._();

final class SupplierCustomerCreateLoadingProvider
    extends $NotifierProvider<SupplierCustomerCreateLoading, bool> {
  const SupplierCustomerCreateLoadingProvider._({
    required SupplierCustomerCreateLoadingFamily super.from,
    required SupplierCustomerType super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerCreateLoadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerCreateLoadingHash();

  @override
  String toString() {
    return r'supplierCustomerCreateLoadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierCustomerCreateLoading create() => SupplierCustomerCreateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerCreateLoadingProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerCreateLoadingHash() =>
    r'4cb61341442cc40c7ccba9bd2211607507f81694';

final class SupplierCustomerCreateLoadingFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierCustomerCreateLoading,
          bool,
          bool,
          bool,
          SupplierCustomerType
        > {
  const SupplierCustomerCreateLoadingFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerCreateLoadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerCreateLoadingProvider call(SupplierCustomerType type) =>
      SupplierCustomerCreateLoadingProvider._(argument: type, from: this);

  @override
  String toString() => r'supplierCustomerCreateLoadingProvider';
}

abstract class _$SupplierCustomerCreateLoading extends $Notifier<bool> {
  late final _$args = ref.$arg as SupplierCustomerType;
  SupplierCustomerType get type => _$args;

  bool build(SupplierCustomerType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SupplierCustomerUpdateLoading)
const supplierCustomerUpdateLoadingProvider =
    SupplierCustomerUpdateLoadingFamily._();

final class SupplierCustomerUpdateLoadingProvider
    extends $NotifierProvider<SupplierCustomerUpdateLoading, Set<String>> {
  const SupplierCustomerUpdateLoadingProvider._({
    required SupplierCustomerUpdateLoadingFamily super.from,
    required SupplierCustomerType super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerUpdateLoadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerUpdateLoadingHash();

  @override
  String toString() {
    return r'supplierCustomerUpdateLoadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierCustomerUpdateLoading create() => SupplierCustomerUpdateLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerUpdateLoadingProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerUpdateLoadingHash() =>
    r'7a85550ae5e52d9034ad8ae7109ac9b88d92be25';

final class SupplierCustomerUpdateLoadingFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierCustomerUpdateLoading,
          Set<String>,
          Set<String>,
          Set<String>,
          SupplierCustomerType
        > {
  const SupplierCustomerUpdateLoadingFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerUpdateLoadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerUpdateLoadingProvider call(SupplierCustomerType type) =>
      SupplierCustomerUpdateLoadingProvider._(argument: type, from: this);

  @override
  String toString() => r'supplierCustomerUpdateLoadingProvider';
}

abstract class _$SupplierCustomerUpdateLoading extends $Notifier<Set<String>> {
  late final _$args = ref.$arg as SupplierCustomerType;
  SupplierCustomerType get type => _$args;

  Set<String> build(SupplierCustomerType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SupplierCustomerDeleteLoading)
const supplierCustomerDeleteLoadingProvider =
    SupplierCustomerDeleteLoadingFamily._();

final class SupplierCustomerDeleteLoadingProvider
    extends $NotifierProvider<SupplierCustomerDeleteLoading, Set<String>> {
  const SupplierCustomerDeleteLoadingProvider._({
    required SupplierCustomerDeleteLoadingFamily super.from,
    required SupplierCustomerType super.argument,
  }) : super(
         retry: null,
         name: r'supplierCustomerDeleteLoadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplierCustomerDeleteLoadingHash();

  @override
  String toString() {
    return r'supplierCustomerDeleteLoadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupplierCustomerDeleteLoading create() => SupplierCustomerDeleteLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SupplierCustomerDeleteLoadingProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplierCustomerDeleteLoadingHash() =>
    r'ed37b8d69c6d3b53580cb3ec2f1c487d434461c6';

final class SupplierCustomerDeleteLoadingFamily extends $Family
    with
        $ClassFamilyOverride<
          SupplierCustomerDeleteLoading,
          Set<String>,
          Set<String>,
          Set<String>,
          SupplierCustomerType
        > {
  const SupplierCustomerDeleteLoadingFamily._()
    : super(
        retry: null,
        name: r'supplierCustomerDeleteLoadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplierCustomerDeleteLoadingProvider call(SupplierCustomerType type) =>
      SupplierCustomerDeleteLoadingProvider._(argument: type, from: this);

  @override
  String toString() => r'supplierCustomerDeleteLoadingProvider';
}

abstract class _$SupplierCustomerDeleteLoading extends $Notifier<Set<String>> {
  late final _$args = ref.$arg as SupplierCustomerType;
  SupplierCustomerType get type => _$args;

  Set<String> build(SupplierCustomerType type);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
