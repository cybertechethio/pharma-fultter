// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_operation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BatchOperationNotifier)
const batchOperationProvider = BatchOperationNotifierProvider._();

final class BatchOperationNotifierProvider
    extends $NotifierProvider<BatchOperationNotifier, void> {
  const BatchOperationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batchOperationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batchOperationNotifierHash();

  @$internal
  @override
  BatchOperationNotifier create() => BatchOperationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$batchOperationNotifierHash() =>
    r'4d408dc85b9c3868232cc79b97c8a180d7d5544c';

abstract class _$BatchOperationNotifier extends $Notifier<void> {
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
