// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentContextModel _$CurrentContextModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CurrentContextModel', json, ($checkedConvert) {
      final val = _CurrentContextModel(
        currentCompanyId: $checkedConvert(
          'currentCompanyId',
          (v) => _idFromJson(v),
        ),
        currentBranchId: $checkedConvert(
          'currentBranchId',
          (v) => _idFromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CurrentContextModelToJson(
  _CurrentContextModel instance,
) => <String, dynamic>{
  'currentCompanyId': ?instance.currentCompanyId,
  'currentBranchId': ?instance.currentBranchId,
};
