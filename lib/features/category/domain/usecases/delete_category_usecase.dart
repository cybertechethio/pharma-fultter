import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class DeleteCategoryUseCase {
  final CategoryRepository _repository;

  DeleteCategoryUseCase(this._repository);

  Future<Either<Failure, Category>> call({
    required String id,
  }) async {
    return await _repository.deleteCategory(id: id);
  }
}

