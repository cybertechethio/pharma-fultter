import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/item_with_batches.dart';
import '../repositories/item_repository.dart';

class GetItemsIncludeBatchesUseCase {
  final ItemRepository _repository;

  GetItemsIncludeBatchesUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<ItemWithBatches>>> call({
    int page = 1,
    int limit = 1000,
    String? search,
    int? categoryId,
  }) async {
    return await _repository.getItemsIncludeBatches(
      page: page,
      limit: limit,
      search: search,
      categoryId: categoryId,
    );
  }
}
