import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/annualreport/annual_report.dart';
import 'report_providers.dart';

part 'annual_report_notifier.g.dart';

@riverpod
class AnnualReportNotifier extends _$AnnualReportNotifier {
  // State: AnnualReport (contains report and charts)
  @override
  Future<AnnualReport> build({
    required DateTime startDate,
  }) async {
    _currentStartDate = startDate;
    return await _load();
  }

  // Required date state (set from build parameters)
  late DateTime _currentStartDate;

  /// Load annual report
  Future<AnnualReport> _load() async {
    final useCase = ref.read(getAnnualReportUseCaseProvider);
    final result = await useCase.call(
      startDate: _currentStartDate,
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

