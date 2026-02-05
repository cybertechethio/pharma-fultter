// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_month_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossMonthData {

 String get month; double get sales; double get profit;
/// Create a copy of ProfitLossMonthData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossMonthDataCopyWith<ProfitLossMonthData> get copyWith => _$ProfitLossMonthDataCopyWithImpl<ProfitLossMonthData>(this as ProfitLossMonthData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossMonthData&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'ProfitLossMonthData(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossMonthDataCopyWith<$Res>  {
  factory $ProfitLossMonthDataCopyWith(ProfitLossMonthData value, $Res Function(ProfitLossMonthData) _then) = _$ProfitLossMonthDataCopyWithImpl;
@useResult
$Res call({
 String month, double sales, double profit
});




}
/// @nodoc
class _$ProfitLossMonthDataCopyWithImpl<$Res>
    implements $ProfitLossMonthDataCopyWith<$Res> {
  _$ProfitLossMonthDataCopyWithImpl(this._self, this._then);

  final ProfitLossMonthData _self;
  final $Res Function(ProfitLossMonthData) _then;

/// Create a copy of ProfitLossMonthData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossMonthData].
extension ProfitLossMonthDataPatterns on ProfitLossMonthData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossMonthData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossMonthData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossMonthData value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossMonthData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossMonthData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossMonthData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month,  double sales,  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossMonthData() when $default != null:
return $default(_that.month,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month,  double sales,  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossMonthData():
return $default(_that.month,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month,  double sales,  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossMonthData() when $default != null:
return $default(_that.month,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossMonthData implements ProfitLossMonthData {
  const _ProfitLossMonthData({required this.month, required this.sales, required this.profit});
  

@override final  String month;
@override final  double sales;
@override final  double profit;

/// Create a copy of ProfitLossMonthData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossMonthDataCopyWith<_ProfitLossMonthData> get copyWith => __$ProfitLossMonthDataCopyWithImpl<_ProfitLossMonthData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossMonthData&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'ProfitLossMonthData(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossMonthDataCopyWith<$Res> implements $ProfitLossMonthDataCopyWith<$Res> {
  factory _$ProfitLossMonthDataCopyWith(_ProfitLossMonthData value, $Res Function(_ProfitLossMonthData) _then) = __$ProfitLossMonthDataCopyWithImpl;
@override @useResult
$Res call({
 String month, double sales, double profit
});




}
/// @nodoc
class __$ProfitLossMonthDataCopyWithImpl<$Res>
    implements _$ProfitLossMonthDataCopyWith<$Res> {
  __$ProfitLossMonthDataCopyWithImpl(this._self, this._then);

  final _ProfitLossMonthData _self;
  final $Res Function(_ProfitLossMonthData) _then;

/// Create a copy of ProfitLossMonthData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossMonthData(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
