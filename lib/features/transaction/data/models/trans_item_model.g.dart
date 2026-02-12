// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransItemModel _$TransItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransItemModel', json, ($checkedConvert) {
      final val = _TransItemModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        itemName: $checkedConvert('itemName', (v) => v as String),
        itemCode: $checkedConvert('itemCode', (v) => v as String),
        quantity: $checkedConvert(
          'quantity',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        batches: $checkedConvert(
          'batches',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        TransItemBatchModel.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransItemModelToJson(_TransItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'itemCode': instance.itemCode,
      'quantity': instance.quantity,
      'batches': instance.batches.map((e) => e.toJson()).toList(),
    };
