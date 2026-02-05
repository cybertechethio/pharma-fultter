import '../../domain/entities/salesreport/sales_item_data.dart';
import '../../domain/entities/salesreport/sales_summary.dart';
import '../../domain/entities/salesreport/sales_report.dart';
import '../models/salesreport/sales_item_data_model.dart';
import '../models/salesreport/sales_summary_model.dart';
import '../models/salesreport/sales_report_model.dart';

// SalesItemData Mapper
extension SalesItemDataMapper on SalesItemDataModel {
  SalesItemData toDomain() {
    return SalesItemData(
      id: id,
      transactionNumber: transactionNumber,
      date: date,
      customerId: customerId,
      customerName: customerName,
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

// SalesSummary Mapper
extension SalesSummaryMapper on SalesSummaryModel {
  SalesSummary toDomain() {
    return SalesSummary(
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

// SalesReport Mapper
extension SalesReportMapper on SalesReportModel {
  SalesReport toDomain() {
    return SalesReport(
      items: items.map((e) => e.toDomain()).toList(),
      summary: summary.toDomain(),
    );
  }
}

