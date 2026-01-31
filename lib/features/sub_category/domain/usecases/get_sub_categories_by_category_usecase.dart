import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/sub_category.dart';
import '../repositories/sub_category_repository.dart';

class GetSubCategoriesByCategoryUseCase {
  final SubCategoryRepository _repository;

  GetSubCategoriesByCategoryUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<SubCategory>>> call({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    return await _repository.getSubCategoriesByCategory(
      categoryId: categoryId,
      page: page,
      limit: limit,
      search: search,
    );
  }
}

