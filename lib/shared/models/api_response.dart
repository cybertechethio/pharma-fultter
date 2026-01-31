import 'package:freezed_annotation/freezed_annotation.dart';

import 'meta_model.dart';
import 'error_model.dart';
import 'pagination_model.dart';

part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true,
) @freezed
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({
    required bool success,
    required String message,
    required T data,
    required MetaModel metadata,
    PaginationModel? pagination,
  }) = SuccessResponse<T>;

  const factory ApiResponse.error({
    required bool success,
    required ErrorModel error,
    required MetaModel metadata,
  }) = ErrorResponse<T>;

  
 
  //IF YOU PREFER TO USE THIS: the backend not need to iclude runtimetype = success
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final success = json['success'] as bool;
    if (success) {
      return SuccessResponse<T>(
        success: success,
        message: json['message'] as String,
        data: fromJsonT(json['data']),
        metadata: MetaModel.fromJson(json['metadata'] as Map<String, dynamic>),
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>)
            : null,
      );
    } else {
      return ErrorResponse<T>(
        success: success,
        error: ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
        metadata: MetaModel.fromJson(json['metadata'] as Map<String, dynamic>),
      );
    }
  }

  // IF YOU PREFER TO USE BELOW: your backend must include runtimeType: "success", in it's response otherwise freezed doesnot know success case

  // factory ApiResponse.fromJson(
  //   Map<String, dynamic> json,
  //   T Function(Object?) fromJsonT,
  // ) => _$ApiResponseFromJson(json, fromJsonT);
}