// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_stock_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LowStockProduct {

 int get id; String get name; String? get imageUrl; String? get code; int get stock;
/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockProductCopyWith<LowStockProduct> get copyWith => _$LowStockProductCopyWithImpl<LowStockProduct>(this as LowStockProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.code, code) || other.code == code)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,code,stock);

@override
String toString() {
  return 'LowStockProduct(id: $id, name: $name, imageUrl: $imageUrl, code: $code, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $LowStockProductCopyWith<$Res>  {
  factory $LowStockProductCopyWith(LowStockProduct value, $Res Function(LowStockProduct) _then) = _$LowStockProductCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? imageUrl, String? code, int stock
});




}
/// @nodoc
class _$LowStockProductCopyWithImpl<$Res>
    implements $LowStockProductCopyWith<$Res> {
  _$LowStockProductCopyWithImpl(this._self, this._then);

  final LowStockProduct _self;
  final $Res Function(LowStockProduct) _then;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? code = freezed,Object? stock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockProduct].
extension LowStockProductPatterns on LowStockProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockProduct value)  $default,){
final _that = this;
switch (_that) {
case _LowStockProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockProduct value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  String? code,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? imageUrl,  String? code,  int stock)  $default,) {final _that = this;
switch (_that) {
case _LowStockProduct():
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? imageUrl,  String? code,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _LowStockProduct implements LowStockProduct {
  const _LowStockProduct({required this.id, required this.name, this.imageUrl, this.code, required this.stock});
  

@override final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? code;
@override final  int stock;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockProductCopyWith<_LowStockProduct> get copyWith => __$LowStockProductCopyWithImpl<_LowStockProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.code, code) || other.code == code)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,code,stock);

@override
String toString() {
  return 'LowStockProduct(id: $id, name: $name, imageUrl: $imageUrl, code: $code, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$LowStockProductCopyWith<$Res> implements $LowStockProductCopyWith<$Res> {
  factory _$LowStockProductCopyWith(_LowStockProduct value, $Res Function(_LowStockProduct) _then) = __$LowStockProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? imageUrl, String? code, int stock
});




}
/// @nodoc
class __$LowStockProductCopyWithImpl<$Res>
    implements _$LowStockProductCopyWith<$Res> {
  __$LowStockProductCopyWithImpl(this._self, this._then);

  final _LowStockProduct _self;
  final $Res Function(_LowStockProduct) _then;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? code = freezed,Object? stock = null,}) {
  return _then(_LowStockProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
