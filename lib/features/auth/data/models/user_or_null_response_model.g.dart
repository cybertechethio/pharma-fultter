// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_or_null_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserOrNullResponseModel _$UserOrNullResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_UserOrNullResponseModel', json, ($checkedConvert) {
  final val = _UserOrNullResponseModel(
    user: $checkedConvert(
      'user',
      (v) => v == null ? null : UserModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$UserOrNullResponseModelToJson(
  _UserOrNullResponseModel instance,
) => <String, dynamic>{'user': ?instance.user?.toJson()};
