// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserModel', json, ($checkedConvert) {
      final val = _UserModel(
        id: $checkedConvert('id', (v) => _idFromJson(v)),
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String),
        firstName: $checkedConvert('firstName', (v) => v as String),
        lastName: $checkedConvert('lastName', (v) => v as String),
        avatar: $checkedConvert('avatar', (v) => v as String?),
        isAccountVerified: $checkedConvert(
          'isAccountVerified',
          (v) => v as bool? ?? false,
        ),
        resetToken: $checkedConvert('resetToken', (v) => v as String?),
        companyName: $checkedConvert('companyName', (v) => v as String?),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': ?instance.email,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': ?instance.avatar,
      'isAccountVerified': instance.isAccountVerified,
      'resetToken': ?instance.resetToken,
      'companyName': ?instance.companyName,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };
