// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BankNotifier)
const bankProvider = BankNotifierProvider._();

final class BankNotifierProvider
    extends $AsyncNotifierProvider<BankNotifier, List<BankEntity>> {
  const BankNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankNotifierHash();

  @$internal
  @override
  BankNotifier create() => BankNotifier();
}

String _$bankNotifierHash() => r'2d587e90e6d07bcbfe4319036e986228aefb13ab';

abstract class _$BankNotifier extends $AsyncNotifier<List<BankEntity>> {
  FutureOr<List<BankEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<BankEntity>>, List<BankEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BankEntity>>, List<BankEntity>>,
              AsyncValue<List<BankEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
