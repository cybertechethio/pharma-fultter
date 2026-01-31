// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoleNotifier)
const roleProvider = RoleNotifierProvider._();

final class RoleNotifierProvider
    extends $AsyncNotifierProvider<RoleNotifier, List<RoleEntity>> {
  const RoleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roleNotifierHash();

  @$internal
  @override
  RoleNotifier create() => RoleNotifier();
}

String _$roleNotifierHash() => r'a9034acbe3875b841879e54d9d9846e4651ea3ee';

abstract class _$RoleNotifier extends $AsyncNotifier<List<RoleEntity>> {
  FutureOr<List<RoleEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<RoleEntity>>, List<RoleEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RoleEntity>>, List<RoleEntity>>,
              AsyncValue<List<RoleEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
