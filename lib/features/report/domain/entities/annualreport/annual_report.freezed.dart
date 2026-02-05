// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualReport {

 AnnualReportDetails get report; AnnualChartData get charts;
/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualReportCopyWith<AnnualReport> get copyWith => _$AnnualReportCopyWithImpl<AnnualReport>(this as AnnualReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualReport&&(identical(other.report, report) || other.report == report)&&(identical(other.charts, charts) || other.charts == charts));
}


@override
int get hashCode => Object.hash(runtimeType,report,charts);

@override
String toString() {
  return 'AnnualReport(report: $report, charts: $charts)';
}


}

/// @nodoc
abstract mixin class $AnnualReportCopyWith<$Res>  {
  factory $AnnualReportCopyWith(AnnualReport value, $Res Function(AnnualReport) _then) = _$AnnualReportCopyWithImpl;
@useResult
$Res call({
 AnnualReportDetails report, AnnualChartData charts
});


$AnnualReportDetailsCopyWith<$Res> get report;$AnnualChartDataCopyWith<$Res> get charts;

}
/// @nodoc
class _$AnnualReportCopyWithImpl<$Res>
    implements $AnnualReportCopyWith<$Res> {
  _$AnnualReportCopyWithImpl(this._self, this._then);

  final AnnualReport _self;
  final $Res Function(AnnualReport) _then;

/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = null,Object? charts = null,}) {
  return _then(_self.copyWith(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as AnnualReportDetails,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as AnnualChartData,
  ));
}
/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualReportDetailsCopyWith<$Res> get report {
  
  return $AnnualReportDetailsCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualChartDataCopyWith<$Res> get charts {
  
  return $AnnualChartDataCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualReport].
extension AnnualReportPatterns on AnnualReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualReport value)  $default,){
final _that = this;
switch (_that) {
case _AnnualReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualReport value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualReportDetails report,  AnnualChartData charts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualReport() when $default != null:
return $default(_that.report,_that.charts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualReportDetails report,  AnnualChartData charts)  $default,) {final _that = this;
switch (_that) {
case _AnnualReport():
return $default(_that.report,_that.charts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualReportDetails report,  AnnualChartData charts)?  $default,) {final _that = this;
switch (_that) {
case _AnnualReport() when $default != null:
return $default(_that.report,_that.charts);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualReport implements AnnualReport {
  const _AnnualReport({required this.report, required this.charts});
  

@override final  AnnualReportDetails report;
@override final  AnnualChartData charts;

/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualReportCopyWith<_AnnualReport> get copyWith => __$AnnualReportCopyWithImpl<_AnnualReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualReport&&(identical(other.report, report) || other.report == report)&&(identical(other.charts, charts) || other.charts == charts));
}


@override
int get hashCode => Object.hash(runtimeType,report,charts);

@override
String toString() {
  return 'AnnualReport(report: $report, charts: $charts)';
}


}

/// @nodoc
abstract mixin class _$AnnualReportCopyWith<$Res> implements $AnnualReportCopyWith<$Res> {
  factory _$AnnualReportCopyWith(_AnnualReport value, $Res Function(_AnnualReport) _then) = __$AnnualReportCopyWithImpl;
@override @useResult
$Res call({
 AnnualReportDetails report, AnnualChartData charts
});


@override $AnnualReportDetailsCopyWith<$Res> get report;@override $AnnualChartDataCopyWith<$Res> get charts;

}
/// @nodoc
class __$AnnualReportCopyWithImpl<$Res>
    implements _$AnnualReportCopyWith<$Res> {
  __$AnnualReportCopyWithImpl(this._self, this._then);

  final _AnnualReport _self;
  final $Res Function(_AnnualReport) _then;

/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = null,Object? charts = null,}) {
  return _then(_AnnualReport(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as AnnualReportDetails,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as AnnualChartData,
  ));
}

/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualReportDetailsCopyWith<$Res> get report {
  
  return $AnnualReportDetailsCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of AnnualReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualChartDataCopyWith<$Res> get charts {
  
  return $AnnualChartDataCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}
}

// dart format on
