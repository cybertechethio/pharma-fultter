import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_permission.freezed.dart';

/// Simple permission reference used in Role entities
/// Contains id, description, and category from role response
@freezed
sealed class RolePermissionEntity with _$RolePermissionEntity {
  const factory RolePermissionEntity({
    required int id,
    String? description,
    String? category,
  }) = _RolePermissionEntity;
}
