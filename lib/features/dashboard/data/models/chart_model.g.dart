// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartModel _$ChartModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ChartModel', json, ($checkedConvert) {
      final val = _ChartModel(
        salesPurchase: $checkedConvert(
          'salesPurchase',
          (v) => ChartSalesPerchaseModel.fromJson(v as Map<String, dynamic>),
        ),
        customer: $checkedConvert(
          'customer',
          (v) => ChartCustomerModel.fromJson(v as Map<String, dynamic>),
        ),
        salesStatistics: $checkedConvert(
          'salesStatistics',
          (v) => ChartSalesStatisticsModel.fromJson(v as Map<String, dynamic>),
        ),
        heatmap: $checkedConvert(
          'heatmap',
          (v) => ChartHeatmapModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChartModelToJson(_ChartModel instance) =>
    <String, dynamic>{
      'salesPurchase': instance.salesPurchase.toJson(),
      'customer': instance.customer.toJson(),
      'salesStatistics': instance.salesStatistics.toJson(),
      'heatmap': instance.heatmap.toJson(),
    };
