import '../../domain/entities/bank.dart';
import '../models/bank_model.dart';

extension BankMapper on BankModel {
  BankEntity toDomain() {
    return BankEntity(
      id: id,
      companyId: companyId,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

