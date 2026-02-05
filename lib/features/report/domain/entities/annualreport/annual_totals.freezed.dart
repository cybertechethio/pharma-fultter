// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_totals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualTotals {

 double get sales; double get cost; double get vat; double get grossProfit;
/// Create a copy of AnnualTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualTotalsCopyWith<AnnualTotals> get copyWith => _$AnnualTotalsCopyWithImpl<AnnualTotals>(this as AnnualTotals, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualTotals&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualTotals(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualTotalsCopyWith<$Res>  {
  factory $AnnualTotalsCopyWith(AnnualTotals value, $Res Function(AnnualTotals) _then) = _$AnnualTotalsCopyWithImpl;
@useResult
$Res call({
 double sales, double cost, double vat, double grossProfit
});




}
/// @nodoc
class _$AnnualTotalsCopyWithImpl<$Res>
    implements $AnnualTotalsCopyWith<$Res> {
  _$AnnualTotalsCopyWithImpl(this._self, this._then);

  final AnnualTotals _self;
  final $Res Function(AnnualTotals) _then;

/// Create a copy of AnnualTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sales = null,Object? cost = null,Object? vat = null,Object? grossProfit = null,}) {
  return _then(_self.copyWith(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,vat: null == vat ? _self.vat : vat // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnualTotals].
extension AnnualTotalsPatterns on AnnualTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualTotals value)  $default,){
final _that = this;
switch (_that) {
case _AnnualTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualTotals value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double sales,  double cost,  double vat,  double grossProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualTotals() when $default != null:
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double sales,  double cost,  double vat,  double grossProfit)  $default,) {final _that = this;
switch (_that) {
case _AnnualTotals():
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double sales,  double cost,  double vat,  double grossProfit)?  $default,) {final _that = this;
switch (_that) {
case _AnnualTotals() when $default != null:
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualTotals implements AnnualTotals {
  const _AnnualTotals({required this.sales, required this.cost, required this.vat, required this.grossProfit});
  

@override final  double sales;
@override final  double cost;
@override final  double vat;
@override final  double grossProfit;

/// Create a copy of AnnualTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualTotalsCopyWith<_AnnualTotals> get copyWith => __$AnnualTotalsCopyWithImpl<_AnnualTotals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualTotals&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualTotals(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualTotalsCopyWith<$Res> implements $AnnualTotalsCopyWith<$Res> {
  factory _$AnnualTotalsCopyWith(_AnnualTotals value, $Res Function(_AnnualTotals) _then) = __$AnnualTotalsCopyWithImpl;
@override @useResult
$Res call({
 double sales, double cost, double vat, double grossProfit
});




}
/// @nodoc
class __$AnnualTotalsCopyWithImpl<$Res>
    implements _$AnnualTotalsCopyWith<$Res> {
  __$AnnualTotalsCopyWithImpl(this._self, this._then);

  final _AnnualTotals _self;
  final $Res Function(_AnnualTotals) _then;

/// Create a copy of AnnualTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? cost = null,Object? vat = null,Object? grossProfit = null,}) {
  return _then(_AnnualTotals(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,vat: null == vat ? _self.vat : vat // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
