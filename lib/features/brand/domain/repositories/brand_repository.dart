import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/brand.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<BrandEntity>>> getBrands({
    String? search,
  });
  Future<Either<Failure, BrandEntity>> createBrand({
    required String name,
    required String description,
  });
  Future<Either<Failure, BrandEntity>> updateBrand({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, BrandEntity>> deleteBrand({required String id});
}

