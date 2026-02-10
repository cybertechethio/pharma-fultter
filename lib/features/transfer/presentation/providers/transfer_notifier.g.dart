// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransferNotifier)
const transferProvider = TransferNotifierProvider._();

final class TransferNotifierProvider
    extends $AsyncNotifierProvider<TransferNotifier, List<Transfer>> {
  const TransferNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferNotifierHash();

  @$internal
  @override
  TransferNotifier create() => TransferNotifier();
}

String _$transferNotifierHash() => r'5a48a8d28f1f664d243bf41bcd7187b07744e1b6';

abstract class _$TransferNotifier extends $AsyncNotifier<List<Transfer>> {
  FutureOr<List<Transfer>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Transfer>>, List<Transfer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transfer>>, List<Transfer>>,
              AsyncValue<List<Transfer>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
