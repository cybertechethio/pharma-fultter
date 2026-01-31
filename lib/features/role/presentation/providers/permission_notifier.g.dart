// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PermissionNotifier)
const permissionProvider = PermissionNotifierProvider._();

final class PermissionNotifierProvider
    extends
        $AsyncNotifierProvider<
          PermissionNotifier,
          Map<String, List<PermissionEntity>>
        > {
  const PermissionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionNotifierHash();

  @$internal
  @override
  PermissionNotifier create() => PermissionNotifier();
}

String _$permissionNotifierHash() =>
    r'60dab036d6907325955074b230f95d258c1529a7';

abstract class _$PermissionNotifier
    extends $AsyncNotifier<Map<String, List<PermissionEntity>>> {
  FutureOr<Map<String, List<PermissionEntity>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, List<PermissionEntity>>>,
              Map<String, List<PermissionEntity>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, List<PermissionEntity>>>,
                Map<String, List<PermissionEntity>>
              >,
              AsyncValue<Map<String, List<PermissionEntity>>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
