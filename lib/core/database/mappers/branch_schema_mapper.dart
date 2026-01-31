import 'package:cyber_pos/features/branch/domain/entities/branch.dart';
import '../schemas/branch_schema.dart';

extension BranchSchemaMapper on BranchSchema {
  Branch toDomain() => Branch(
    id: branchId,
    name: name,
    companyId: companyId,
    isActive: isActive,
    createdAt: createdAt,
    createdBy: createdBy,
    updatedBy: updatedBy,
  );
}

extension BranchToSchemaMapper on Branch {
  BranchSchema toSchema() => BranchSchema()
    ..branchId = id
    ..name = name
    ..companyId = companyId
    ..isActive = isActive
    ..createdAt = createdAt
    ..createdBy = createdBy
    ..updatedBy = updatedBy;
}

