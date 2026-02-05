import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bestsellerreport/best_seller.dart';
import '../repositories/report_repository.dart';

class GetBestSellerReportUseCase {
  final ReportRepository repository;

  GetBestSellerReportUseCase(this.repository);

  Future<Either<Failure, List<BestSeller>>> call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int limit = 25,
  }) async {
    return await repository.getBestSellerReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      limit: limit,
    );
  }
}

