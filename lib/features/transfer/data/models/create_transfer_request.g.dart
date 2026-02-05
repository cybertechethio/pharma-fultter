// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransferItemRequest _$CreateTransferItemRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransferItemRequest', json, ($checkedConvert) {
  final val = _CreateTransferItemRequest(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    quantity: $checkedConvert(
      'quantity',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CreateTransferItemRequestToJson(
  _CreateTransferItemRequest instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'quantity': instance.quantity,
};

_CreateTransferRequest _$CreateTransferRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CreateTransferRequest', json, ($checkedConvert) {
  final val = _CreateTransferRequest(
    transferType: $checkedConvert(
      'transferType',
      (v) => $enumDecode(_$TransferTypeEnumMap, v),
    ),
    destinationBranchId: $checkedConvert(
      'destinationBranchId',
      (v) => (v as num?)?.toInt(),
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
  'transferType': _$TransferTypeEnumMap[instance.transferType]!,
  'destinationBranchId': ?instance.destinationBranchId,
  'notes': ?instance.notes,
  'items': instance.items.map((e) => e.toJson()).toList(),
};

const _$TransferTypeEnumMap = {
  TransferType.transferOut: 'transferOut',
  TransferType.transferIn: 'transferIn',
  TransferType.transferInReturn: 'transferInReturn',
  TransferType.transferOutReturn: 'transferOutReturn',
};
