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
    companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
    transferType: $checkedConvert('transferType', (v) => v as String),
    transferNumber: $checkedConvert('transferNumber', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    sourceBranchId: $checkedConvert(
      'sourceBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    sourceBranch: $checkedConvert('sourceBranch', (v) => v as String?),
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    destinationBranch: $checkedConvert(
      'destinationBranch',
      (v) => v as String?,
    ),
    relatedTransferId: $checkedConvert(
      'relatedTransferId',
      (v) => (v as num?)?.toInt(),
    ),
    transferId: $checkedConvert('transferId', (v) => (v as num?)?.toInt()),
    notes: $checkedConvert('notes', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    creatorName: $checkedConvert('creatorName', (v) => v as String?),
    updatorName: $checkedConvert('updatorName', (v) => v as String?),
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
      'companyId': instance.companyId,
      'transferType': instance.transferType,
      'transferNumber': instance.transferNumber,
      'status': instance.status,
      'sourceBranchId': ?instance.sourceBranchId,
      'sourceBranch': ?instance.sourceBranch,
      'destinationBranchId': ?instance.destinationBranchId,
      'destinationBranch': ?instance.destinationBranch,
      'relatedTransferId': ?instance.relatedTransferId,
      'transferId': ?instance.transferId,
      'notes': ?instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'creatorName': ?instance.creatorName,
      'updatorName': ?instance.updatorName,
      'transferItems': instance.transferItems.map((e) => e.toJson()).toList(),
    };
