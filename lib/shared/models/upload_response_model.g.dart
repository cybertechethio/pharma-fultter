// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UploadFileData _$UploadFileDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UploadFileData', json, ($checkedConvert) {
      final val = _UploadFileData(
        url: $checkedConvert('url', (v) => v as String),
        filename: $checkedConvert('filename', (v) => v as String),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        mimetype: $checkedConvert('mimetype', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UploadFileDataToJson(_UploadFileData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'filename': instance.filename,
      'size': instance.size,
      'mimetype': instance.mimetype,
      'type': instance.type,
    };

_UploadFilesData _$UploadFilesDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UploadFilesData', json, ($checkedConvert) {
      final val = _UploadFilesData(
        files: $checkedConvert(
          'files',
          (v) => (v as List<dynamic>)
              .map((e) => UploadFileData.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UploadFilesDataToJson(_UploadFilesData instance) =>
    <String, dynamic>{'files': instance.files.map((e) => e.toJson()).toList()};
