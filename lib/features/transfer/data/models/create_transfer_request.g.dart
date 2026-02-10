// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransferBatchRequest _$CreateTransferBatchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransferBatchRequest', json, ($checkedConvert) {
  final val = _CreateTransferBatchRequest(
    batchNumber: $checkedConvert('batchNumber', (v) => v as String),
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$CreateTransferBatchRequestToJson(
  _CreateTransferBatchRequest instance,
) => <String, dynamic>{
  'batchNumber': instance.batchNumber,
  'quantity': instance.quantity,
};

_CreateTransferItemRequest _$CreateTransferItemRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransferItemRequest', json, ($checkedConvert) {
  final val = _CreateTransferItemRequest(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    batches: $checkedConvert(
      'batches',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                CreateTransferBatchRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransferItemRequestToJson(
  _CreateTransferItemRequest instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'batches': instance.batches.map((e) => e.toJson()).toList(),
};

_CreateTransferRequest _$CreateTransferRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransferRequest', json, ($checkedConvert) {
  final val = _CreateTransferRequest(
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num).toInt(),
    ),
    notes: $checkedConvert('notes', (v) => v as String?),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                CreateTransferItemRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransferRequestToJson(
  _CreateTransferRequest instance,
) => <String, dynamic>{
  'destinationBranchId': instance.destinationBranchId,
  'notes': ?instance.notes,
  'items': instance.items.map((e) => e.toJson()).toList(),
};
