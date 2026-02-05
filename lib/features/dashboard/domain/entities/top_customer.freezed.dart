// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopCustomer {

 int get id; String get name; String? get imageUrl; String? get location; int get orders; double get total;
/// Create a copy of TopCustomer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopCustomerCopyWith<TopCustomer> get copyWith => _$TopCustomerCopyWithImpl<TopCustomer>(this as TopCustomer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,location,orders,total);

@override
String toString() {
  return 'TopCustomer(id: $id, name: $name, imageUrl: $imageUrl, location: $location, orders: $orders, total: $total)';
}


}

/// @nodoc
abstract mixin class $TopCustomerCopyWith<$Res>  {
  factory $TopCustomerCopyWith(TopCustomer value, $Res Function(TopCustomer) _then) = _$TopCustomerCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imageUrl, String? location, int orders, double total
});




}
/// @nodoc
class _$TopCustomerCopyWithImpl<$Res>
    implements $TopCustomerCopyWith<$Res> {
  _$TopCustomerCopyWithImpl(this._self, this._then);

  final TopCustomer _self;
  final $Res Function(TopCustomer) _then;

/// Create a copy of TopCustomer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? location = freezed,Object? orders = null,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopCustomer].
extension TopCustomerPatterns on TopCustomer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopCustomer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopCustomer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopCustomer value)  $default,){
final _that = this;
switch (_that) {
case _TopCustomer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopCustomer value)?  $default,){
final _that = this;
switch (_that) {
case _TopCustomer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  String? location,  int orders,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopCustomer() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  String? location,  int orders,  double total)  $default,) {final _that = this;
switch (_that) {
case _TopCustomer():
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imageUrl,  String? location,  int orders,  double total)?  $default,) {final _that = this;
switch (_that) {
case _TopCustomer() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _TopCustomer implements TopCustomer {
  const _TopCustomer({required this.id, required this.name, this.imageUrl, this.location, required this.orders, required this.total});
  

@override final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? location;
@override final  int orders;
@override final  double total;

/// Create a copy of TopCustomer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopCustomerCopyWith<_TopCustomer> get copyWith => __$TopCustomerCopyWithImpl<_TopCustomer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,location,orders,total);

@override
String toString() {
  return 'TopCustomer(id: $id, name: $name, imageUrl: $imageUrl, location: $location, orders: $orders, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TopCustomerCopyWith<$Res> implements $TopCustomerCopyWith<$Res> {
  factory _$TopCustomerCopyWith(_TopCustomer value, $Res Function(_TopCustomer) _then) = __$TopCustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imageUrl, String? location, int orders, double total
});




}
/// @nodoc
class __$TopCustomerCopyWithImpl<$Res>
    implements _$TopCustomerCopyWith<$Res> {
  __$TopCustomerCopyWithImpl(this._self, this._then);

  final _TopCustomer _self;
  final $Res Function(_TopCustomer) _then;

/// Create a copy of TopCustomer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? location = freezed,Object? orders = null,Object? total = null,}) {
  return _then(_TopCustomer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
