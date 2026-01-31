import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/role.dart';
import '../../domain/entities/role_permission.dart';
import '../../domain/entities/permission.dart';
import 'role_providers.dart';
import 'role_events.dart';
import 'role_loading_providers.dart';
import 'permission_notifier.dart';

part 'role_notifier.g.dart';

@riverpod
class RoleNotifier extends _$RoleNotifier {
  @override
  Future<List<RoleEntity>> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> create({
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    final createLoading = ref.read(roleCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createRoleUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
      permissionIds: permissionIds,
      isActive: isActive,
    );

    result.fold(
      (failure) {
        ref.read(roleUiEventsProvider.notifier).emit(RoleFailure(failure));
      },
      (created) {
        // If created role has empty permissions, reconstruct from permissionIds
        // This handles cases where the API response doesn't include permissions
        final finalCreated = created.permissions.isEmpty
            ? _reconstructPermissions(created, permissionIds)
            : created;

        final current = state.value ?? const <RoleEntity>[];
        state = AsyncValue.data([finalCreated, ...current]);
        ref.read(roleUiEventsProvider.notifier).emit(
          RoleCreated(finalCreated, 'Role created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateRole({
    required int id,
    required String name,
    String? description,
    required List<int> permissionIds,
    bool isActive = true,
  }) async {
    final updating = ref.read(roleUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateRoleUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
      permissionIds: permissionIds,
      isActive: isActive,
    );

    result.fold(
      (failure) {
        ref.read(roleUiEventsProvider.notifier).emit(RoleFailure(failure));
        updating.stop(id);
      },
      (updated) {
        final list = List<RoleEntity>.from(state.value ?? const <RoleEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) {
          // If updated role has empty permissions, reconstruct from permissionIds
          // This handles cases where the API response doesn't include permissions
          final finalUpdated = updated.permissions.isEmpty
              ? _reconstructPermissions(updated, permissionIds)
              : updated;
          list[idx] = finalUpdated;
        }
        state = AsyncValue.data(list);
        ref.read(roleUiEventsProvider.notifier).emit(
          RoleUpdated(list[idx], 'Role updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  /// Reconstructs permissions from permissionIds using the available permissions list
  RoleEntity _reconstructPermissions(RoleEntity role, List<int> permissionIds) {
    // Get all available permissions from the permission provider
    final permissionsAsync = ref.read(permissionProvider);
    final allPermissions = permissionsAsync.maybeWhen(
      data: (data) => data,
      orElse: () => <String, List<PermissionEntity>>{},
    );

    // Flatten all permissions and filter by permissionIds
    // Create RolePermissionEntity list with id, description, and category
    final List<RolePermissionEntity> rolePermissions = [];
    for (final entry in allPermissions.entries) {
      for (final permission in entry.value) {
        if (permissionIds.contains(permission.id)) {
          rolePermissions.add(RolePermissionEntity(
            id: permission.id,
            description: permission.description,
            category: permission.category,
          ));
        }
      }
    }

    return role.copyWith(permissions: rolePermissions);
  }

  Future<void> delete({
    required int id,
  }) async {
    final deleting = ref.read(roleDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteRoleUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(roleUiEventsProvider.notifier).emit(RoleFailure(failure));
      },
      (deletedEntity) {
        final list = List<RoleEntity>.from(state.value ?? const <RoleEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(roleUiEventsProvider.notifier).emit(
          RoleDeleted(id, 'Role deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<RoleEntity>> _load() async {
    final useCase = ref.read(getRolesUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

