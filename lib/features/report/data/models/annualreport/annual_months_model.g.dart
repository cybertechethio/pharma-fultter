// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_months_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualMonthsModel _$AnnualMonthsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AnnualMonthsModel', json, ($checkedConvert) {
      final val = _AnnualMonthsModel(
        months: $checkedConvert(
          'months',
          (v) => (v as List<dynamic>)
              .map(
                (e) => AnnualMonthDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AnnualMonthsModelToJson(_AnnualMonthsModel instance) =>
    <String, dynamic>{
      'months': instance.months.map((e) => e.toJson()).toList(),
    };
