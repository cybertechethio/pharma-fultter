import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_customer.freezed.dart';

@freezed
sealed class ChartCustomer with _$ChartCustomer {
  const factory ChartCustomer({
    required double firstTime,
    required double returning,
    required double firstTimePercentage,
    required double returningPercentage,
  }) = _ChartCustomer;
}

