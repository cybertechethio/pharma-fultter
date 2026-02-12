import '../../domain/entities/trans_item_batch.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/trans_item.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/payment_method.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../models/trans_item_batch_model.dart';
import '../models/transaction_model.dart';
import '../models/trans_item_model.dart';
import '../models/payment_model.dart';
import '../models/payment_method_model.dart';

/// Extension for mapping PaymentMethodModel to PaymentMethod entity
extension PaymentMethodModelMapper on PaymentMethodModel {
  PaymentMethod toDomain() {
    return PaymentMethod(
      id: id,
      method: PaymentMethodTypeExtension.fromString(method),
      amount: amount,
      bankId: bankId,
      bankName: bankName,
      referenceNumber: referenceNumber,
      attachment: attachment,
    );
  }
}

/// Extension for mapping PaymentModel to Payment entity
extension PaymentModelMapper on PaymentModel {
  Payment toDomain() {
    return Payment(
      id: id,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      paymentType: paymentType,
      notes: notes,
      paymentMethods: paymentMethods.map((pm) => pm.toDomain()).toList(),
    );
  }
}

/// Extension for mapping TransItemModel to TransItem entity
extension TransItemModelMapper on TransItemModel {
  TransItem toDomain() {
    return TransItem(
      id: id,
      itemName: itemName,
      itemCode: itemCode,
      quantity: quantity,
      batches: batches.map((batch) => batch.toDomain()).toList(),
    );
  }
}

/// Extension for mapping TransItemBatchModel to TransItemBatch entity
extension TransItemBatchModelMapper on TransItemBatchModel {
  TransItemBatch toDomain() {
    return TransItemBatch(
      id: id,
      transactionItemId: transactionItemId,
      batchNumber: batchNumber,
      quantity: quantity,
      costPrice: costPrice,
      unitPrice: unitPrice,
      expirationDate: expirationDate,
    );
  }
}

/// Extension for mapping TransactionModel to Transaction entity
extension TransactionModelMapper on TransactionModel {
  Transaction toDomain() {
    return Transaction(
      id: id,
      transactionType: TransactionTypeExtension.fromString(transactionType),
      transactionNumber: transactionNumber,
      status: status,
      supplierId: supplierId,
      customerId: customerId,
      supplierName: supplierName,
      customerName: customerName,
      subtotal: subtotal,
      totalTax: totalTax,
      totalAmount: totalAmount,
      notes: notes,
      attachments: attachments,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      creatorName: creatorName,
      updatorName: updatorName,
      items: items.map((item) => item.toDomain()).toList(),
      payment: payment?.toDomain(),
      refund: refund?.toDomain(),
    );
  }
}
