// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salesstatistics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesStatisticsData {

 String get date; double get revenue; double get expense;
/// Create a copy of SalesStatisticsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesStatisticsDataCopyWith<SalesStatisticsData> get copyWith => _$SalesStatisticsDataCopyWithImpl<SalesStatisticsData>(this as SalesStatisticsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesStatisticsData&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,date,revenue,expense);

@override
String toString() {
  return 'SalesStatisticsData(date: $date, revenue: $revenue, expense: $expense)';
}


}

/// @nodoc
abstract mixin class $SalesStatisticsDataCopyWith<$Res>  {
  factory $SalesStatisticsDataCopyWith(SalesStatisticsData value, $Res Function(SalesStatisticsData) _then) = _$SalesStatisticsDataCopyWithImpl;
@useResult
$Res call({
 String date, double revenue, double expense
});




}
/// @nodoc
class _$SalesStatisticsDataCopyWithImpl<$Res>
    implements $SalesStatisticsDataCopyWith<$Res> {
  _$SalesStatisticsDataCopyWithImpl(this._self, this._then);

  final SalesStatisticsData _self;
  final $Res Function(SalesStatisticsData) _then;

/// Create a copy of SalesStatisticsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? revenue = null,Object? expense = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesStatisticsData].
extension SalesStatisticsDataPatterns on SalesStatisticsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesStatisticsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesStatisticsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesStatisticsData value)  $default,){
final _that = this;
switch (_that) {
case _SalesStatisticsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesStatisticsData value)?  $default,){
final _that = this;
switch (_that) {
case _SalesStatisticsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double revenue,  double expense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesStatisticsData() when $default != null:
return $default(_that.date,_that.revenue,_that.expense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double revenue,  double expense)  $default,) {final _that = this;
switch (_that) {
case _SalesStatisticsData():
return $default(_that.date,_that.revenue,_that.expense);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double revenue,  double expense)?  $default,) {final _that = this;
switch (_that) {
case _SalesStatisticsData() when $default != null:
return $default(_that.date,_that.revenue,_that.expense);case _:
  return null;

}
}

}

/// @nodoc


class _SalesStatisticsData implements SalesStatisticsData {
  const _SalesStatisticsData({required this.date, required this.revenue, required this.expense});
  

@override final  String date;
@override final  double revenue;
@override final  double expense;

/// Create a copy of SalesStatisticsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesStatisticsDataCopyWith<_SalesStatisticsData> get copyWith => __$SalesStatisticsDataCopyWithImpl<_SalesStatisticsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesStatisticsData&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,date,revenue,expense);

@override
String toString() {
  return 'SalesStatisticsData(date: $date, revenue: $revenue, expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$SalesStatisticsDataCopyWith<$Res> implements $SalesStatisticsDataCopyWith<$Res> {
  factory _$SalesStatisticsDataCopyWith(_SalesStatisticsData value, $Res Function(_SalesStatisticsData) _then) = __$SalesStatisticsDataCopyWithImpl;
@override @useResult
$Res call({
 String date, double revenue, double expense
});




}
/// @nodoc
class __$SalesStatisticsDataCopyWithImpl<$Res>
    implements _$SalesStatisticsDataCopyWith<$Res> {
  __$SalesStatisticsDataCopyWithImpl(this._self, this._then);

  final _SalesStatisticsData _self;
  final $Res Function(_SalesStatisticsData) _then;

/// Create a copy of SalesStatisticsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? revenue = null,Object? expense = null,}) {
  return _then(_SalesStatisticsData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
