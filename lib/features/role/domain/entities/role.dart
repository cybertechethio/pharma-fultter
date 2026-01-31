import 'package:freezed_annotation/freezed_annotation.dart';
import 'role_permission.dart';

part 'role.freezed.dart';

/// Role entity matching backend API structure
/// Permissions are a simple list with id and description (not grouped)
@freezed
sealed class RoleEntity with _$RoleEntity {
  const RoleEntity._();
  
  const factory RoleEntity({
    required int id,
    required String name,
    String? description,
    required int companyId,
    @Default(true) bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    // Permissions as simple list - comes from role response
    @Default(<RolePermissionEntity>[]) List<RolePermissionEntity> permissions,
  }) = _RoleEntity;
  
  /// Get list of permission IDs for this role
  List<int> get permissionIds => permissions.map((p) => p.id).toList();
}

