// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokenModel _$AuthTokenModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AuthTokenModel', json, ($checkedConvert) {
      final val = _AuthTokenModel(
        accessToken: $checkedConvert('accessToken', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AuthTokenModelToJson(_AuthTokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
