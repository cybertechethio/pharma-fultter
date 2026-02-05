// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_salesstatistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartSalesStatisticsModel {

 List<SalesStatisticsDataModel> get data;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalRevenue;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalExpense;
/// Create a copy of ChartSalesStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartSalesStatisticsModelCopyWith<ChartSalesStatisticsModel> get copyWith => _$ChartSalesStatisticsModelCopyWithImpl<ChartSalesStatisticsModel>(this as ChartSalesStatisticsModel, _$identity);

  /// Serializes this ChartSalesStatisticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartSalesStatisticsModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalRevenue,totalExpense);

@override
String toString() {
  return 'ChartSalesStatisticsModel(data: $data, totalRevenue: $totalRevenue, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ChartSalesStatisticsModelCopyWith<$Res>  {
  factory $ChartSalesStatisticsModelCopyWith(ChartSalesStatisticsModel value, $Res Function(ChartSalesStatisticsModel) _then) = _$ChartSalesStatisticsModelCopyWithImpl;
@useResult
$Res call({
 List<SalesStatisticsDataModel> data,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalRevenue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalExpense
});




}
/// @nodoc
class _$ChartSalesStatisticsModelCopyWithImpl<$Res>
    implements $ChartSalesStatisticsModelCopyWith<$Res> {
  _$ChartSalesStatisticsModelCopyWithImpl(this._self, this._then);

  final ChartSalesStatisticsModel _self;
  final $Res Function(ChartSalesStatisticsModel) _then;

/// Create a copy of ChartSalesStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalRevenue = null,Object? totalExpense = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesStatisticsDataModel>,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartSalesStatisticsModel].
extension ChartSalesStatisticsModelPatterns on ChartSalesStatisticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartSalesStatisticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartSalesStatisticsModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartSalesStatisticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesStatisticsDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalRevenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalExpense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel() when $default != null:
return $default(_that.data,_that.totalRevenue,_that.totalExpense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesStatisticsDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalRevenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalExpense)  $default,) {final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel():
return $default(_that.data,_that.totalRevenue,_that.totalExpense);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesStatisticsDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalRevenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalExpense)?  $default,) {final _that = this;
switch (_that) {
case _ChartSalesStatisticsModel() when $default != null:
return $default(_that.data,_that.totalRevenue,_that.totalExpense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartSalesStatisticsModel implements ChartSalesStatisticsModel {
  const _ChartSalesStatisticsModel({required final  List<SalesStatisticsDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalRevenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalExpense}): _data = data;
  factory _ChartSalesStatisticsModel.fromJson(Map<String, dynamic> json) => _$ChartSalesStatisticsModelFromJson(json);

 final  List<SalesStatisticsDataModel> _data;
@override List<SalesStatisticsDataModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalRevenue;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalExpense;

/// Create a copy of ChartSalesStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartSalesStatisticsModelCopyWith<_ChartSalesStatisticsModel> get copyWith => __$ChartSalesStatisticsModelCopyWithImpl<_ChartSalesStatisticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartSalesStatisticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartSalesStatisticsModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalRevenue,totalExpense);

@override
String toString() {
  return 'ChartSalesStatisticsModel(data: $data, totalRevenue: $totalRevenue, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class _$ChartSalesStatisticsModelCopyWith<$Res> implements $ChartSalesStatisticsModelCopyWith<$Res> {
  factory _$ChartSalesStatisticsModelCopyWith(_ChartSalesStatisticsModel value, $Res Function(_ChartSalesStatisticsModel) _then) = __$ChartSalesStatisticsModelCopyWithImpl;
@override @useResult
$Res call({
 List<SalesStatisticsDataModel> data,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalRevenue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalExpense
});




}
/// @nodoc
class __$ChartSalesStatisticsModelCopyWithImpl<$Res>
    implements _$ChartSalesStatisticsModelCopyWith<$Res> {
  __$ChartSalesStatisticsModelCopyWithImpl(this._self, this._then);

  final _ChartSalesStatisticsModel _self;
  final $Res Function(_ChartSalesStatisticsModel) _then;

/// Create a copy of ChartSalesStatisticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalRevenue = null,Object? totalExpense = null,}) {
  return _then(_ChartSalesStatisticsModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesStatisticsDataModel>,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
