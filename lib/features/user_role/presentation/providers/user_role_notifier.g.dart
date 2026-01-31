// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserRoleNotifier)
const userRoleProvider = UserRoleNotifierFamily._();

final class UserRoleNotifierProvider
    extends
        $AsyncNotifierProvider<
          UserRoleNotifier,
          List<UserBranchRoleAssignment>
        > {
  const UserRoleNotifierProvider._({
    required UserRoleNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'userRoleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userRoleNotifierHash();

  @override
  String toString() {
    return r'userRoleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserRoleNotifier create() => UserRoleNotifier();

  @override
  bool operator ==(Object other) {
    return other is UserRoleNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userRoleNotifierHash() => r'57124d6097b618e66ba52e4f3f8a6269e68d6fc7';

final class UserRoleNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserRoleNotifier,
          AsyncValue<List<UserBranchRoleAssignment>>,
          List<UserBranchRoleAssignment>,
          FutureOr<List<UserBranchRoleAssignment>>,
          int
        > {
  const UserRoleNotifierFamily._()
    : super(
        retry: null,
        name: r'userRoleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserRoleNotifierProvider call(int userId) =>
      UserRoleNotifierProvider._(argument: userId, from: this);

  @override
  String toString() => r'userRoleProvider';
}

abstract class _$UserRoleNotifier
    extends $AsyncNotifier<List<UserBranchRoleAssignment>> {
  late final _$args = ref.$arg as int;
  int get userId => _$args;

  FutureOr<List<UserBranchRoleAssignment>> build(int userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<UserBranchRoleAssignment>>,
              List<UserBranchRoleAssignment>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<UserBranchRoleAssignment>>,
                List<UserBranchRoleAssignment>
              >,
              AsyncValue<List<UserBranchRoleAssignment>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
