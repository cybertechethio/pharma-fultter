// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferModel _$TransferModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransferModel', json, ($checkedConvert) {
  final val = _TransferModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    transferNumber: $checkedConvert('transferNumber', (v) => v as String),
    sourceBranchId: $checkedConvert(
      'sourceBranchId',
      (v) => (v as num).toInt(),
    ),
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num).toInt(),
    ),
    status: $checkedConvert('status', (v) => v as String),
    notes: $checkedConvert('notes', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    sourceBranchName: $checkedConvert('sourceBranchName', (v) => v as String?),
    destinationBranchName: $checkedConvert(
      'destinationBranchName',
      (v) => v as String?,
    ),
    creatorName: $checkedConvert('creatorName', (v) => v as String?),
    updaterName: $checkedConvert('updaterName', (v) => v as String?),
    transferItems: $checkedConvert(
      'transferItems',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => TransferItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$TransferModelToJson(_TransferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transferNumber': instance.transferNumber,
      'sourceBranchId': instance.sourceBranchId,
      'destinationBranchId': instance.destinationBranchId,
      'status': instance.status,
      'notes': ?instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'sourceBranchName': ?instance.sourceBranchName,
      'destinationBranchName': ?instance.destinationBranchName,
      'creatorName': ?instance.creatorName,
      'updaterName': ?instance.updaterName,
      'transferItems': instance.transferItems.map((e) => e.toJson()).toList(),
    };
