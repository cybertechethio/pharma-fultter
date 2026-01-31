// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferItemModel _$TransferItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransferItemModel', json, ($checkedConvert) {
      final val = _TransferItemModel(
        itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
        batches: $checkedConvert(
          'batches',
          (v) => (v as List<dynamic>)
              .map(
                (e) => TransferBatchModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransferItemModelToJson(_TransferItemModel instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'batches': instance.batches.map((e) => e.toJson()).toList(),
    };
