import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/expensereport/expense_report.dart';
import '../repositories/report_repository.dart';

class GetExpenseReportUseCase {
  final ReportRepository repository;

  GetExpenseReportUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<ExpenseReport>>> call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
    int? categoryId,
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getExpenseReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
      categoryId: categoryId,
      page: page,
      limit: limit,
    );
  }
}

