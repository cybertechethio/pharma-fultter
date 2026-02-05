// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_week_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossWeekData {

 String get week; double get sales; double get profit;
/// Create a copy of ProfitLossWeekData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossWeekDataCopyWith<ProfitLossWeekData> get copyWith => _$ProfitLossWeekDataCopyWithImpl<ProfitLossWeekData>(this as ProfitLossWeekData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossWeekData&&(identical(other.week, week) || other.week == week)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,week,sales,profit);

@override
String toString() {
  return 'ProfitLossWeekData(week: $week, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossWeekDataCopyWith<$Res>  {
  factory $ProfitLossWeekDataCopyWith(ProfitLossWeekData value, $Res Function(ProfitLossWeekData) _then) = _$ProfitLossWeekDataCopyWithImpl;
@useResult
$Res call({
 String week, double sales, double profit
});




}
/// @nodoc
class _$ProfitLossWeekDataCopyWithImpl<$Res>
    implements $ProfitLossWeekDataCopyWith<$Res> {
  _$ProfitLossWeekDataCopyWithImpl(this._self, this._then);

  final ProfitLossWeekData _self;
  final $Res Function(ProfitLossWeekData) _then;

/// Create a copy of ProfitLossWeekData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossWeekData].
extension ProfitLossWeekDataPatterns on ProfitLossWeekData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossWeekData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossWeekData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossWeekData value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossWeekData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossWeekData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossWeekData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String week,  double sales,  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossWeekData() when $default != null:
return $default(_that.week,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String week,  double sales,  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossWeekData():
return $default(_that.week,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String week,  double sales,  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossWeekData() when $default != null:
return $default(_that.week,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossWeekData implements ProfitLossWeekData {
  const _ProfitLossWeekData({required this.week, required this.sales, required this.profit});
  

@override final  String week;
@override final  double sales;
@override final  double profit;

/// Create a copy of ProfitLossWeekData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossWeekDataCopyWith<_ProfitLossWeekData> get copyWith => __$ProfitLossWeekDataCopyWithImpl<_ProfitLossWeekData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossWeekData&&(identical(other.week, week) || other.week == week)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,week,sales,profit);

@override
String toString() {
  return 'ProfitLossWeekData(week: $week, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossWeekDataCopyWith<$Res> implements $ProfitLossWeekDataCopyWith<$Res> {
  factory _$ProfitLossWeekDataCopyWith(_ProfitLossWeekData value, $Res Function(_ProfitLossWeekData) _then) = __$ProfitLossWeekDataCopyWithImpl;
@override @useResult
$Res call({
 String week, double sales, double profit
});




}
/// @nodoc
class __$ProfitLossWeekDataCopyWithImpl<$Res>
    implements _$ProfitLossWeekDataCopyWith<$Res> {
  __$ProfitLossWeekDataCopyWithImpl(this._self, this._then);

  final _ProfitLossWeekData _self;
  final $Res Function(_ProfitLossWeekData) _then;

/// Create a copy of ProfitLossWeekData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossWeekData(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
