import '../../domain/entities/permission.dart';
import '../../domain/entities/role_permission.dart';
import '../models/permission_model.dart';
import '../models/role_permission_model.dart';

/// Mapper for full PermissionModel -> PermissionEntity
extension PermissionMapper on PermissionModel {
  PermissionEntity toDomain() {
    return PermissionEntity(
      id: id,
      name: name,
      description: description,
      category: category,
      isActive: isActive,
      createdAt: createdAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

/// Mapper for simple RolePermissionModel -> RolePermissionEntity
extension RolePermissionMapper on RolePermissionModel {
  RolePermissionEntity toDomain() {
    return RolePermissionEntity(
      id: id,
      description: description,
      category: category,
    );
  }
}

