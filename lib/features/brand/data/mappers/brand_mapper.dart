import '../../domain/entities/brand.dart';
import '../models/brand_model.dart';

extension BrandMapper on BrandModel {
  BrandEntity toDomain() {
    return BrandEntity(
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

