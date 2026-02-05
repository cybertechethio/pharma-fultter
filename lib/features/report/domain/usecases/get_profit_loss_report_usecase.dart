import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/profitlossreport/profit_loss_report.dart';
import '../repositories/report_repository.dart';

class GetProfitLossReportUseCase {
  final ReportRepository repository;

  GetProfitLossReportUseCase(this.repository);

  Future<Either<Failure, ProfitLossReport>> call({
    required DateTime startDate,
    required DateTime endDate,
    int? branchId,
  }) async {
    return await repository.getProfitLossReport(
      startDate: startDate,
      endDate: endDate,
      branchId: branchId,
    );
  }
}

