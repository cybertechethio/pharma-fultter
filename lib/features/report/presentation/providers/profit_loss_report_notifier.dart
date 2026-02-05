import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/profitlossreport/profit_loss_report.dart';
import 'report_providers.dart';

part 'profit_loss_report_notifier.g.dart';

@riverpod
class ProfitLossReportNotifier extends _$ProfitLossReportNotifier {
  // State: ProfitLossReport (contains report, graphs, etc.)
  @override
  Future<ProfitLossReport> build({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _currentStartDate = startDate;
    _currentEndDate = endDate;
    return await _load();
  }

  // Required date state (set from build parameters)
  late DateTime _currentStartDate;
  late DateTime _currentEndDate;

  /// Load profit-loss report
  Future<ProfitLossReport> _load() async {
    final useCase = ref.read(getProfitLossReportUseCaseProvider);
    final result = await useCase.call(
      startDate: _currentStartDate,
      endDate: _currentEndDate,
    );

    return result.fold(
      (failure) {
        throw failure;
      },
      (report) => report,
    );
  }

  /// Refresh: Reload data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }
}

