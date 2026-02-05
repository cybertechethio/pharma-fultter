import 'package:freezed_annotation/freezed_annotation.dart';
import 'summary.dart';
import 'chart.dart';
import 'dash_list.dart';
import 'alert.dart';
import 'overall_info.dart';

part 'dashboard.freezed.dart';

@freezed
sealed class Dashboard with _$Dashboard {
  const factory Dashboard({
    required Summary summary,
    required Chart charts,
    required DashList lists,
    Alert? alerts,
    required OverallInfo overallInfo,
  }) = _Dashboard;
}

