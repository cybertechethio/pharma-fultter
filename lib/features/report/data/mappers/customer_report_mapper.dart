import '../../domain/entities/customerreport/customer_item_data.dart';
import '../../domain/entities/customerreport/customer_summary.dart';
import '../../domain/entities/customerreport/customer_report.dart';
import '../models/customerreport/customer_item_data_model.dart';
import '../models/customerreport/customer_summary_model.dart';
import '../models/customerreport/customer_report_model.dart';

// CustomerItemData Mapper
extension CustomerItemDataMapper on CustomerItemDataModel {
  CustomerItemData toDomain() {
    return CustomerItemData(
      id: id,
      reference: reference,
      code: code,
      customerId: customerId,
      customerName: customerName,
      customerImageUrl: customerImageUrl,
      totalOrders: totalOrders,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      dueAmount: dueAmount,
      hasDiscrepancy: hasDiscrepancy,
    );
  }
}

// CustomerSummary Mapper
extension CustomerSummaryMapper on CustomerSummaryModel {
  CustomerSummary toDomain() {
    return CustomerSummary(
      totalCustomers: totalCustomers,
      totalOrders: totalOrders,
      totalAmount: totalAmount,
      totalPaid: totalPaid,
      totalUnpaid: totalUnpaid,
      totalToPayCustomers: totalToPayCustomers,
      totalCustomersOweUs: totalCustomersOweUs,
      netBalance: netBalance,
    );
  }
}

// CustomerReport Mapper
extension CustomerReportMapper on CustomerReportModel {
  CustomerReport toDomain() {
    return CustomerReport(
      items: items.map((e) => e.toDomain()).toList(),
      summary: summary.toDomain(),
    );
  }
}

