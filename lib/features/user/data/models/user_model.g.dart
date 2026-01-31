// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserModel', json, ($checkedConvert) {
      final val = _UserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        firstName: $checkedConvert('firstName', (v) => v as String),
        lastName: $checkedConvert('lastName', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        phone: $checkedConvert('phone', (v) => v as String),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };
