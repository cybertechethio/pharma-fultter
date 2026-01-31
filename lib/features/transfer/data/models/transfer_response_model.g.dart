// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferResponseModel _$TransferResponseModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransferResponseModel', json, ($checkedConvert) {
  final val = _TransferResponseModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    companyId: $checkedConvert('companyId', (v) => (v as num?)?.toInt()),
    transferType: $checkedConvert('transferType', (v) => v as String),
    transferNumber: $checkedConvert('transferNumber', (v) => v as String),
    sourceBranchId: $checkedConvert(
      'sourceBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    relatedTransferId: $checkedConvert(
      'relatedTransferId',
      (v) => (v as num?)?.toInt(),
    ),
    status: $checkedConvert('status', (v) => v as String),
    notes: $checkedConvert('notes', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    sourceBranchName: $checkedConvert('sourceBranchName', (v) => v as String?),
    destinationBranchName: $checkedConvert(
      'destinationBranchName',
      (v) => v as String?,
    ),
    relatedTransfer: $checkedConvert(
      'relatedTransfer',
      (v) => v == null
          ? null
          : TransferResponseModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$TransferResponseModelToJson(
  _TransferResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'companyId': ?instance.companyId,
  'transferType': instance.transferType,
  'transferNumber': instance.transferNumber,
  'sourceBranchId': ?instance.sourceBranchId,
  'destinationBranchId': ?instance.destinationBranchId,
  'relatedTransferId': ?instance.relatedTransferId,
  'status': instance.status,
  'notes': ?instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'createdBy': ?instance.createdBy,
  'updatedBy': ?instance.updatedBy,
  'sourceBranchName': ?instance.sourceBranchName,
  'destinationBranchName': ?instance.destinationBranchName,
  'relatedTransfer': ?instance.relatedTransfer?.toJson(),
};
