import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class UpdateBrandUseCase {
  final BrandRepository repository;

  UpdateBrandUseCase(this.repository);

  Future<Either<Failure, BrandEntity>> call({
    required String id,
    required String name,
    required String description,
  }) async {
    return await repository.updateBrand(
      id: id,
      name: name,
      description: description,
    );
  }
}

