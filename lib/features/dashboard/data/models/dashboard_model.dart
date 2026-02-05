// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'summary_model.dart';
import 'chart_model.dart';
import 'dash_list_model.dart';
import 'alert_model.dart';
import 'overall_info_model.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
sealed class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    required SummaryModel summary,
    required ChartModel charts,
    required DashListModel lists,
    AlertModel? alerts,
    required OverallInfoModel overallInfo,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

