import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';

class DeleteItemUseCase {
  final ItemRepository _repository;

  DeleteItemUseCase(this._repository);

  Future<Either<Failure, Item>> call({
    required int id,
  }) async {
    return await _repository.deleteItem(id: id);
  }
}

