import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, PaginatedResponse<Category>>> getCategories({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, Category>> createCategory({
    required String name,
    required String description,
  });

  Future<Either<Failure, Category>> updateCategory({
    required String id,
    required String name,
    required String description,
  });

  Future<Either<Failure, Category>> deleteCategory({
    required String id,
  });
}

