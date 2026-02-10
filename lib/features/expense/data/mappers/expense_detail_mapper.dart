import '../../domain/entities/expense_detail.dart';
import '../models/expense_detail_model.dart';

extension ExpenseDetailMapper on ExpenseDetailModel {
  ExpenseDetail toDomain() {
    return ExpenseDetail(
      id: id,
      expenseDate: expenseDate,
      name: name,
      amount: amount,
      notes: notes,
      attachments: attachments,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      expensePayments: expensePayments.map((payment) => payment.toDomain()).toList(),
    );
  }
}

extension ExpensePaymentMapper on ExpensePaymentModel {
  ExpensePayment toDomain() {
    return ExpensePayment(
      id: id,
      expenseId: expenseId,
      amount: amount,
      createdAt: createdAt,
      paymentMethods: paymentMethods.map((method) => method.toDomain()).toList(),
    );
  }
}

extension ExpensePaymentMethodMapper on ExpensePaymentMethodModel {
  ExpensePaymentMethod toDomain() {
    return ExpensePaymentMethod(
      id: id,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      createdAt: createdAt,
      bankId: bankId,
      bankName: bankName,
      attachment: attachment,
    );
  }
}

