import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/item.dart';
import '../../data/models/item_request_model.dart';

abstract class ItemRepository {
  Future<Either<Failure, PaginatedResponse<Item>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  });

  Future<Either<Failure, Item>> createItem(ItemRequestModel request);

  Future<Either<Failure, Item>> updateItem({
    required int id,
    required ItemRequestModel request,
  });

  Future<Either<Failure, Item>> deleteItem({
    required int id,
  });
}

