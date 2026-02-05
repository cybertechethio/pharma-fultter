import 'package:freezed_annotation/freezed_annotation.dart';
import 'customer_item_data.dart';
import 'customer_summary.dart';

part 'customer_report.freezed.dart';

@freezed
sealed class CustomerReport with _$CustomerReport {
  const factory CustomerReport({
    required List<CustomerItemData> items,
    required CustomerSummary summary,
  }) = _CustomerReport;
}

