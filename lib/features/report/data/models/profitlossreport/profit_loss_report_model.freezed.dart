// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossReportModel {

 ProfitLossReportDetailsModel get report; ProfitLossGraphModel get graph; ProfitLossGraphModel get graph10Days; ProfitLossGraphModel? get graphDateRange;
/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossReportModelCopyWith<ProfitLossReportModel> get copyWith => _$ProfitLossReportModelCopyWithImpl<ProfitLossReportModel>(this as ProfitLossReportModel, _$identity);

  /// Serializes this ProfitLossReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossReportModel&&(identical(other.report, report) || other.report == report)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.graph10Days, graph10Days) || other.graph10Days == graph10Days)&&(identical(other.graphDateRange, graphDateRange) || other.graphDateRange == graphDateRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,report,graph,graph10Days,graphDateRange);

@override
String toString() {
  return 'ProfitLossReportModel(report: $report, graph: $graph, graph10Days: $graph10Days, graphDateRange: $graphDateRange)';
}


}

/// @nodoc
abstract mixin class $ProfitLossReportModelCopyWith<$Res>  {
  factory $ProfitLossReportModelCopyWith(ProfitLossReportModel value, $Res Function(ProfitLossReportModel) _then) = _$ProfitLossReportModelCopyWithImpl;
@useResult
$Res call({
 ProfitLossReportDetailsModel report, ProfitLossGraphModel graph, ProfitLossGraphModel graph10Days, ProfitLossGraphModel? graphDateRange
});


$ProfitLossReportDetailsModelCopyWith<$Res> get report;$ProfitLossGraphModelCopyWith<$Res> get graph;$ProfitLossGraphModelCopyWith<$Res> get graph10Days;$ProfitLossGraphModelCopyWith<$Res>? get graphDateRange;

}
/// @nodoc
class _$ProfitLossReportModelCopyWithImpl<$Res>
    implements $ProfitLossReportModelCopyWith<$Res> {
  _$ProfitLossReportModelCopyWithImpl(this._self, this._then);

  final ProfitLossReportModel _self;
  final $Res Function(ProfitLossReportModel) _then;

/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = null,Object? graph = null,Object? graph10Days = null,Object? graphDateRange = freezed,}) {
  return _then(_self.copyWith(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ProfitLossReportDetailsModel,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel,graph10Days: null == graph10Days ? _self.graph10Days : graph10Days // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel,graphDateRange: freezed == graphDateRange ? _self.graphDateRange : graphDateRange // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel?,
  ));
}
/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsModelCopyWith<$Res> get report {
  
  return $ProfitLossReportDetailsModelCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res> get graph {
  
  return $ProfitLossGraphModelCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res> get graph10Days {
  
  return $ProfitLossGraphModelCopyWith<$Res>(_self.graph10Days, (value) {
    return _then(_self.copyWith(graph10Days: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res>? get graphDateRange {
    if (_self.graphDateRange == null) {
    return null;
  }

  return $ProfitLossGraphModelCopyWith<$Res>(_self.graphDateRange!, (value) {
    return _then(_self.copyWith(graphDateRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitLossReportModel].
extension ProfitLossReportModelPatterns on ProfitLossReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfitLossReportDetailsModel report,  ProfitLossGraphModel graph,  ProfitLossGraphModel graph10Days,  ProfitLossGraphModel? graphDateRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfitLossReportDetailsModel report,  ProfitLossGraphModel graph,  ProfitLossGraphModel graph10Days,  ProfitLossGraphModel? graphDateRange)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfitLossReportDetailsModel report,  ProfitLossGraphModel graph,  ProfitLossGraphModel graph10Days,  ProfitLossGraphModel? graphDateRange)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportModel() when $default != null:
return $default(_that.report,_that.graph,_that.graph10Days,_that.graphDateRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossReportModel implements ProfitLossReportModel {
  const _ProfitLossReportModel({required this.report, required this.graph, required this.graph10Days, this.graphDateRange});
  factory _ProfitLossReportModel.fromJson(Map<String, dynamic> json) => _$ProfitLossReportModelFromJson(json);

@override final  ProfitLossReportDetailsModel report;
@override final  ProfitLossGraphModel graph;
@override final  ProfitLossGraphModel graph10Days;
@override final  ProfitLossGraphModel? graphDateRange;

/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossReportModelCopyWith<_ProfitLossReportModel> get copyWith => __$ProfitLossReportModelCopyWithImpl<_ProfitLossReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossReportModel&&(identical(other.report, report) || other.report == report)&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.graph10Days, graph10Days) || other.graph10Days == graph10Days)&&(identical(other.graphDateRange, graphDateRange) || other.graphDateRange == graphDateRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,report,graph,graph10Days,graphDateRange);

@override
String toString() {
  return 'ProfitLossReportModel(report: $report, graph: $graph, graph10Days: $graph10Days, graphDateRange: $graphDateRange)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossReportModelCopyWith<$Res> implements $ProfitLossReportModelCopyWith<$Res> {
  factory _$ProfitLossReportModelCopyWith(_ProfitLossReportModel value, $Res Function(_ProfitLossReportModel) _then) = __$ProfitLossReportModelCopyWithImpl;
@override @useResult
$Res call({
 ProfitLossReportDetailsModel report, ProfitLossGraphModel graph, ProfitLossGraphModel graph10Days, ProfitLossGraphModel? graphDateRange
});


@override $ProfitLossReportDetailsModelCopyWith<$Res> get report;@override $ProfitLossGraphModelCopyWith<$Res> get graph;@override $ProfitLossGraphModelCopyWith<$Res> get graph10Days;@override $ProfitLossGraphModelCopyWith<$Res>? get graphDateRange;

}
/// @nodoc
class __$ProfitLossReportModelCopyWithImpl<$Res>
    implements _$ProfitLossReportModelCopyWith<$Res> {
  __$ProfitLossReportModelCopyWithImpl(this._self, this._then);

  final _ProfitLossReportModel _self;
  final $Res Function(_ProfitLossReportModel) _then;

/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = null,Object? graph = null,Object? graph10Days = null,Object? graphDateRange = freezed,}) {
  return _then(_ProfitLossReportModel(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ProfitLossReportDetailsModel,graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel,graph10Days: null == graph10Days ? _self.graph10Days : graph10Days // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel,graphDateRange: freezed == graphDateRange ? _self.graphDateRange : graphDateRange // ignore: cast_nullable_to_non_nullable
as ProfitLossGraphModel?,
  ));
}

/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsModelCopyWith<$Res> get report {
  
  return $ProfitLossReportDetailsModelCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res> get graph {
  
  return $ProfitLossGraphModelCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res> get graph10Days {
  
  return $ProfitLossGraphModelCopyWith<$Res>(_self.graph10Days, (value) {
    return _then(_self.copyWith(graph10Days: value));
  });
}/// Create a copy of ProfitLossReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<$Res>? get graphDateRange {
    if (_self.graphDateRange == null) {
    return null;
  }

  return $ProfitLossGraphModelCopyWith<$Res>(_self.graphDateRange!, (value) {
    return _then(_self.copyWith(graphDateRange: value));
  });
}
}

// dart format on
