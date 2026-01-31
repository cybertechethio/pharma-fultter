import '../../domain/entities/unit.dart';
import '../models/unit_model.dart';

extension UnitMapper on UnitModel {
  UnitEntity toDomain() {
    return UnitEntity(
      id: id,
      companyId: companyId,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

