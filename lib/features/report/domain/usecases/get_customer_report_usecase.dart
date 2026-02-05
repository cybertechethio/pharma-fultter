import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/customerreport/customer_report.dart';
import '../repositories/report_repository.dart';

class GetCustomerReportUseCase {
  final ReportRepository repository;

  GetCustomerReportUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<CustomerReport>>> call({
    DateTime? startDate,
    DateTime? endDate,
    int? branchId,
    int? customerId,
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getCustomerReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      customerId: customerId,
      page: page,
      limit: limit,
    );
  }
}

