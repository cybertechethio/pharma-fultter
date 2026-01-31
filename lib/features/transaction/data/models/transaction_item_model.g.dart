// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionItemModel _$TransactionItemModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TransactionItemModel', json, ($checkedConvert) {
  final val = _TransactionItemModel(
    itemId: $checkedConvert('itemId', (v) => (v as num).toInt()),
    taxRate: $checkedConvert('taxRate', (v) => (v as num).toInt()),
    batches: $checkedConvert(
      'batches',
      (v) => (v as List<dynamic>)
          .map((e) => TransactionBatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$TransactionItemModelToJson(
  _TransactionItemModel instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'taxRate': instance.taxRate,
  'batches': instance.batches.map((e) => e.toJson()).toList(),
};
