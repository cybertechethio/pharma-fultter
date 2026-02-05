import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/annualreport/annual_report.dart';
import '../repositories/report_repository.dart';

class GetAnnualReportUseCase {
  final ReportRepository repository;

  GetAnnualReportUseCase(this.repository);

  Future<Either<Failure, AnnualReport>> call({
    required DateTime startDate,
  }) async {
    return await repository.getAnnualReport(
      startDate: startDate,
    );
  }
}

