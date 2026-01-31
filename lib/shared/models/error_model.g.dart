// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ErrorModel', json, ($checkedConvert) {
      final val = _ErrorModel(
        statusCode: $checkedConvert('statusCode', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ErrorModelToJson(_ErrorModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'type': instance.type,
    };
