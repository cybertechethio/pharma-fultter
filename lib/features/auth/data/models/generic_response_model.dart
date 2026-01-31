// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import '../../../setting/data/models/company_model.dart';
import '../../../branch/data/models/branch_model.dart';

part 'generic_response_model.freezed.dart';
part 'generic_response_model.g.dart';

@freezed
sealed class GenericResponseModel with _$GenericResponseModel {
  const factory GenericResponseModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
    @JsonKey(fromJson: _idFromJson) String? currentCompanyId,
    @JsonKey(fromJson: _idFromJson) String? currentBranchId,
    CompanyModel? currentCompany,
    BranchModel? currentBranch,
  }) = _GenericResponseModel;

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseModelFromJson(json);
}

/// Helper function to convert id from int to String
String? _idFromJson(dynamic value) {
  if (value == null) {
    return null;
  }
  
  if (value is int) {
    return value.toString();
  } else if (value is String) {
    return value;
  } else {
    throw ArgumentError('Expected int or String for id, got ${value.runtimeType}');
  }
}
