import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/user_type_enum.dart';

part 'user.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    @Default(true) bool isActive,
    @Default(UserType.standard) UserType userType,
    required DateTime createdAt,
  }) = _UserEntity;
}

