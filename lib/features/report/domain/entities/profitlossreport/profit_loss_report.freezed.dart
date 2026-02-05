// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossReport {

 ProfitLossReportDetails get report; ProfitLossGraph get graph; ProfitLossGraph get graph10Days; ProfitLossGraph? get graphDateRange;
/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossReportCopyWith<ProfitLossReport> get copyWith => _$ProfitLossReportCopyWithImpl<ProfitLossReport>(this as ProfitLossReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossReport&&(identical(other.report, report) || other.report == report)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.graph10Days, graph10Days) || other.graph10Days == graph10Days)&&(identical(other.graphDateRange, graphDateRange) || other.graphDateRange == graphDateRange));
}


@override
int get hashCode => Object.hash(runtimeType,report,graph,graph10Days,graphDateRange);

@override
String toString() {
  return 'ProfitLossReport(report: $report, graph: $graph, graph10Days: $graph10Days, graphDateRange: $graphDateRange)';
}


}

/// @nodoc
abstract mixin class $ProfitLossReportCopyWith<$Res>  {
  factory $ProfitLossReportCopyWith(ProfitLossReport value, $Res Function(ProfitLossReport) _then) = _$ProfitLossReportCopyWithImpl;
@useResult
$Res call({
 ProfitLossReportDetails report, ProfitLossGraph graph, ProfitLossGraph graph10Days, ProfitLossGraph? graphDateRange
});


$ProfitLossReportDetailsCopyWith<$Res> get report;$ProfitLossGraphCopyWith<$Res> get graph;$ProfitLossGraphCopyWith<$Res> get graph10Days;$ProfitLossGraphCopyWith<$Res>? get graphDateRange;

}
/// @nodoc
class _$ProfitLossReportCopyWithImpl<$Res>
    implements $ProfitLossReportCopyWith<$Res> {
  _$ProfitLossReportCopyWithImpl(this._self, this._then);

  final ProfitLossReport _self;
  final $Res Function(ProfitLossReport) _then;

/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = null,Object? graph = null,Object? graph10Days = null,Object? graphDateRange = freezed,}) {
  return _then(_self.copyWith(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ProfitLossReportDetails,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph,graph10Days: null == graph10Days ? _self.graph10Days : graph10Days // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph,graphDateRange: freezed == graphDateRange ? _self.graphDateRange : graphDateRange // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph?,
  ));
}
/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsCopyWith<$Res> get report {
  
  return $ProfitLossReportDetailsCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res> get graph {
  
  return $ProfitLossGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res> get graph10Days {
  
  return $ProfitLossGraphCopyWith<$Res>(_self.graph10Days, (value) {
    return _then(_self.copyWith(graph10Days: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res>? get graphDateRange {
    if (_self.graphDateRange == null) {
    return null;
  }

  return $ProfitLossGraphCopyWith<$Res>(_self.graphDateRange!, (value) {
    return _then(_self.copyWith(graphDateRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitLossReport].
extension ProfitLossReportPatterns on ProfitLossReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossReport value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossReport value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfitLossReportDetails report,  ProfitLossGraph graph,  ProfitLossGraph graph10Days,  ProfitLossGraph? graphDateRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossReport() when $default != null:
return $default(_that.report,_that.graph,_that.graph10Days,_that.graphDateRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfitLossReportDetails report,  ProfitLossGraph graph,  ProfitLossGraph graph10Days,  ProfitLossGraph? graphDateRange)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReport():
return $default(_that.report,_that.graph,_that.graph10Days,_that.graphDateRange);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfitLossReportDetails report,  ProfitLossGraph graph,  ProfitLossGraph graph10Days,  ProfitLossGraph? graphDateRange)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReport() when $default != null:
return $default(_that.report,_that.graph,_that.graph10Days,_that.graphDateRange);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossReport implements ProfitLossReport {
  const _ProfitLossReport({required this.report, required this.graph, required this.graph10Days, this.graphDateRange});
  

@override final  ProfitLossReportDetails report;
@override final  ProfitLossGraph graph;
@override final  ProfitLossGraph graph10Days;
@override final  ProfitLossGraph? graphDateRange;

/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossReportCopyWith<_ProfitLossReport> get copyWith => __$ProfitLossReportCopyWithImpl<_ProfitLossReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossReport&&(identical(other.report, report) || other.report == report)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.graph10Days, graph10Days) || other.graph10Days == graph10Days)&&(identical(other.graphDateRange, graphDateRange) || other.graphDateRange == graphDateRange));
}


@override
int get hashCode => Object.hash(runtimeType,report,graph,graph10Days,graphDateRange);

@override
String toString() {
  return 'ProfitLossReport(report: $report, graph: $graph, graph10Days: $graph10Days, graphDateRange: $graphDateRange)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossReportCopyWith<$Res> implements $ProfitLossReportCopyWith<$Res> {
  factory _$ProfitLossReportCopyWith(_ProfitLossReport value, $Res Function(_ProfitLossReport) _then) = __$ProfitLossReportCopyWithImpl;
@override @useResult
$Res call({
 ProfitLossReportDetails report, ProfitLossGraph graph, ProfitLossGraph graph10Days, ProfitLossGraph? graphDateRange
});


@override $ProfitLossReportDetailsCopyWith<$Res> get report;@override $ProfitLossGraphCopyWith<$Res> get graph;@override $ProfitLossGraphCopyWith<$Res> get graph10Days;@override $ProfitLossGraphCopyWith<$Res>? get graphDateRange;

}
/// @nodoc
class __$ProfitLossReportCopyWithImpl<$Res>
    implements _$ProfitLossReportCopyWith<$Res> {
  __$ProfitLossReportCopyWithImpl(this._self, this._then);

  final _ProfitLossReport _self;
  final $Res Function(_ProfitLossReport) _then;

/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = null,Object? graph = null,Object? graph10Days = null,Object? graphDateRange = freezed,}) {
  return _then(_ProfitLossReport(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ProfitLossReportDetails,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph,graph10Days: null == graph10Days ? _self.graph10Days : graph10Days // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph,graphDateRange: freezed == graphDateRange ? _self.graphDateRange : graphDateRange // ignore: cast_nullable_to_non_nullable
as ProfitLossGraph?,
  ));
}

/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsCopyWith<$Res> get report {
  
  return $ProfitLossReportDetailsCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res> get graph {
  
  return $ProfitLossGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res> get graph10Days {
  
  return $ProfitLossGraphCopyWith<$Res>(_self.graph10Days, (value) {
    return _then(_self.copyWith(graph10Days: value));
  });
}/// Create a copy of ProfitLossReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<$Res>? get graphDateRange {
    if (_self.graphDateRange == null) {
    return null;
  }

  return $ProfitLossGraphCopyWith<$Res>(_self.graphDateRange!, (value) {
    return _then(_self.copyWith(graphDateRange: value));
  });
}
}

// dart format on
