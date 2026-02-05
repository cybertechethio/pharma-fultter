// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_selling_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopSellingProduct {

 int get id; String get name; String? get imageUrl; double get price; int get sales; double get growth;
/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductCopyWith<TopSellingProduct> get copyWith => _$TopSellingProductCopyWithImpl<TopSellingProduct>(this as TopSellingProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.growth, growth) || other.growth == growth));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,sales,growth);

@override
String toString() {
  return 'TopSellingProduct(id: $id, name: $name, imageUrl: $imageUrl, price: $price, sales: $sales, growth: $growth)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductCopyWith<$Res>  {
  factory $TopSellingProductCopyWith(TopSellingProduct value, $Res Function(TopSellingProduct) _then) = _$TopSellingProductCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imageUrl, double price, int sales, double growth
});




}
/// @nodoc
class _$TopSellingProductCopyWithImpl<$Res>
    implements $TopSellingProductCopyWith<$Res> {
  _$TopSellingProductCopyWithImpl(this._self, this._then);

  final TopSellingProduct _self;
  final $Res Function(TopSellingProduct) _then;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? price = null,Object? sales = null,Object? growth = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,growth: null == growth ? _self.growth : growth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProduct].
extension TopSellingProductPatterns on TopSellingProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProduct value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProduct value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  double price,  int sales,  double growth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  double price,  int sales,  double growth)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProduct():
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imageUrl,  double price,  int sales,  double growth)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);case _:
  return null;

}
}

}

/// @nodoc


class _TopSellingProduct implements TopSellingProduct {
  const _TopSellingProduct({required this.id, required this.name, this.imageUrl, required this.price, required this.sales, required this.growth});
  

@override final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  double price;
@override final  int sales;
@override final  double growth;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductCopyWith<_TopSellingProduct> get copyWith => __$TopSellingProductCopyWithImpl<_TopSellingProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.growth, growth) || other.growth == growth));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,sales,growth);

@override
String toString() {
  return 'TopSellingProduct(id: $id, name: $name, imageUrl: $imageUrl, price: $price, sales: $sales, growth: $growth)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductCopyWith<$Res> implements $TopSellingProductCopyWith<$Res> {
  factory _$TopSellingProductCopyWith(_TopSellingProduct value, $Res Function(_TopSellingProduct) _then) = __$TopSellingProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imageUrl, double price, int sales, double growth
});




}
/// @nodoc
class __$TopSellingProductCopyWithImpl<$Res>
    implements _$TopSellingProductCopyWith<$Res> {
  __$TopSellingProductCopyWithImpl(this._self, this._then);

  final _TopSellingProduct _self;
  final $Res Function(_TopSellingProduct) _then;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? price = null,Object? sales = null,Object? growth = null,}) {
  return _then(_TopSellingProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,growth: null == growth ? _self.growth : growth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
