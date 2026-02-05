// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_split_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchSplitRequestModel _$BatchSplitRequestModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BatchSplitRequestModel', json, ($checkedConvert) {
  final val = _BatchSplitRequestModel(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    sourceBatchNumber: $checkedConvert('sourceBatchNumber', (v) => v as String),
    destinations: $checkedConvert(
      'destinations',
      (v) => (v as List<dynamic>)
          .map(
            (e) => BatchOperationItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$BatchSplitRequestModelToJson(
  _BatchSplitRequestModel instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'sourceBatchNumber': instance.sourceBatchNumber,
  'destinations': instance.destinations.map((e) => e.toJson()).toList(),
  'notes': ?instance.notes,
};
