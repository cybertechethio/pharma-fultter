// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardModel {

 SummaryModel get summary; ChartModel get charts; DashListModel get lists; AlertModel? get alerts; OverallInfoModel get overallInfo;
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardModelCopyWith<DashboardModel> get copyWith => _$DashboardModelCopyWithImpl<DashboardModel>(this as DashboardModel, _$identity);

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardModel&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.alerts, alerts) || other.alerts == alerts)&&(identical(other.overallInfo, overallInfo) || other.overallInfo == overallInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,charts,lists,alerts,overallInfo);

@override
String toString() {
  return 'DashboardModel(summary: $summary, charts: $charts, lists: $lists, alerts: $alerts, overallInfo: $overallInfo)';
}


}

/// @nodoc
abstract mixin class $DashboardModelCopyWith<$Res>  {
  factory $DashboardModelCopyWith(DashboardModel value, $Res Function(DashboardModel) _then) = _$DashboardModelCopyWithImpl;
@useResult
$Res call({
 SummaryModel summary, ChartModel charts, DashListModel lists, AlertModel? alerts, OverallInfoModel overallInfo
});


$SummaryModelCopyWith<$Res> get summary;$ChartModelCopyWith<$Res> get charts;$DashListModelCopyWith<$Res> get lists;$AlertModelCopyWith<$Res>? get alerts;$OverallInfoModelCopyWith<$Res> get overallInfo;

}
/// @nodoc
class _$DashboardModelCopyWithImpl<$Res>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._self, this._then);

  final DashboardModel _self;
  final $Res Function(DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? charts = null,Object? lists = null,Object? alerts = freezed,Object? overallInfo = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as ChartModel,lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as DashListModel,alerts: freezed == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as AlertModel?,overallInfo: null == overallInfo ? _self.overallInfo : overallInfo // ignore: cast_nullable_to_non_nullable
as OverallInfoModel,
  ));
}
/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res> get summary {
  
  return $SummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartModelCopyWith<$Res> get charts {
  
  return $ChartModelCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashListModelCopyWith<$Res> get lists {
  
  return $DashListModelCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertModelCopyWith<$Res>? get alerts {
    if (_self.alerts == null) {
    return null;
  }

  return $AlertModelCopyWith<$Res>(_self.alerts!, (value) {
    return _then(_self.copyWith(alerts: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverallInfoModelCopyWith<$Res> get overallInfo {
  
  return $OverallInfoModelCopyWith<$Res>(_self.overallInfo, (value) {
    return _then(_self.copyWith(overallInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardModel].
extension DashboardModelPatterns on DashboardModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SummaryModel summary,  ChartModel charts,  DashListModel lists,  AlertModel? alerts,  OverallInfoModel overallInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.summary,_that.charts,_that.lists,_that.alerts,_that.overallInfo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SummaryModel summary,  ChartModel charts,  DashListModel lists,  AlertModel? alerts,  OverallInfoModel overallInfo)  $default,) {final _that = this;
switch (_that) {
case _DashboardModel():
return $default(_that.summary,_that.charts,_that.lists,_that.alerts,_that.overallInfo);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SummaryModel summary,  ChartModel charts,  DashListModel lists,  AlertModel? alerts,  OverallInfoModel overallInfo)?  $default,) {final _that = this;
switch (_that) {
case _DashboardModel() when $default != null:
return $default(_that.summary,_that.charts,_that.lists,_that.alerts,_that.overallInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardModel implements DashboardModel {
  const _DashboardModel({required this.summary, required this.charts, required this.lists, this.alerts, required this.overallInfo});
  factory _DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);

@override final  SummaryModel summary;
@override final  ChartModel charts;
@override final  DashListModel lists;
@override final  AlertModel? alerts;
@override final  OverallInfoModel overallInfo;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardModelCopyWith<_DashboardModel> get copyWith => __$DashboardModelCopyWithImpl<_DashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardModel&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.alerts, alerts) || other.alerts == alerts)&&(identical(other.overallInfo, overallInfo) || other.overallInfo == overallInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,charts,lists,alerts,overallInfo);

@override
String toString() {
  return 'DashboardModel(summary: $summary, charts: $charts, lists: $lists, alerts: $alerts, overallInfo: $overallInfo)';
}


}

/// @nodoc
abstract mixin class _$DashboardModelCopyWith<$Res> implements $DashboardModelCopyWith<$Res> {
  factory _$DashboardModelCopyWith(_DashboardModel value, $Res Function(_DashboardModel) _then) = __$DashboardModelCopyWithImpl;
@override @useResult
$Res call({
 SummaryModel summary, ChartModel charts, DashListModel lists, AlertModel? alerts, OverallInfoModel overallInfo
});


@override $SummaryModelCopyWith<$Res> get summary;@override $ChartModelCopyWith<$Res> get charts;@override $DashListModelCopyWith<$Res> get lists;@override $AlertModelCopyWith<$Res>? get alerts;@override $OverallInfoModelCopyWith<$Res> get overallInfo;

}
/// @nodoc
class __$DashboardModelCopyWithImpl<$Res>
    implements _$DashboardModelCopyWith<$Res> {
  __$DashboardModelCopyWithImpl(this._self, this._then);

  final _DashboardModel _self;
  final $Res Function(_DashboardModel) _then;

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? charts = null,Object? lists = null,Object? alerts = freezed,Object? overallInfo = null,}) {
  return _then(_DashboardModel(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SummaryModel,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as ChartModel,lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as DashListModel,alerts: freezed == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as AlertModel?,overallInfo: null == overallInfo ? _self.overallInfo : overallInfo // ignore: cast_nullable_to_non_nullable
as OverallInfoModel,
  ));
}

/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryModelCopyWith<$Res> get summary {
  
  return $SummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartModelCopyWith<$Res> get charts {
  
  return $ChartModelCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashListModelCopyWith<$Res> get lists {
  
  return $DashListModelCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertModelCopyWith<$Res>? get alerts {
    if (_self.alerts == null) {
    return null;
  }

  return $AlertModelCopyWith<$Res>(_self.alerts!, (value) {
    return _then(_self.copyWith(alerts: value));
  });
}/// Create a copy of DashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverallInfoModelCopyWith<$Res> get overallInfo {
  
  return $OverallInfoModelCopyWith<$Res>(_self.overallInfo, (value) {
    return _then(_self.copyWith(overallInfo: value));
  });
}
}

// dart format on
