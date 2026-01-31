import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_remote_data_source.dart';
import '../mappers/item_mapper.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource _remoteDataSource;

  ItemRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Item>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  }) async {
    final result = await _remoteDataSource.getItems(
      page: page,
      limit: limit,
      search: search,
      categoryId: categoryId,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, Item>> createItem({
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
    final response = await _remoteDataSource.createItem(
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

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Item>> updateItem({
    required String id,
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
    final response = await _remoteDataSource.updateItem(
      id: id,
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

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Item>> deleteItem({
    required String id,
  }) async {
    final response = await _remoteDataSource.deleteItem(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

