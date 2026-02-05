import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_item_data.freezed.dart';

@freezed
sealed class SalesItemData with _$SalesItemData {
  const factory SalesItemData({
    required int id,
    required String transactionNumber,
    required DateTime date,
    required int? customerId,
    required String? customerName,
    required int itemId,
    required String itemName,
    String? itemCode,
    String? sku,
    String? category,
    String? brand,
    String? imageUrl,
    required int quantity,
    required double unitPrice,
    double? costPrice,
    required double subtotal,
    required double taxAmount,
    required double totalAmount,
    String? paymentMethod,
    required int branchId,
    required String branchName,
    required int instockQty,
  }) = _SalesItemData;
}

