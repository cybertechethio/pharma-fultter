// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_salesstatistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChartSalesStatistics {

 List<SalesStatisticsData> get data; double get totalRevenue; double get totalExpense;
/// Create a copy of ChartSalesStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartSalesStatisticsCopyWith<ChartSalesStatistics> get copyWith => _$ChartSalesStatisticsCopyWithImpl<ChartSalesStatistics>(this as ChartSalesStatistics, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartSalesStatistics&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalRevenue,totalExpense);

@override
String toString() {
  return 'ChartSalesStatistics(data: $data, totalRevenue: $totalRevenue, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ChartSalesStatisticsCopyWith<$Res>  {
  factory $ChartSalesStatisticsCopyWith(ChartSalesStatistics value, $Res Function(ChartSalesStatistics) _then) = _$ChartSalesStatisticsCopyWithImpl;
@useResult
$Res call({
 List<SalesStatisticsData> data, double totalRevenue, double totalExpense
});




}
/// @nodoc
class _$ChartSalesStatisticsCopyWithImpl<$Res>
    implements $ChartSalesStatisticsCopyWith<$Res> {
  _$ChartSalesStatisticsCopyWithImpl(this._self, this._then);

  final ChartSalesStatistics _self;
  final $Res Function(ChartSalesStatistics) _then;

/// Create a copy of ChartSalesStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalRevenue = null,Object? totalExpense = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesStatisticsData>,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartSalesStatistics].
extension ChartSalesStatisticsPatterns on ChartSalesStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartSalesStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartSalesStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartSalesStatistics value)  $default,){
final _that = this;
switch (_that) {
case _ChartSalesStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartSalesStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _ChartSalesStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesStatisticsData> data,  double totalRevenue,  double totalExpense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartSalesStatistics() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesStatisticsData> data,  double totalRevenue,  double totalExpense)  $default,) {final _that = this;
switch (_that) {
case _ChartSalesStatistics():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesStatisticsData> data,  double totalRevenue,  double totalExpense)?  $default,) {final _that = this;
switch (_that) {
case _ChartSalesStatistics() when $default != null:
return $default(_that.data,_that.totalRevenue,_that.totalExpense);case _:
  return null;

}
}

}

/// @nodoc


class _ChartSalesStatistics implements ChartSalesStatistics {
  const _ChartSalesStatistics({required final  List<SalesStatisticsData> data, required this.totalRevenue, required this.totalExpense}): _data = data;
  

 final  List<SalesStatisticsData> _data;
@override List<SalesStatisticsData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  double totalRevenue;
@override final  double totalExpense;

/// Create a copy of ChartSalesStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartSalesStatisticsCopyWith<_ChartSalesStatistics> get copyWith => __$ChartSalesStatisticsCopyWithImpl<_ChartSalesStatistics>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartSalesStatistics&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalRevenue,totalExpense);

@override
String toString() {
  return 'ChartSalesStatistics(data: $data, totalRevenue: $totalRevenue, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class _$ChartSalesStatisticsCopyWith<$Res> implements $ChartSalesStatisticsCopyWith<$Res> {
  factory _$ChartSalesStatisticsCopyWith(_ChartSalesStatistics value, $Res Function(_ChartSalesStatistics) _then) = __$ChartSalesStatisticsCopyWithImpl;
@override @useResult
$Res call({
 List<SalesStatisticsData> data, double totalRevenue, double totalExpense
});




}
/// @nodoc
class __$ChartSalesStatisticsCopyWithImpl<$Res>
    implements _$ChartSalesStatisticsCopyWith<$Res> {
  __$ChartSalesStatisticsCopyWithImpl(this._self, this._then);

  final _ChartSalesStatistics _self;
  final $Res Function(_ChartSalesStatistics) _then;

/// Create a copy of ChartSalesStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalRevenue = null,Object? totalExpense = null,}) {
  return _then(_ChartSalesStatistics(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesStatisticsData>,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
