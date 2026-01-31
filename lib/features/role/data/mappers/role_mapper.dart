import '../../domain/entities/role.dart';
import '../models/role_model.dart';
import 'permission_mapper.dart';

extension RoleMapper on RoleModel {
  RoleEntity toDomain() {
    // Permissions are now a simple list with id and description
    final permissionEntities = permissions.map((p) => p.toDomain()).toList();

    return RoleEntity(
      id: id,
      name: name,
      description: description,
      companyId: companyId,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      permissions: permissionEntities,
    );
  }
}

