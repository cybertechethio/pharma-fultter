import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class CreateBrandUseCase {
  final BrandRepository repository;

  CreateBrandUseCase(this.repository);

  Future<Either<Failure, BrandEntity>> call({
    required String name,
    required String description,
  }) async {
    return await repository.createBrand(
      name: name,
      description: description,
    );
  }
}

