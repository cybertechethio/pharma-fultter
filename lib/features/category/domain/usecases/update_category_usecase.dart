import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class UpdateCategoryUseCase {
  final CategoryRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<Either<Failure, Category>> call({
    required String id,
    required String name,
    required String description,
  }) async {
    return await _repository.updateCategory(
      id: id,
      name: name,
      description: description,
    );
  }
}

