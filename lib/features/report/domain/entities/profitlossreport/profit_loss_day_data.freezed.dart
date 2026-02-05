// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_day_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossDayData {

 DateTime get date; double get sales; double get profit;
/// Create a copy of ProfitLossDayData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossDayDataCopyWith<ProfitLossDayData> get copyWith => _$ProfitLossDayDataCopyWithImpl<ProfitLossDayData>(this as ProfitLossDayData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossDayData&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,date,sales,profit);

@override
String toString() {
  return 'ProfitLossDayData(date: $date, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossDayDataCopyWith<$Res>  {
  factory $ProfitLossDayDataCopyWith(ProfitLossDayData value, $Res Function(ProfitLossDayData) _then) = _$ProfitLossDayDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, double sales, double profit
});




}
/// @nodoc
class _$ProfitLossDayDataCopyWithImpl<$Res>
    implements $ProfitLossDayDataCopyWith<$Res> {
  _$ProfitLossDayDataCopyWithImpl(this._self, this._then);

  final ProfitLossDayData _self;
  final $Res Function(ProfitLossDayData) _then;

/// Create a copy of ProfitLossDayData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossDayData].
extension ProfitLossDayDataPatterns on ProfitLossDayData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossDayData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossDayData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossDayData value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossDayData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossDayData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossDayData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double sales,  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossDayData() when $default != null:
return $default(_that.date,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double sales,  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossDayData():
return $default(_that.date,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double sales,  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossDayData() when $default != null:
return $default(_that.date,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossDayData implements ProfitLossDayData {
  const _ProfitLossDayData({required this.date, required this.sales, required this.profit});
  

@override final  DateTime date;
@override final  double sales;
@override final  double profit;

/// Create a copy of ProfitLossDayData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossDayDataCopyWith<_ProfitLossDayData> get copyWith => __$ProfitLossDayDataCopyWithImpl<_ProfitLossDayData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossDayData&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,date,sales,profit);

@override
String toString() {
  return 'ProfitLossDayData(date: $date, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossDayDataCopyWith<$Res> implements $ProfitLossDayDataCopyWith<$Res> {
  factory _$ProfitLossDayDataCopyWith(_ProfitLossDayData value, $Res Function(_ProfitLossDayData) _then) = __$ProfitLossDayDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double sales, double profit
});




}
/// @nodoc
class __$ProfitLossDayDataCopyWithImpl<$Res>
    implements _$ProfitLossDayDataCopyWith<$Res> {
  __$ProfitLossDayDataCopyWithImpl(this._self, this._then);

  final _ProfitLossDayData _self;
  final $Res Function(_ProfitLossDayData) _then;

/// Create a copy of ProfitLossDayData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossDayData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
