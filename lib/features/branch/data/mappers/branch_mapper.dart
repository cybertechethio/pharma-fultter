import '../../domain/entities/branch.dart';
import '../models/branch_model.dart';

extension BranchModelMapper on BranchModel {
  Branch toDomain() => Branch(
    id: id,
    name: name,
    companyId: companyId,
    isActive: isActive,
    createdAt: createdAt,
    createdBy: createdBy,
    updatedBy: updatedBy,
  );
}

extension BranchMapper on Branch {
  BranchModel toModel() => BranchModel(
    id: id,
    name: name,
    companyId: companyId,
    isActive: isActive,
    createdAt: createdAt,
    createdBy: createdBy,
    updatedBy: updatedBy,
  );
}
