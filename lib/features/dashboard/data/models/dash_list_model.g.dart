// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashListModel _$DashListModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DashListModel', json, ($checkedConvert) {
      final val = _DashListModel(
        topSellingProducts: $checkedConvert(
          'topSellingProducts',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    TopSellingProductModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        lowStockProducts: $checkedConvert(
          'lowStockProducts',
          (v) => (v as List<dynamic>)
              .map(
                (e) => LowStockProductModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        topCustomers: $checkedConvert(
          'topCustomers',
          (v) => (v as List<dynamic>)
              .map((e) => TopCustomerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DashListModelToJson(
  _DashListModel instance,
) => <String, dynamic>{
  'topSellingProducts': instance.topSellingProducts
      .map((e) => e.toJson())
      .toList(),
  'lowStockProducts': instance.lowStockProducts.map((e) => e.toJson()).toList(),
  'topCustomers': instance.topCustomers.map((e) => e.toJson()).toList(),
};
