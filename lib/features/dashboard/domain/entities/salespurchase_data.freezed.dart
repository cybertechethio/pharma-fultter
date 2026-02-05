// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salespurchase_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesPurchaseData {

 DateTime get date; double get sales; double get purchase;
/// Create a copy of SalesPurchaseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesPurchaseDataCopyWith<SalesPurchaseData> get copyWith => _$SalesPurchaseDataCopyWithImpl<SalesPurchaseData>(this as SalesPurchaseData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesPurchaseData&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}


@override
int get hashCode => Object.hash(runtimeType,date,sales,purchase);

@override
String toString() {
  return 'SalesPurchaseData(date: $date, sales: $sales, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class $SalesPurchaseDataCopyWith<$Res>  {
  factory $SalesPurchaseDataCopyWith(SalesPurchaseData value, $Res Function(SalesPurchaseData) _then) = _$SalesPurchaseDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, double sales, double purchase
});




}
/// @nodoc
class _$SalesPurchaseDataCopyWithImpl<$Res>
    implements $SalesPurchaseDataCopyWith<$Res> {
  _$SalesPurchaseDataCopyWithImpl(this._self, this._then);

  final SalesPurchaseData _self;
  final $Res Function(SalesPurchaseData) _then;

/// Create a copy of SalesPurchaseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sales = null,Object? purchase = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesPurchaseData].
extension SalesPurchaseDataPatterns on SalesPurchaseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesPurchaseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesPurchaseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesPurchaseData value)  $default,){
final _that = this;
switch (_that) {
case _SalesPurchaseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesPurchaseData value)?  $default,){
final _that = this;
switch (_that) {
case _SalesPurchaseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double sales,  double purchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesPurchaseData() when $default != null:
return $default(_that.date,_that.sales,_that.purchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double sales,  double purchase)  $default,) {final _that = this;
switch (_that) {
case _SalesPurchaseData():
return $default(_that.date,_that.sales,_that.purchase);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double sales,  double purchase)?  $default,) {final _that = this;
switch (_that) {
case _SalesPurchaseData() when $default != null:
return $default(_that.date,_that.sales,_that.purchase);case _:
  return null;

}
}

}

/// @nodoc


class _SalesPurchaseData implements SalesPurchaseData {
  const _SalesPurchaseData({required this.date, required this.sales, required this.purchase});
  

@override final  DateTime date;
@override final  double sales;
@override final  double purchase;

/// Create a copy of SalesPurchaseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesPurchaseDataCopyWith<_SalesPurchaseData> get copyWith => __$SalesPurchaseDataCopyWithImpl<_SalesPurchaseData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesPurchaseData&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}


@override
int get hashCode => Object.hash(runtimeType,date,sales,purchase);

@override
String toString() {
  return 'SalesPurchaseData(date: $date, sales: $sales, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class _$SalesPurchaseDataCopyWith<$Res> implements $SalesPurchaseDataCopyWith<$Res> {
  factory _$SalesPurchaseDataCopyWith(_SalesPurchaseData value, $Res Function(_SalesPurchaseData) _then) = __$SalesPurchaseDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double sales, double purchase
});




}
/// @nodoc
class __$SalesPurchaseDataCopyWithImpl<$Res>
    implements _$SalesPurchaseDataCopyWith<$Res> {
  __$SalesPurchaseDataCopyWithImpl(this._self, this._then);

  final _SalesPurchaseData _self;
  final $Res Function(_SalesPurchaseData) _then;

/// Create a copy of SalesPurchaseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sales = null,Object? purchase = null,}) {
  return _then(_SalesPurchaseData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
