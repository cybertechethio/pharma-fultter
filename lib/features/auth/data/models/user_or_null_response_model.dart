// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'user_or_null_response_model.freezed.dart';
part 'user_or_null_response_model.g.dart';

@freezed
sealed class UserOrNullResponseModel with _$UserOrNullResponseModel {
  const factory UserOrNullResponseModel({
    UserModel? user,
  }) = _UserOrNullResponseModel;

  factory UserOrNullResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrNullResponseModelFromJson(json);
}
