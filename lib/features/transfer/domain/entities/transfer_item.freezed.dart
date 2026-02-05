// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferItem {

 int get id; String get itemName; String? get itemCode; double get quantity; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of TransferItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferItemCopyWith<TransferItem> get copyWith => _$TransferItemCopyWithImpl<TransferItem>(this as TransferItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,createdAt,updatedAt);

@override
String toString() {
  return 'TransferItem(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TransferItemCopyWith<$Res>  {
  factory $TransferItemCopyWith(TransferItem value, $Res Function(TransferItem) _then) = _$TransferItemCopyWithImpl;
@useResult
$Res call({
 int id, String itemName, String? itemCode, double quantity, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TransferItemCopyWithImpl<$Res>
    implements $TransferItemCopyWith<$Res> {
  _$TransferItemCopyWithImpl(this._self, this._then);

  final TransferItem _self;
  final $Res Function(TransferItem) _then;

/// Create a copy of TransferItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemName = null,Object? itemCode = freezed,Object? quantity = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferItem].
extension TransferItemPatterns on TransferItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferItem value)  $default,){
final _that = this;
switch (_that) {
case _TransferItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransferItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String itemName,  String? itemCode,  double quantity,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferItem() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String itemName,  String? itemCode,  double quantity,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TransferItem():
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String itemName,  String? itemCode,  double quantity,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TransferItem() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TransferItem implements TransferItem {
  const _TransferItem({required this.id, required this.itemName, this.itemCode, required this.quantity, this.createdAt, this.updatedAt});
  

@override final  int id;
@override final  String itemName;
@override final  String? itemCode;
@override final  double quantity;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of TransferItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferItemCopyWith<_TransferItem> get copyWith => __$TransferItemCopyWithImpl<_TransferItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,createdAt,updatedAt);

@override
String toString() {
  return 'TransferItem(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TransferItemCopyWith<$Res> implements $TransferItemCopyWith<$Res> {
  factory _$TransferItemCopyWith(_TransferItem value, $Res Function(_TransferItem) _then) = __$TransferItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String itemName, String? itemCode, double quantity, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$TransferItemCopyWithImpl<$Res>
    implements _$TransferItemCopyWith<$Res> {
  __$TransferItemCopyWithImpl(this._self, this._then);

  final _TransferItem _self;
  final $Res Function(_TransferItem) _then;

/// Create a copy of TransferItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemName = null,Object? itemCode = freezed,Object? quantity = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TransferItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
