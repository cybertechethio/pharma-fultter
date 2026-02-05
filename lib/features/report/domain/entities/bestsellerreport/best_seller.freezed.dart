// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'best_seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BestSeller {

 int get id; int get itemId; String get itemName; String? get itemCode; String? get sku; String? get category; String? get brand; String? get imageUrl; int get soldQty; double get soldAmount; int get instockQty;
/// Create a copy of BestSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BestSellerCopyWith<BestSeller> get copyWith => _$BestSellerCopyWithImpl<BestSeller>(this as BestSeller, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BestSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.soldQty, soldQty) || other.soldQty == soldQty)&&(identical(other.soldAmount, soldAmount) || other.soldAmount == soldAmount)&&(identical(other.instockQty, instockQty) || other.instockQty == instockQty));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,sku,category,brand,imageUrl,soldQty,soldAmount,instockQty);

@override
String toString() {
  return 'BestSeller(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, sku: $sku, category: $category, brand: $brand, imageUrl: $imageUrl, soldQty: $soldQty, soldAmount: $soldAmount, instockQty: $instockQty)';
}


}

/// @nodoc
abstract mixin class $BestSellerCopyWith<$Res>  {
  factory $BestSellerCopyWith(BestSeller value, $Res Function(BestSeller) _then) = _$BestSellerCopyWithImpl;
@useResult
$Res call({
 int id, int itemId, String itemName, String? itemCode, String? sku, String? category, String? brand, String? imageUrl, int soldQty, double soldAmount, int instockQty
});




}
/// @nodoc
class _$BestSellerCopyWithImpl<$Res>
    implements $BestSellerCopyWith<$Res> {
  _$BestSellerCopyWithImpl(this._self, this._then);

  final BestSeller _self;
  final $Res Function(BestSeller) _then;

/// Create a copy of BestSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = freezed,Object? sku = freezed,Object? category = freezed,Object? brand = freezed,Object? imageUrl = freezed,Object? soldQty = null,Object? soldAmount = null,Object? instockQty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,soldQty: null == soldQty ? _self.soldQty : soldQty // ignore: cast_nullable_to_non_nullable
as int,soldAmount: null == soldAmount ? _self.soldAmount : soldAmount // ignore: cast_nullable_to_non_nullable
as double,instockQty: null == instockQty ? _self.instockQty : instockQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BestSeller].
extension BestSellerPatterns on BestSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BestSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BestSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BestSeller value)  $default,){
final _that = this;
switch (_that) {
case _BestSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BestSeller value)?  $default,){
final _that = this;
switch (_that) {
case _BestSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int soldQty,  double soldAmount,  int instockQty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BestSeller() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.soldQty,_that.soldAmount,_that.instockQty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int soldQty,  double soldAmount,  int instockQty)  $default,) {final _that = this;
switch (_that) {
case _BestSeller():
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.soldQty,_that.soldAmount,_that.instockQty);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int soldQty,  double soldAmount,  int instockQty)?  $default,) {final _that = this;
switch (_that) {
case _BestSeller() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.soldQty,_that.soldAmount,_that.instockQty);case _:
  return null;

}
}

}

/// @nodoc


class _BestSeller implements BestSeller {
  const _BestSeller({required this.id, required this.itemId, required this.itemName, this.itemCode, this.sku, this.category, this.brand, this.imageUrl, required this.soldQty, required this.soldAmount, required this.instockQty});
  

@override final  int id;
@override final  int itemId;
@override final  String itemName;
@override final  String? itemCode;
@override final  String? sku;
@override final  String? category;
@override final  String? brand;
@override final  String? imageUrl;
@override final  int soldQty;
@override final  double soldAmount;
@override final  int instockQty;

/// Create a copy of BestSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BestSellerCopyWith<_BestSeller> get copyWith => __$BestSellerCopyWithImpl<_BestSeller>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BestSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.soldQty, soldQty) || other.soldQty == soldQty)&&(identical(other.soldAmount, soldAmount) || other.soldAmount == soldAmount)&&(identical(other.instockQty, instockQty) || other.instockQty == instockQty));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,sku,category,brand,imageUrl,soldQty,soldAmount,instockQty);

@override
String toString() {
  return 'BestSeller(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, sku: $sku, category: $category, brand: $brand, imageUrl: $imageUrl, soldQty: $soldQty, soldAmount: $soldAmount, instockQty: $instockQty)';
}


}

/// @nodoc
abstract mixin class _$BestSellerCopyWith<$Res> implements $BestSellerCopyWith<$Res> {
  factory _$BestSellerCopyWith(_BestSeller value, $Res Function(_BestSeller) _then) = __$BestSellerCopyWithImpl;
@override @useResult
$Res call({
 int id, int itemId, String itemName, String? itemCode, String? sku, String? category, String? brand, String? imageUrl, int soldQty, double soldAmount, int instockQty
});




}
/// @nodoc
class __$BestSellerCopyWithImpl<$Res>
    implements _$BestSellerCopyWith<$Res> {
  __$BestSellerCopyWithImpl(this._self, this._then);

  final _BestSeller _self;
  final $Res Function(_BestSeller) _then;

/// Create a copy of BestSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = freezed,Object? sku = freezed,Object? category = freezed,Object? brand = freezed,Object? imageUrl = freezed,Object? soldQty = null,Object? soldAmount = null,Object? instockQty = null,}) {
  return _then(_BestSeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,soldQty: null == soldQty ? _self.soldQty : soldQty // ignore: cast_nullable_to_non_nullable
as int,soldAmount: null == soldAmount ? _self.soldAmount : soldAmount // ignore: cast_nullable_to_non_nullable
as double,instockQty: null == instockQty ? _self.instockQty : instockQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
