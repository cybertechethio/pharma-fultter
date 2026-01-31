// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_permission_model.freezed.dart';
part 'role_permission_model.g.dart';

/// Simple permission model used in Role responses
/// When fetching roles with includePermissions=true,
/// permissions come as simple array with id, description, and category
@freezed
sealed class RolePermissionModel with _$RolePermissionModel {
  const factory RolePermissionModel({
    required int id,
    String? description,
    String? category,
  }) = _RolePermissionModel;

  factory RolePermissionModel.fromJson(Map<String, dynamic> json) =>
      _$RolePermissionModelFromJson(json);
}
