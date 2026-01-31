import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/brand_model.dart';

abstract class BrandRemoteDataSource {
  Future<Either<Failure, List<BrandModel>>> getBrands({
    String? search,
  });
  Future<Either<Failure, BrandModel>> createBrand({
    required String name,
    required String description,
  });
  Future<Either<Failure, BrandModel>> updateBrand({
    required String id,
    required String name,
    required String description,
  });
  Future<Either<Failure, BrandModel>> deleteBrand({required String id});
}

