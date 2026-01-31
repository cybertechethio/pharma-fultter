// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'role_permission_model.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

/// Role model matching backend API response
/// When fetching roles with includePermissions=true,
/// permissions come as a simple list with {id, description}
@freezed
sealed class RoleModel with _$RoleModel {
  const factory RoleModel({
    required int id,
    required String name,
    String? description,
    required int companyId,
    @Default(true) bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
    // Permissions are a simple list when included in role response
    @Default(<RolePermissionModel>[]) List<RolePermissionModel> permissions,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}

