import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_item_data.freezed.dart';

@freezed
sealed class CustomerItemData with _$CustomerItemData {
  const factory CustomerItemData({
    required int id,
    required String reference,
    String? code,
    required int customerId,
    required String customerName,
    String? customerImageUrl,
    required int totalOrders,
    required double totalAmount,
    required double paidAmount,
    required double dueAmount,
    required bool hasDiscrepancy,
  }) = _CustomerItemData;
}

