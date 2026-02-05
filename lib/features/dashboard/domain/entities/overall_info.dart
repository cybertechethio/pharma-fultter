import 'package:freezed_annotation/freezed_annotation.dart';

part 'overall_info.freezed.dart';

@freezed
sealed class OverallInfo with _$OverallInfo {
  const factory OverallInfo({
    required int suppliers,
    required int customers,
    required int orders,
  }) = _OverallInfo;
}

