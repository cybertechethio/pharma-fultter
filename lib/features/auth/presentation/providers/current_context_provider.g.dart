// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_context_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentContextNotifier)
const currentContextProvider = CurrentContextNotifierProvider._();

final class CurrentContextNotifierProvider
    extends $AsyncNotifierProvider<CurrentContextNotifier, CurrentContext?> {
  const CurrentContextNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentContextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentContextNotifierHash();

  @$internal
  @override
  CurrentContextNotifier create() => CurrentContextNotifier();
}

String _$currentContextNotifierHash() =>
    r'829e56f3507dbc9a68db030fec707aa42557819b';

abstract class _$CurrentContextNotifier
    extends $AsyncNotifier<CurrentContext?> {
  FutureOr<CurrentContext?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<CurrentContext?>, CurrentContext?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CurrentContext?>, CurrentContext?>,
              AsyncValue<CurrentContext?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
