// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_item_types_breakdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualItemTypesBreakdownModel _$AnnualItemTypesBreakdownModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AnnualItemTypesBreakdownModel', json, ($checkedConvert) {
  final val = _AnnualItemTypesBreakdownModel(
    direct: $checkedConvert(
      'direct',
      (v) => AnnualItemTypeDataModel.fromJson(v as Map<String, dynamic>),
    ),
    processed: $checkedConvert(
      'processed',
      (v) => AnnualItemTypeDataModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AnnualItemTypesBreakdownModelToJson(
  _AnnualItemTypesBreakdownModel instance,
) => <String, dynamic>{
  'direct': instance.direct.toJson(),
  'processed': instance.processed.toJson(),
};
