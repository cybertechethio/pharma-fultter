// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenericResponseModel _$GenericResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_GenericResponseModel', json, ($checkedConvert) {
  final val = _GenericResponseModel(
    accessToken: $checkedConvert('accessToken', (v) => v as String),
    refreshToken: $checkedConvert('refreshToken', (v) => v as String),
    user: $checkedConvert(
      'user',
      (v) => UserModel.fromJson(v as Map<String, dynamic>),
    ),
    currentCompanyId: $checkedConvert(
      'currentCompanyId',
      (v) => _idFromJson(v),
    ),
    currentBranchId: $checkedConvert('currentBranchId', (v) => _idFromJson(v)),
    currentCompany: $checkedConvert(
      'currentCompany',
      (v) =>
          v == null ? null : CompanyModel.fromJson(v as Map<String, dynamic>),
    ),
    currentBranch: $checkedConvert(
      'currentBranch',
      (v) => v == null ? null : BranchModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GenericResponseModelToJson(
  _GenericResponseModel instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'user': instance.user.toJson(),
  'currentCompanyId': ?instance.currentCompanyId,
  'currentBranchId': ?instance.currentBranchId,
  'currentCompany': ?instance.currentCompany?.toJson(),
  'currentBranch': ?instance.currentBranch?.toJson(),
};
