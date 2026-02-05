import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/purchasereport/purchase_report.dart';
import '../repositories/report_repository.dart';

class GetPurchaseReportUseCase {
  final ReportRepository repository;

  GetPurchaseReportUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<PurchaseReport>>> call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? supplierId,
    String? status,
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getPurchaseReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      supplierId: supplierId,
      status: status,
      page: page,
      limit: limit,
    );
  }
}

