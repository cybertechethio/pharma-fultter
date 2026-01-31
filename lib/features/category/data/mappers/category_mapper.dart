import '../../domain/entities/category.dart';
import '../models/category_model.dart';

extension CategoryMapper on CategoryModel {
  Category toDomain() {
    return Category(
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

