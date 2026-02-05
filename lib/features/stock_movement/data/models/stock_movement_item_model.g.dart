// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockMovementItemModel _$StockMovementItemModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_StockMovementItemModel', json, ($checkedConvert) {
  final val = _StockMovementItemModel(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    code: $checkedConvert('code', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$StockMovementItemModelToJson(
  _StockMovementItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': ?instance.code,
};
