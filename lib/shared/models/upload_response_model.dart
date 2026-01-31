// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_model.freezed.dart';
part 'upload_response_model.g.dart';

/// Single file upload response data
@freezed
sealed class UploadFileData with _$UploadFileData {
  const factory UploadFileData({
    required String url,
    required String filename,
    required int size,
    required String mimetype,
    required String type,
  }) = _UploadFileData;

  factory UploadFileData.fromJson(Map<String, dynamic> json) =>
      _$UploadFileDataFromJson(json);
}

/// Multiple files upload response data
@freezed
sealed class UploadFilesData with _$UploadFilesData {
  const factory UploadFilesData({
    required List<UploadFileData> files,
  }) = _UploadFilesData;

  factory UploadFilesData.fromJson(Map<String, dynamic> json) =>
      _$UploadFilesDataFromJson(json);
}

/// Upload response model - handles both single and multiple file responses
@freezed
sealed class UploadResponseModel with _$UploadResponseModel {
  /// Single file response
  const factory UploadResponseModel.single({
    required UploadFileData data,
  }) = _UploadResponseModelSingle;

  /// Multiple files response
  const factory UploadResponseModel.multiple({
    required UploadFilesData data,
  }) = _UploadResponseModelMultiple;

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) {
    // ApiResponse.fromJson already extracts the 'data' field, so json here IS the data object
    // Check if it contains 'files' array (multiple) or direct file data (single)
    if (json.containsKey('files') && json['files'] is List) {
      // Multiple files response: {files: [...]}
      return UploadResponseModel.multiple(
        data: UploadFilesData.fromJson(json),
      );
    } else if (json.containsKey('url')) {
      // Single file response: {url: ..., filename: ..., ...}
      return UploadResponseModel.single(
        data: UploadFileData.fromJson(json),
      );
    }
    throw FormatException('Invalid upload response format. Expected "files" array or "url" field, but got: ${json.keys}', json);
  }
}

/// Extension to easily get URLs from upload response
extension UploadResponseModelX on UploadResponseModel {
  /// Get single URL (for single file response)
  String? get singleUrl {
    return when(
      single: (data) => data.url,
      multiple: (_) => null,
    );
  }

  /// Get list of URLs (for multiple files response)
  List<String> get urls {
    return when(
      single: (data) => [data.url],
      multiple: (data) => data.files.map((f) => f.url).toList(),
    );
  }

  /// Get first URL (convenience method)
  String? get firstUrl {
    return when(
      single: (data) => data.url,
      multiple: (data) => data.files.isNotEmpty ? data.files.first.url : null,
    );
  }
}

