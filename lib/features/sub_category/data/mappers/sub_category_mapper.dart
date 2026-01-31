import '../../domain/entities/sub_category.dart';
import '../models/sub_category_model.dart';

extension SubCategoryMapper on SubCategoryModel {
  SubCategory toDomain() {
    return SubCategory(
      id: id,
      companyId: companyId,
      categoryId: categoryId,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }
}

