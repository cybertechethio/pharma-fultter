import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';

class GetItemsUseCase {
  final ItemRepository _repository;

  GetItemsUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<Item>>> call({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  }) async {
    return await _repository.getItems(
      page: page,
      limit: limit,
      search: search,
      categoryId: categoryId,
    );
  }
}

