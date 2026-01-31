// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

/// Full permission model from GET /permissions endpoint
/// Backend returns permissions grouped by dynamic categories
@freezed
sealed class PermissionModel with _$PermissionModel {
  const factory PermissionModel({
    required int id,
    required String name, // e.g., "users.read"
    String? description,
    String? category, // e.g., "user_management" - comes from map key or JSON
    @Default(true) bool isActive,
    DateTime? createdAt,
    int? createdBy,
    int? updatedBy,
  }) = _PermissionModel;

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);
}

