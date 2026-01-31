import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<Category>>> call({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    return await _repository.getCategories(page: page, limit: limit, search: search);
  }
}

