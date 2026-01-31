import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/sub_category.dart';
import '../repositories/sub_category_repository.dart';

class CreateSubCategoryUseCase {
  final SubCategoryRepository _repository;

  CreateSubCategoryUseCase(this._repository);

  Future<Either<Failure, SubCategory>> call({
    required String name,
    required int categoryId,
    required String description,
  }) async {
    return await _repository.createSubCategory(
      name: name,
      categoryId: categoryId,
      description: description,
    );
  }
}

