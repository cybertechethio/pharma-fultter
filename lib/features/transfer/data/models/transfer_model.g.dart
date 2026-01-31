// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TransferModel', json, ($checkedConvert) {
      final val = _TransferModel(
        destinationBranchId: $checkedConvert(
          'destinationBranchId',
          (v) => (v as num).toInt(),
        ),
        relatedTransferId: $checkedConvert(
          'relatedTransferId',
          (v) => (v as num?)?.toInt(),
        ),
        notes: $checkedConvert('notes', (v) => v as String?),
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => TransferItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransferModelToJson(_TransferModel instance) =>
    <String, dynamic>{
      'destinationBranchId': instance.destinationBranchId,
      'relatedTransferId': ?instance.relatedTransferId,
      'notes': ?instance.notes,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
