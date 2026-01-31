import '../../domain/entities/model.dart';
import '../models/model_model.dart';

extension ModelMapper on ModelModel {
  ModelEntity toDomain() {
    return ModelEntity(
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

