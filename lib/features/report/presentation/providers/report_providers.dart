import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/report_api_service.dart';
import '../../data/datasources/report_remote_data_source.dart';
import '../../data/datasources/report_remote_data_source_impl.dart';
import '../../data/repositories/report_repository_impl.dart';
import '../../domain/repositories/report_repository.dart';
import '../../domain/usecases/get_sales_report_usecase.dart';
import '../../domain/usecases/get_purchase_report_usecase.dart';
import '../../domain/usecases/get_customer_report_usecase.dart';
import '../../domain/usecases/get_expense_report_usecase.dart';
import '../../domain/usecases/get_best_seller_report_usecase.dart';
import '../../domain/usecases/get_annual_report_usecase.dart';
import '../../domain/usecases/get_profit_loss_report_usecase.dart';
import '../../domain/entities/annualreport/annual_report.dart';
import '../../domain/entities/profitlossreport/profit_loss_report.dart';

part 'report_providers.g.dart';

@riverpod
ReportApiService reportApiService(Ref ref) {
  return ReportApiService.create();
}

@riverpod
ReportRemoteDataSource reportRemoteDataSource(Ref ref) {
  return ReportRemoteDataSourceImpl(
    ref.watch(reportApiServiceProvider),
  );
}

@riverpod
ReportRepository reportRepository(Ref ref) {
  return ReportRepositoryImpl(
    ref.watch(reportRemoteDataSourceProvider),
  );
}

@riverpod
GetSalesReportUseCase getSalesReportUseCase(Ref ref) {
  return GetSalesReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetPurchaseReportUseCase getPurchaseReportUseCase(Ref ref) {
  return GetPurchaseReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetCustomerReportUseCase getCustomerReportUseCase(Ref ref) {
  return GetCustomerReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetExpenseReportUseCase getExpenseReportUseCase(Ref ref) {
  return GetExpenseReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetBestSellerReportUseCase getBestSellerReportUseCase(Ref ref) {
  return GetBestSellerReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetAnnualReportUseCase getAnnualReportUseCase(Ref ref) {
  return GetAnnualReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}

@riverpod
GetProfitLossReportUseCase getProfitLossReportUseCase(Ref ref) {
  return GetProfitLossReportUseCase(
    ref.watch(reportRepositoryProvider),
  );
}


@riverpod
Future<AnnualReport> getAnnualReport(
  Ref ref, {
  required DateTime startDate,
}) async {
  final useCase = ref.read(getAnnualReportUseCaseProvider);
  final result = await useCase.call(
    startDate: startDate,
  );

  return result.fold(
    (failure) => throw failure,
    (report) => report,
  );
}

@riverpod
Future<ProfitLossReport> getProfitLossReport(
  Ref ref, {
  required DateTime startDate,
  required DateTime endDate,
  int? branchId,
}) async {
  final useCase = ref.read(getProfitLossReportUseCaseProvider);
  final result = await useCase.call(
    startDate: startDate,
    endDate: endDate,
    branchId: branchId,
  );

  return result.fold(
    (failure) => throw failure,
    (report) => report,
  );
}
