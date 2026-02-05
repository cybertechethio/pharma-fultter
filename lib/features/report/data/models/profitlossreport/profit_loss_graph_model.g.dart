// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_graph_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossGraphModel _$ProfitLossGraphModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossGraphModel', json, ($checkedConvert) {
  final val = _ProfitLossGraphModel(
    granularity: $checkedConvert('granularity', (v) => v as String),
    days: $checkedConvert(
      'days',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ProfitLossDayDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    weeks: $checkedConvert(
      'weeks',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ProfitLossWeekDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    months: $checkedConvert(
      'months',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ProfitLossMonthDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ProfitLossGraphModelToJson(
  _ProfitLossGraphModel instance,
) => <String, dynamic>{
  'granularity': instance.granularity,
  'days': ?instance.days?.map((e) => e.toJson()).toList(),
  'weeks': ?instance.weeks?.map((e) => e.toJson()).toList(),
  'months': ?instance.months?.map((e) => e.toJson()).toList(),
};
