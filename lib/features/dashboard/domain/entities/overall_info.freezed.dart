// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overall_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverallInfo {

 int get suppliers; int get customers; int get orders;
/// Create a copy of OverallInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverallInfoCopyWith<OverallInfo> get copyWith => _$OverallInfoCopyWithImpl<OverallInfo>(this as OverallInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverallInfo&&(identical(other.suppliers, suppliers) || other.suppliers == suppliers)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.orders, orders) || other.orders == orders));
}


@override
int get hashCode => Object.hash(runtimeType,suppliers,customers,orders);

@override
String toString() {
  return 'OverallInfo(suppliers: $suppliers, customers: $customers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $OverallInfoCopyWith<$Res>  {
  factory $OverallInfoCopyWith(OverallInfo value, $Res Function(OverallInfo) _then) = _$OverallInfoCopyWithImpl;
@useResult
$Res call({
 int suppliers, int customers, int orders
});




}
/// @nodoc
class _$OverallInfoCopyWithImpl<$Res>
    implements $OverallInfoCopyWith<$Res> {
  _$OverallInfoCopyWithImpl(this._self, this._then);

  final OverallInfo _self;
  final $Res Function(OverallInfo) _then;

/// Create a copy of OverallInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suppliers = null,Object? customers = null,Object? orders = null,}) {
  return _then(_self.copyWith(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as int,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OverallInfo].
extension OverallInfoPatterns on OverallInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverallInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverallInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverallInfo value)  $default,){
final _that = this;
switch (_that) {
case _OverallInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverallInfo value)?  $default,){
final _that = this;
switch (_that) {
case _OverallInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int suppliers,  int customers,  int orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverallInfo() when $default != null:
return $default(_that.suppliers,_that.customers,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int suppliers,  int customers,  int orders)  $default,) {final _that = this;
switch (_that) {
case _OverallInfo():
return $default(_that.suppliers,_that.customers,_that.orders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int suppliers,  int customers,  int orders)?  $default,) {final _that = this;
switch (_that) {
case _OverallInfo() when $default != null:
return $default(_that.suppliers,_that.customers,_that.orders);case _:
  return null;

}
}

}

/// @nodoc


class _OverallInfo implements OverallInfo {
  const _OverallInfo({required this.suppliers, required this.customers, required this.orders});
  

@override final  int suppliers;
@override final  int customers;
@override final  int orders;

/// Create a copy of OverallInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverallInfoCopyWith<_OverallInfo> get copyWith => __$OverallInfoCopyWithImpl<_OverallInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverallInfo&&(identical(other.suppliers, suppliers) || other.suppliers == suppliers)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.orders, orders) || other.orders == orders));
}


@override
int get hashCode => Object.hash(runtimeType,suppliers,customers,orders);

@override
String toString() {
  return 'OverallInfo(suppliers: $suppliers, customers: $customers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$OverallInfoCopyWith<$Res> implements $OverallInfoCopyWith<$Res> {
  factory _$OverallInfoCopyWith(_OverallInfo value, $Res Function(_OverallInfo) _then) = __$OverallInfoCopyWithImpl;
@override @useResult
$Res call({
 int suppliers, int customers, int orders
});




}
/// @nodoc
class __$OverallInfoCopyWithImpl<$Res>
    implements _$OverallInfoCopyWith<$Res> {
  __$OverallInfoCopyWithImpl(this._self, this._then);

  final _OverallInfo _self;
  final $Res Function(_OverallInfo) _then;

/// Create a copy of OverallInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suppliers = null,Object? customers = null,Object? orders = null,}) {
  return _then(_OverallInfo(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as int,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
