// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualReportModel {

 AnnualReportDetailsModel get report; AnnualChartDataModel get charts;
/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualReportModelCopyWith<AnnualReportModel> get copyWith => _$AnnualReportModelCopyWithImpl<AnnualReportModel>(this as AnnualReportModel, _$identity);

  /// Serializes this AnnualReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualReportModel&&(identical(other.report, report) || other.report == report)&&(identical(other.charts, charts) || other.charts == charts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,report,charts);

@override
String toString() {
  return 'AnnualReportModel(report: $report, charts: $charts)';
}


}

/// @nodoc
abstract mixin class $AnnualReportModelCopyWith<$Res>  {
  factory $AnnualReportModelCopyWith(AnnualReportModel value, $Res Function(AnnualReportModel) _then) = _$AnnualReportModelCopyWithImpl;
@useResult
$Res call({
 AnnualReportDetailsModel report, AnnualChartDataModel charts
});


$AnnualReportDetailsModelCopyWith<$Res> get report;$AnnualChartDataModelCopyWith<$Res> get charts;

}
/// @nodoc
class _$AnnualReportModelCopyWithImpl<$Res>
    implements $AnnualReportModelCopyWith<$Res> {
  _$AnnualReportModelCopyWithImpl(this._self, this._then);

  final AnnualReportModel _self;
  final $Res Function(AnnualReportModel) _then;

/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = null,Object? charts = null,}) {
  return _then(_self.copyWith(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as AnnualReportDetailsModel,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as AnnualChartDataModel,
  ));
}
/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualReportDetailsModelCopyWith<$Res> get report {
  
  return $AnnualReportDetailsModelCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualChartDataModelCopyWith<$Res> get charts {
  
  return $AnnualChartDataModelCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualReportModel].
extension AnnualReportModelPatterns on AnnualReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualReportModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualReportDetailsModel report,  AnnualChartDataModel charts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualReportDetailsModel report,  AnnualChartDataModel charts)  $default,) {final _that = this;
switch (_that) {
case _AnnualReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualReportDetailsModel report,  AnnualChartDataModel charts)?  $default,) {final _that = this;
switch (_that) {
case _AnnualReportModel() when $default != null:
return $default(_that.report,_that.charts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualReportModel implements AnnualReportModel {
  const _AnnualReportModel({required this.report, required this.charts});
  factory _AnnualReportModel.fromJson(Map<String, dynamic> json) => _$AnnualReportModelFromJson(json);

@override final  AnnualReportDetailsModel report;
@override final  AnnualChartDataModel charts;

/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualReportModelCopyWith<_AnnualReportModel> get copyWith => __$AnnualReportModelCopyWithImpl<_AnnualReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualReportModel&&(identical(other.report, report) || other.report == report)&&(identical(other.charts, charts) || other.charts == charts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,report,charts);

@override
String toString() {
  return 'AnnualReportModel(report: $report, charts: $charts)';
}


}

/// @nodoc
abstract mixin class _$AnnualReportModelCopyWith<$Res> implements $AnnualReportModelCopyWith<$Res> {
  factory _$AnnualReportModelCopyWith(_AnnualReportModel value, $Res Function(_AnnualReportModel) _then) = __$AnnualReportModelCopyWithImpl;
@override @useResult
$Res call({
 AnnualReportDetailsModel report, AnnualChartDataModel charts
});


@override $AnnualReportDetailsModelCopyWith<$Res> get report;@override $AnnualChartDataModelCopyWith<$Res> get charts;

}
/// @nodoc
class __$AnnualReportModelCopyWithImpl<$Res>
    implements _$AnnualReportModelCopyWith<$Res> {
  __$AnnualReportModelCopyWithImpl(this._self, this._then);

  final _AnnualReportModel _self;
  final $Res Function(_AnnualReportModel) _then;

/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = null,Object? charts = null,}) {
  return _then(_AnnualReportModel(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as AnnualReportDetailsModel,charts: null == charts ? _self.charts : charts // ignore: cast_nullable_to_non_nullable
as AnnualChartDataModel,
  ));
}

/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualReportDetailsModelCopyWith<$Res> get report {
  
  return $AnnualReportDetailsModelCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of AnnualReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualChartDataModelCopyWith<$Res> get charts {
  
  return $AnnualChartDataModelCopyWith<$Res>(_self.charts, (value) {
    return _then(_self.copyWith(charts: value));
  });
}
}

// dart format on
