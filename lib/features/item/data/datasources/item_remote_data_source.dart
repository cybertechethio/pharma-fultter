import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/item_model.dart';

abstract class ItemRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<ItemModel>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  });

  Future<Either<Failure, ItemModel>> createItem({
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
  });

  Future<Either<Failure, ItemModel>> updateItem({
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
  });

  Future<Either<Failure, ItemModel>> deleteItem({
    required String id,
  });
}

