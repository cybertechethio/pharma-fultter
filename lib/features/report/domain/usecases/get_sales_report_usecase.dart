import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/salesreport/sales_report.dart';
import '../repositories/report_repository.dart';

class GetSalesReportUseCase {
  final ReportRepository repository;

  GetSalesReportUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<SalesReport>>> call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? productId,
    int? categoryId,
    int? customerId,
    String? status,
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getSalesReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      productId: productId,
      categoryId: categoryId,
      customerId: customerId,
      status: status,
      page: page,
      limit: limit,
    );
  }
}

