import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';

class CreateItemUseCase {
  final ItemRepository _repository;

  CreateItemUseCase(this._repository);

  Future<Either<Failure, Item>> call({
    required String name,
    required String description,
    required String sku,
    required String code,
    required String barcode,
    required String color,
    required String size,
    required String material,
    required double weight,
    required bool isTaxable,
    required int taxRate,
    required bool isActive,
    String? imageUrl,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? unitId,
    int? modelId,
  }) async {
    return await _repository.createItem(
      name: name,
      description: description,
      sku: sku,
      code: code,
      barcode: barcode,
      color: color,
      size: size,
      material: material,
      weight: weight,
      isTaxable: isTaxable,
      taxRate: taxRate,
      isActive: isActive,
      imageUrl: imageUrl,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      brandId: brandId,
      unitId: unitId,
      modelId: modelId,
    );
  }
}

