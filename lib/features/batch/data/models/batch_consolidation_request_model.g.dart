// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_consolidation_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchConsolidationRequestModel _$BatchConsolidationRequestModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BatchConsolidationRequestModel', json, ($checkedConvert) {
  final val = _BatchConsolidationRequestModel(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    destinationBatchNumber: $checkedConvert(
      'destinationBatchNumber',
      (v) => v as String,
    ),
    sources: $checkedConvert(
      'sources',
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

Map<String, dynamic> _$BatchConsolidationRequestModelToJson(
  _BatchConsolidationRequestModel instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'destinationBatchNumber': instance.destinationBatchNumber,
  'sources': instance.sources.map((e) => e.toJson()).toList(),
  'notes': ?instance.notes,
};
