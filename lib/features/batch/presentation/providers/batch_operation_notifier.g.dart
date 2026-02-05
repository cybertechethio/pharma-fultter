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
        isAutoDispose: false,
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
    r'e486f00a2530209fbede7a07fc118ede2706c8c8';

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
