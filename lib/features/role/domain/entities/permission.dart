import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';

/// Full permission entity with all details
@freezed
sealed class PermissionEntity with _$PermissionEntity {
  const factory PermissionEntity({
    required int id,
    required String name, // e.g., "users.read"
    String? description,
    String? category, // e.g., "user_management"
    @Default(true) bool isActive,
    DateTime? createdAt,
    int? createdBy,
    int? updatedBy,
  }) = _PermissionEntity;
}

