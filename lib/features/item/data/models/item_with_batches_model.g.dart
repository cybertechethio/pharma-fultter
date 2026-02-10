// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_with_batches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemWithBatchesModel _$ItemWithBatchesModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ItemWithBatchesModel', json, ($checkedConvert) {
  final val = _ItemWithBatchesModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    code: $checkedConvert('code', (v) => v as String?),
    batches: $checkedConvert(
      'batches',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) =>
                    ItemBatchSummaryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$ItemWithBatchesModelToJson(
  _ItemWithBatchesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': ?instance.code,
  'batches': instance.batches.map((e) => e.toJson()).toList(),
};
