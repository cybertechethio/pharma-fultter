import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/sub_category.dart';

abstract class SubCategoryRepository {
  Future<Either<Failure, PaginatedResponse<SubCategory>>> getSubCategories({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, PaginatedResponse<SubCategory>>> getSubCategoriesByCategory({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, SubCategory>> createSubCategory({
    required String name,
    required int categoryId,
    required String description,
  });

  Future<Either<Failure, SubCategory>> updateSubCategory({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  });

  Future<Either<Failure, SubCategory>> deleteSubCategory({
    required String id,
  });
}

