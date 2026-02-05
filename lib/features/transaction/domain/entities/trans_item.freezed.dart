// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransItem {

 int get id; int get itemId; String get itemName; String get itemCode; double get quantity; double get unitPrice; double get costPrice; double? get taxRate; double? get taxableAmount; double? get taxAmount; double get total;
/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemCopyWith<TransItem> get copyWith => _$TransItemCopyWithImpl<TransItem>(this as TransItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,unitPrice,costPrice,taxRate,taxableAmount,taxAmount,total);

@override
String toString() {
  return 'TransItem(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, taxRate: $taxRate, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class $TransItemCopyWith<$Res>  {
  factory $TransItemCopyWith(TransItem value, $Res Function(TransItem) _then) = _$TransItemCopyWithImpl;
@useResult
$Res call({
 int id, int itemId, String itemName, String itemCode, double quantity, double unitPrice, double costPrice, double? taxRate, double? taxableAmount, double? taxAmount, double total
});




}
/// @nodoc
class _$TransItemCopyWithImpl<$Res>
    implements $TransItemCopyWith<$Res> {
  _$TransItemCopyWithImpl(this._self, this._then);

  final TransItem _self;
  final $Res Function(TransItem) _then;

/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? unitPrice = null,Object? costPrice = null,Object? taxRate = freezed,Object? taxableAmount = freezed,Object? taxAmount = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,taxableAmount: freezed == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TransItem].
extension TransItemPatterns on TransItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransItem value)  $default,){
final _that = this;
switch (_that) {
case _TransItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  double unitPrice,  double costPrice,  double? taxRate,  double? taxableAmount,  double? taxAmount,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItem() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  double unitPrice,  double costPrice,  double? taxRate,  double? taxableAmount,  double? taxAmount,  double total)  $default,) {final _that = this;
switch (_that) {
case _TransItem():
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  double unitPrice,  double costPrice,  double? taxRate,  double? taxableAmount,  double? taxAmount,  double total)?  $default,) {final _that = this;
switch (_that) {
case _TransItem() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _TransItem implements TransItem {
  const _TransItem({required this.id, required this.itemId, required this.itemName, required this.itemCode, required this.quantity, required this.unitPrice, required this.costPrice, this.taxRate, this.taxableAmount, this.taxAmount, required this.total});
  

@override final  int id;
@override final  int itemId;
@override final  String itemName;
@override final  String itemCode;
@override final  double quantity;
@override final  double unitPrice;
@override final  double costPrice;
@override final  double? taxRate;
@override final  double? taxableAmount;
@override final  double? taxAmount;
@override final  double total;

/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransItemCopyWith<_TransItem> get copyWith => __$TransItemCopyWithImpl<_TransItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,unitPrice,costPrice,taxRate,taxableAmount,taxAmount,total);

@override
String toString() {
  return 'TransItem(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, taxRate: $taxRate, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TransItemCopyWith<$Res> implements $TransItemCopyWith<$Res> {
  factory _$TransItemCopyWith(_TransItem value, $Res Function(_TransItem) _then) = __$TransItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int itemId, String itemName, String itemCode, double quantity, double unitPrice, double costPrice, double? taxRate, double? taxableAmount, double? taxAmount, double total
});




}
/// @nodoc
class __$TransItemCopyWithImpl<$Res>
    implements _$TransItemCopyWith<$Res> {
  __$TransItemCopyWithImpl(this._self, this._then);

  final _TransItem _self;
  final $Res Function(_TransItem) _then;

/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? unitPrice = null,Object? costPrice = null,Object? taxRate = freezed,Object? taxableAmount = freezed,Object? taxAmount = freezed,Object? total = null,}) {
  return _then(_TransItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,taxableAmount: freezed == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
