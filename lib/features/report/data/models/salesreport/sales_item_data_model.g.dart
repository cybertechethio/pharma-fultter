// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_item_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesItemDataModel _$SalesItemDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SalesItemDataModel', json, ($checkedConvert) {
      final val = _SalesItemDataModel(
        id: $checkedConvert('id', (v) => JsonTypeConverters.intFromDynamic(v)),
        transactionNumber: $checkedConvert(
          'transactionNumber',
          (v) => v as String,
        ),
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        customerId: $checkedConvert(
          'customerId',
          (v) => JsonTypeConverters.intFromDynamicNullable(v),
        ),
        customerName: $checkedConvert('customerName', (v) => v as String?),
        itemId: $checkedConvert(
          'itemId',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        itemName: $checkedConvert('itemName', (v) => v as String),
        itemCode: $checkedConvert('itemCode', (v) => v as String?),
        sku: $checkedConvert('sku', (v) => v as String?),
        category: $checkedConvert('category', (v) => v as String?),
        brand: $checkedConvert('brand', (v) => v as String?),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
        quantity: $checkedConvert(
          'quantity',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        unitPrice: $checkedConvert(
          'unitPrice',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        costPrice: $checkedConvert(
          'costPrice',
          (v) => JsonTypeConverters.doubleFromDynamicNullable(v),
        ),
        subtotal: $checkedConvert(
          'subtotal',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        taxAmount: $checkedConvert(
          'taxAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalAmount: $checkedConvert(
          'totalAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        paymentMethod: $checkedConvert('paymentMethod', (v) => v as String?),
        branchId: $checkedConvert(
          'branchId',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        branchName: $checkedConvert('branchName', (v) => v as String),
        instockQty: $checkedConvert(
          'instockQty',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SalesItemDataModelToJson(_SalesItemDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionNumber': instance.transactionNumber,
      'date': instance.date.toIso8601String(),
      'customerId': ?instance.customerId,
      'customerName': ?instance.customerName,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemCode': ?instance.itemCode,
      'sku': ?instance.sku,
      'category': ?instance.category,
      'brand': ?instance.brand,
      'imageUrl': ?instance.imageUrl,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'costPrice': ?instance.costPrice,
      'subtotal': instance.subtotal,
      'taxAmount': instance.taxAmount,
      'totalAmount': instance.totalAmount,
      'paymentMethod': ?instance.paymentMethod,
      'branchId': instance.branchId,
      'branchName': instance.branchName,
      'instockQty': instance.instockQty,
    };
