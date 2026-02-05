// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Dashboard {

 Summary get summary; Chart get charts; DashList get lists; Alert? get alerts; OverallInfo get overallInfo;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.alerts, alerts) || other.alerts == alerts)&&(identical(other.overallInfo, overallInfo) || other.overallInfo == overallInfo));
}


@override
int get hashCode => Object.hash(runtimeType,summary,charts,lists,alerts,overallInfo);

@override
String toString() {
  return 'Dashboard(summary: $summary, charts: $charts, lists: $lists, alerts: $alerts, overallInfo: $overallInfo)';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 Summary summary, Chart charts, DashList lists, Alert? alerts, OverallInfo overallInfo
});


$SummaryCopyWith<$Res> get summary;$ChartCopyWith<$Res> get charts;$DashListCopyWith<$Res> get lists;$AlertCopyWith<$Res>? get alerts;$OverallInfoCopyWith<$Res> get overallInfo;

}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? charts = null,Object? lists = null,Object? alerts = freezed,Object? overallInfo = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as Chart,lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as DashList,alerts: freezed == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as Alert?,overallInfo: null == overallInfo ? _self.overallInfo : overallInfo // ignore: cast_nullable_to_non_nullable
as OverallInfo,
  ));
}
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res> get summary {
  
  return $SummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCopyWith<$Res> get charts {
  
  return $ChartCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashListCopyWith<$Res> get lists {
  
  return $DashListCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertCopyWith<$Res>? get alerts {
    if (_self.alerts == null) {
    return null;
  }

  return $AlertCopyWith<$Res>(_self.alerts!, (value) {
    return _then(_self.copyWith(alerts: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverallInfoCopyWith<$Res> get overallInfo {
  
  return $OverallInfoCopyWith<$Res>(_self.overallInfo, (value) {
    return _then(_self.copyWith(overallInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Summary summary,  Chart charts,  DashList lists,  Alert? alerts,  OverallInfo overallInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Summary summary,  Chart charts,  DashList lists,  Alert? alerts,  OverallInfo overallInfo)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Summary summary,  Chart charts,  DashList lists,  Alert? alerts,  OverallInfo overallInfo)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.summary,_that.charts,_that.lists,_that.alerts,_that.overallInfo);case _:
  return null;

}
}

}

/// @nodoc


class _Dashboard implements Dashboard {
  const _Dashboard({required this.summary, required this.charts, required this.lists, this.alerts, required this.overallInfo});
  

@override final  Summary summary;
@override final  Chart charts;
@override final  DashList lists;
@override final  Alert? alerts;
@override final  OverallInfo overallInfo;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.charts, charts) || other.charts == charts)&&(identical(other.lists, lists) || other.lists == lists)&&(identical(other.alerts, alerts) || other.alerts == alerts)&&(identical(other.overallInfo, overallInfo) || other.overallInfo == overallInfo));
}


@override
int get hashCode => Object.hash(runtimeType,summary,charts,lists,alerts,overallInfo);

@override
String toString() {
  return 'Dashboard(summary: $summary, charts: $charts, lists: $lists, alerts: $alerts, overallInfo: $overallInfo)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 Summary summary, Chart charts, DashList lists, Alert? alerts, OverallInfo overallInfo
});


@override $SummaryCopyWith<$Res> get summary;@override $ChartCopyWith<$Res> get charts;@override $DashListCopyWith<$Res> get lists;@override $AlertCopyWith<$Res>? get alerts;@override $OverallInfoCopyWith<$Res> get overallInfo;

}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? charts = null,Object? lists = null,Object? alerts = freezed,Object? overallInfo = null,}) {
  return _then(_Dashboard(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Summary,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as Chart,lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as DashList,alerts: freezed == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as Alert?,overallInfo: null == overallInfo ? _self.overallInfo : overallInfo // ignore: cast_nullable_to_non_nullable
as OverallInfo,
  ));
}

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummaryCopyWith<$Res> get summary {
  
  return $SummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCopyWith<$Res> get charts {
  
  return $ChartCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashListCopyWith<$Res> get lists {
  
  return $DashListCopyWith<$Res>(_self.lists, (value) {
    return _then(_self.copyWith(lists: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertCopyWith<$Res>? get alerts {
    if (_self.alerts == null) {
    return null;
  }

  return $AlertCopyWith<$Res>(_self.alerts!, (value) {
    return _then(_self.copyWith(alerts: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverallInfoCopyWith<$Res> get overallInfo {
  
  return $OverallInfoCopyWith<$Res>(_self.overallInfo, (value) {
    return _then(_self.copyWith(overallInfo: value));
  });
}
}

// dart format on
