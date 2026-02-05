// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/user_type_enum.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    @Default(true) bool isActive,
    @JsonKey(
      fromJson: _userTypeFromJson,
      toJson: _userTypeToJson,
    )
    @Default(UserType.standard)
    UserType userType,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// JSON conversion helpers for UserType enum
UserType _userTypeFromJson(String? value) {
  if (value == null || value.isEmpty) return UserType.standard;
  return UserTypeExtension.fromString(value);
}

String _userTypeToJson(UserType value) {
  return value.toApiString();
}

