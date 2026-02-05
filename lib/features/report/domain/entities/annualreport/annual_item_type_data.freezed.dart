// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_item_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualItemTypeData {

 double get sales; double get cost; double get grossProfit;
/// Create a copy of AnnualItemTypeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualItemTypeDataCopyWith<AnnualItemTypeData> get copyWith => _$AnnualItemTypeDataCopyWithImpl<AnnualItemTypeData>(this as AnnualItemTypeData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualItemTypeData&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,grossProfit);

@override
String toString() {
  return 'AnnualItemTypeData(sales: $sales, cost: $cost, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualItemTypeDataCopyWith<$Res>  {
  factory $AnnualItemTypeDataCopyWith(AnnualItemTypeData value, $Res Function(AnnualItemTypeData) _then) = _$AnnualItemTypeDataCopyWithImpl;
@useResult
$Res call({
 double sales, double cost, double grossProfit
});




}
/// @nodoc
class _$AnnualItemTypeDataCopyWithImpl<$Res>
    implements $AnnualItemTypeDataCopyWith<$Res> {
  _$AnnualItemTypeDataCopyWithImpl(this._self, this._then);

  final AnnualItemTypeData _self;
  final $Res Function(AnnualItemTypeData) _then;

/// Create a copy of AnnualItemTypeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sales = null,Object? cost = null,Object? grossProfit = null,}) {
  return _then(_self.copyWith(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnualItemTypeData].
extension AnnualItemTypeDataPatterns on AnnualItemTypeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualItemTypeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualItemTypeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualItemTypeData value)  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualItemTypeData value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double sales,  double cost,  double grossProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualItemTypeData() when $default != null:
return $default(_that.sales,_that.cost,_that.grossProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double sales,  double cost,  double grossProfit)  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypeData():
return $default(_that.sales,_that.cost,_that.grossProfit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double sales,  double cost,  double grossProfit)?  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypeData() when $default != null:
return $default(_that.sales,_that.cost,_that.grossProfit);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualItemTypeData implements AnnualItemTypeData {
  const _AnnualItemTypeData({required this.sales, required this.cost, required this.grossProfit});
  

@override final  double sales;
@override final  double cost;
@override final  double grossProfit;

/// Create a copy of AnnualItemTypeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualItemTypeDataCopyWith<_AnnualItemTypeData> get copyWith => __$AnnualItemTypeDataCopyWithImpl<_AnnualItemTypeData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualItemTypeData&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}


@override
int get hashCode => Object.hash(runtimeType,sales,cost,grossProfit);

@override
String toString() {
  return 'AnnualItemTypeData(sales: $sales, cost: $cost, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualItemTypeDataCopyWith<$Res> implements $AnnualItemTypeDataCopyWith<$Res> {
  factory _$AnnualItemTypeDataCopyWith(_AnnualItemTypeData value, $Res Function(_AnnualItemTypeData) _then) = __$AnnualItemTypeDataCopyWithImpl;
@override @useResult
$Res call({
 double sales, double cost, double grossProfit
});




}
/// @nodoc
class __$AnnualItemTypeDataCopyWithImpl<$Res>
    implements _$AnnualItemTypeDataCopyWith<$Res> {
  __$AnnualItemTypeDataCopyWithImpl(this._self, this._then);

  final _AnnualItemTypeData _self;
  final $Res Function(_AnnualItemTypeData) _then;

/// Create a copy of AnnualItemTypeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? cost = null,Object? grossProfit = null,}) {
  return _then(_AnnualItemTypeData(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
