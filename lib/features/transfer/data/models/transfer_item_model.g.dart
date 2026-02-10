// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferItemModel _$TransferItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransferItemModel', json, ($checkedConvert) {
      final val = _TransferItemModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        itemName: $checkedConvert('itemName', (v) => v as String?),
        itemCode: $checkedConvert('itemCode', (v) => v as String?),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        transferItemBatches: $checkedConvert(
          'transferItemBatches',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => TransferItemBatchModel.fromJson(
                      e as Map<String, dynamic>,
                    ),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransferItemModelToJson(_TransferItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': ?instance.itemName,
      'itemCode': ?instance.itemCode,
      'quantity': instance.quantity,
      'transferItemBatches': instance.transferItemBatches
          .map((e) => e.toJson())
          .toList(),
    };
