import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_data.dart';
import '../../domain/entities/transaction_item.dart';
import '../../domain/entities/transaction_batch.dart';
import '../../domain/entities/transaction_payment.dart';
import '../../domain/entities/transaction_detail.dart';
import '../../domain/entities/payment_detail.dart';
import '../../domain/entities/payment_method_detail.dart';
import '../../domain/entities/transaction_item_detail.dart';
import '../../domain/entities/transaction_item_batch_detail.dart';
import '../models/transaction_response_model.dart';
import '../models/transaction_model.dart';
import '../models/transaction_item_model.dart';
import '../models/transaction_batch_model.dart';
import '../models/transaction_payment_model.dart';
import '../models/transaction_detail_response_model.dart';
import '../models/payment_detail_model.dart';
import '../models/payment_method_detail_model.dart';
import '../models/transaction_item_detail_model.dart';
import '../models/transaction_item_batch_detail_model.dart';

// Response Model → Domain Entity
extension TransactionMapper on TransactionResponseModel {
  Transaction toDomain() {
    return Transaction(
      id: id,
      transactionType: transactionType,
      transactionNumber: transactionNumber,
      status: status,
      subtotal: subtotal,
      totalTax: totalTax,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: createdAt,
      creatorName: creatorName,
      supplierName: supplierName,
      customerName: customerName,
    );
  }
}

// Domain Entity → Model
extension TransactionBatchToModel on TransactionBatch {
  TransactionBatchModel toModel() {
    return TransactionBatchModel(
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
    );
  }
}

extension TransactionItemToModel on TransactionItem {
  TransactionItemModel toModel() {
    return TransactionItemModel(
      itemId: itemId,
      taxRate: taxRate.toInt(), // Convert double to int for API
      batches: batches.map((b) => b.toModel()).toList(),
    );
  }
}

extension TransactionPaymentToModel on TransactionPayment {
  TransactionPaymentModel toModel() {
    return TransactionPaymentModel(
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
    );
  }
}

extension TransactionDataToModel on TransactionData {
  TransactionModel toModel() {
    return TransactionModel(
      transactionType: transactionType,
      supplierId: supplierId,
      customerId: customerId,
      notes: notes,
      items: items.map((i) => i.toModel()).toList(),
      paymentMethods: paymentMethods?.map((p) => p.toModel()).toList(),
    );
  }
}

// Detail Response Model → Domain Entity
extension PaymentMethodDetailMapper on PaymentMethodDetailModel {
  PaymentMethodDetail toDomain() {
    return PaymentMethodDetail(
      id: id,
      method: method,
      amount: amount,
      attachment: attachment,
      referenceNumber: referenceNumber,
      bankName: bankName,
    );
  }
}

extension PaymentDetailMapper on PaymentDetailModel {
  PaymentDetail toDomain() {
    return PaymentDetail(
      id: id,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      paymentType: paymentType,
      createdAt: createdAt,
      paymentMethods: paymentMethods.map((pm) => pm.toDomain()).toList(),
    );
  }
}

extension TransactionItemBatchDetailMapper on TransactionItemBatchDetailModel {
  TransactionItemBatchDetail toDomain() {
    return TransactionItemBatchDetail(
      id: id,
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
      taxableAmount: taxableAmount,
      taxAmount: taxAmount,
      total: total,
      expirationDate: expirationDate,
      allocatedFrom: allocatedFrom,
      createdAt: createdAt,
    );
  }
}

extension TransactionItemDetailMapper on TransactionItemDetailModel {
  TransactionItemDetail toDomain() {
    return TransactionItemDetail(
      id: id,
      itemId: itemId,
      itemName: itemName,
      itemCode: itemCode,
      quantity: quantity,
      taxRate: taxRate,
      total: total,
      createdAt: createdAt,
      batches: batches.map((b) => b.toDomain()).toList(),
    );
  }
}

extension TransactionDetailMapper on TransactionDetailResponseModel {
  TransactionDetail toDomain() {
    // Convert to Transaction entity first
    final transaction = Transaction(
      id: id,
      transactionType: transactionType,
      transactionNumber: transactionNumber,
      status: status,
      subtotal: subtotal,
      totalTax: totalTax,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: createdAt,
      creatorName: creatorName,
      supplierName: supplierName,
      customerName: customerName,
    );

    return TransactionDetail(
      transaction: transaction,
      attachments: attachments,
      payment: payment?.toDomain(),
      transactionItems: transactionItems.map((item) => item.toDomain()).toList(),
    );
  }
}

