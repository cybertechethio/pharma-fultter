import '../../domain/entities/purchasereport/purchase_item_data.dart';
import '../../domain/entities/purchasereport/purchase_summary.dart';
import '../../domain/entities/purchasereport/purchase_report.dart';
import '../models/purchasereport/purchase_item_data_model.dart';
import '../models/purchasereport/purchase_summary_model.dart';
import '../models/purchasereport/purchase_report_model.dart';

// PurchaseItemData Mapper
extension PurchaseItemDataMapper on PurchaseItemDataModel {
  PurchaseItemData toDomain() {
    return PurchaseItemData(
      id: id,
      transactionNumber: transactionNumber,
      date: date,
      supplierId: supplierId,
      supplierName: supplierName,
      itemId: itemId,
      itemName: itemName,
      itemCode: itemCode,
      sku: sku,
      category: category,
      brand: brand,
      imageUrl: imageUrl,
      quantity: quantity,
      unitPrice: unitPrice,
      costPrice: costPrice,
      subtotal: subtotal,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      paymentMethod: paymentMethod,
      branchId: branchId,
      branchName: branchName,
      instockQty: instockQty,
    );
  }
}

// PurchaseSummary Mapper
extension PurchaseSummaryMapper on PurchaseSummaryModel {
  PurchaseSummary toDomain() {
    return PurchaseSummary(
      totalSales: totalSales,
      totalQuantity: totalQuantity,
      totalTax: totalTax,
      totalDiscount: totalDiscount,
      transactionCount: transactionCount,
      averageTransactionValue: averageTransactionValue,
      totalAmount: totalAmount,
      totalPaid: totalPaid,
      totalUnpaid: totalUnpaid,
      overdue: overdue,
    );
  }
}

// PurchaseReport Mapper
extension PurchaseReportMapper on PurchaseReportModel {
  PurchaseReport toDomain() {
    return PurchaseReport(
      items: items.map((e) => e.toDomain()).toList(),
      summary: summary.toDomain(),
    );
  }
}

