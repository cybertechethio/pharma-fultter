// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerSummaryModel _$CustomerSummaryModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CustomerSummaryModel', json, ($checkedConvert) {
  final val = _CustomerSummaryModel(
    totalCustomers: $checkedConvert(
      'totalCustomers',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    totalOrders: $checkedConvert(
      'totalOrders',
      (v) => JsonTypeConverters.intFromDynamic(v),
    ),
    totalAmount: $checkedConvert(
      'totalAmount',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalPaid: $checkedConvert(
      'totalPaid',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalUnpaid: $checkedConvert(
      'totalUnpaid',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalToPayCustomers: $checkedConvert(
      'totalToPayCustomers',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    totalCustomersOweUs: $checkedConvert(
      'totalCustomersOweUs',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    netBalance: $checkedConvert(
      'netBalance',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$CustomerSummaryModelToJson(
  _CustomerSummaryModel instance,
) => <String, dynamic>{
  'totalCustomers': instance.totalCustomers,
  'totalOrders': instance.totalOrders,
  'totalAmount': instance.totalAmount,
  'totalPaid': instance.totalPaid,
  'totalUnpaid': instance.totalUnpaid,
  'totalToPayCustomers': instance.totalToPayCustomers,
  'totalCustomersOweUs': instance.totalCustomersOweUs,
  'netBalance': instance.netBalance,
};
