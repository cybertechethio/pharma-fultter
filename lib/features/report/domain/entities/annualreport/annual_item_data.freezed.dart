// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualItemData {

 double get sales; double get cost; double get vat; double get grossProfit;
/// Create a copy of AnnualItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualItemDataCopyWith<AnnualItemData> get copyWith => _$AnnualItemDataCopyWithImpl<AnnualItemData>(this as AnnualItemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualItemData&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualItemData(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualItemDataCopyWith<$Res>  {
  factory $AnnualItemDataCopyWith(AnnualItemData value, $Res Function(AnnualItemData) _then) = _$AnnualItemDataCopyWithImpl;
@useResult
$Res call({
 double sales, double cost, double vat, double grossProfit
});




}
/// @nodoc
class _$AnnualItemDataCopyWithImpl<$Res>
    implements $AnnualItemDataCopyWith<$Res> {
  _$AnnualItemDataCopyWithImpl(this._self, this._then);

  final AnnualItemData _self;
  final $Res Function(AnnualItemData) _then;

/// Create a copy of AnnualItemData
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


/// Adds pattern-matching-related methods to [AnnualItemData].
extension AnnualItemDataPatterns on AnnualItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualItemData value)  $default,){
final _that = this;
switch (_that) {
case _AnnualItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualItemData value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualItemData() when $default != null:
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
case _AnnualItemData() when $default != null:
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
case _AnnualItemData():
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
case _AnnualItemData() when $default != null:
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualItemData implements AnnualItemData {
  const _AnnualItemData({required this.sales, required this.cost, required this.vat, required this.grossProfit});
  

@override final  double sales;
@override final  double cost;
@override final  double vat;
@override final  double grossProfit;

/// Create a copy of AnnualItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualItemDataCopyWith<_AnnualItemData> get copyWith => __$AnnualItemDataCopyWithImpl<_AnnualItemData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualItemData&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualItemData(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualItemDataCopyWith<$Res> implements $AnnualItemDataCopyWith<$Res> {
  factory _$AnnualItemDataCopyWith(_AnnualItemData value, $Res Function(_AnnualItemData) _then) = __$AnnualItemDataCopyWithImpl;
@override @useResult
$Res call({
 double sales, double cost, double vat, double grossProfit
});




}
/// @nodoc
class __$AnnualItemDataCopyWithImpl<$Res>
    implements _$AnnualItemDataCopyWith<$Res> {
  __$AnnualItemDataCopyWithImpl(this._self, this._then);

  final _AnnualItemData _self;
  final $Res Function(_AnnualItemData) _then;

/// Create a copy of AnnualItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? cost = null,Object? vat = null,Object? grossProfit = null,}) {
  return _then(_AnnualItemData(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,vat: null == vat ? _self.vat : vat // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
