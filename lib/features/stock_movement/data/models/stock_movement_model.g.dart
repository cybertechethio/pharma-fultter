// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockMovementModel _$StockMovementModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StockMovementModel', json, ($checkedConvert) {
  final val = _StockMovementModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    companyId: $checkedConvert('companyId', (v) => (v as num).toInt()),
    branchId: $checkedConvert('branchId', (v) => (v as num).toInt()),
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    transactionId: $checkedConvert(
      'transactionId',
      (v) => (v as num?)?.toInt(),
    ),
    type: $checkedConvert('type', (v) => _typeFromJson(v)),
    quantity: $checkedConvert('quantity', (v) => v as String),
    previousStock: $checkedConvert('previousStock', (v) => v as String?),
    newStock: $checkedConvert('newStock', (v) => v as String?),
    sourceBranchId: $checkedConvert(
      'sourceBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num?)?.toInt(),
    ),
    transferId: $checkedConvert('transferId', (v) => (v as num?)?.toInt()),
    reversesMovementId: $checkedConvert(
      'reversesMovementId',
      (v) => (v as num?)?.toInt(),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
    status: $checkedConvert('status', (v) => _statusFromJson(v)),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    createdBy: $checkedConvert('createdBy', (v) => (v as num?)?.toInt()),
    updatedBy: $checkedConvert('updatedBy', (v) => (v as num?)?.toInt()),
    creatorName: $checkedConvert('creatorName', (v) => v as String?),
    updaterName: $checkedConvert('updaterName', (v) => v as String?),
    sourceBranchName: $checkedConvert('sourceBranchName', (v) => v as String?),
    destinationBranchName: $checkedConvert(
      'destinationBranchName',
      (v) => v as String?,
    ),
    item: $checkedConvert(
      'item',
      (v) => v == null
          ? null
          : StockMovementItemModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$StockMovementModelToJson(_StockMovementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'itemId': instance.itemId,
      'transactionId': ?instance.transactionId,
      'type': _$StockMovementTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'previousStock': ?instance.previousStock,
      'newStock': ?instance.newStock,
      'sourceBranchId': ?instance.sourceBranchId,
      'destinationBranchId': ?instance.destinationBranchId,
      'transferId': ?instance.transferId,
      'reversesMovementId': ?instance.reversesMovementId,
      'notes': ?instance.notes,
      'status': _$StockMovementStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdBy': ?instance.createdBy,
      'updatedBy': ?instance.updatedBy,
      'creatorName': ?instance.creatorName,
      'updaterName': ?instance.updaterName,
      'sourceBranchName': ?instance.sourceBranchName,
      'destinationBranchName': ?instance.destinationBranchName,
      'item': ?instance.item?.toJson(),
    };

const _$StockMovementTypeEnumMap = {
  StockMovementType.purchase: 'purchase',
  StockMovementType.sale: 'sale',
  StockMovementType.transferIn: 'transferIn',
  StockMovementType.transferInReturn: 'transferInReturn',
  StockMovementType.transferOut: 'transferOut',
  StockMovementType.transferOutReturn: 'transferOutReturn',
  StockMovementType.using: 'using',
  StockMovementType.adjustment: 'adjustment',
  StockMovementType.waste: 'waste',
  StockMovementType.damage: 'damage',
  StockMovementType.purchaseReverse: 'purchaseReverse',
  StockMovementType.saleReverse: 'saleReverse',
  StockMovementType.producing: 'producing',
};

const _$StockMovementStatusEnumMap = {
  StockMovementStatus.completed: 'completed',
  StockMovementStatus.reversed: 'reversed',
};
