// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseCategoryModel _$ExpenseCategoryModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ExpenseCategoryModel', json, ($checkedConvert) {
  final val = _ExpenseCategoryModel(
    id: $checkedConvert('id', (v) => JsonTypeConverters.stringFromDynamic(v)),
    companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ExpenseCategoryModelToJson(
  _ExpenseCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'companyId': instance.companyId,
  'name': instance.name,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'createdBy': ?instance.createdBy,
  'updatedBy': ?instance.updatedBy,
};
