// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionItemDetail {

 int get id; int get itemId; String get itemName; String get itemCode; double get quantity; int get taxRate; double get total; DateTime get createdAt; List<TransactionItemBatchDetail> get batches;
/// Create a copy of TransactionItemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemDetailCopyWith<TransactionItemDetail> get copyWith => _$TransactionItemDetailCopyWithImpl<TransactionItemDetail>(this as TransactionItemDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.total, total) || other.total == total)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.batches, batches));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,taxRate,total,createdAt,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransactionItemDetail(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, taxRate: $taxRate, total: $total, createdAt: $createdAt, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransactionItemDetailCopyWith<$Res>  {
  factory $TransactionItemDetailCopyWith(TransactionItemDetail value, $Res Function(TransactionItemDetail) _then) = _$TransactionItemDetailCopyWithImpl;
@useResult
$Res call({
 int id, int itemId, String itemName, String itemCode, double quantity, int taxRate, double total, DateTime createdAt, List<TransactionItemBatchDetail> batches
});




}
/// @nodoc
class _$TransactionItemDetailCopyWithImpl<$Res>
    implements $TransactionItemDetailCopyWith<$Res> {
  _$TransactionItemDetailCopyWithImpl(this._self, this._then);

  final TransactionItemDetail _self;
  final $Res Function(TransactionItemDetail) _then;

/// Create a copy of TransactionItemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? taxRate = null,Object? total = null,Object? createdAt = null,Object? batches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionItemBatchDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemDetail].
extension TransactionItemDetailPatterns on TransactionItemDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemDetail value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  int taxRate,  double total,  DateTime createdAt,  List<TransactionItemBatchDetail> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemDetail() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  int taxRate,  double total,  DateTime createdAt,  List<TransactionItemBatchDetail> batches)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemDetail():
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int itemId,  String itemName,  String itemCode,  double quantity,  int taxRate,  double total,  DateTime createdAt,  List<TransactionItemBatchDetail> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemDetail() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionItemDetail implements TransactionItemDetail {
  const _TransactionItemDetail({required this.id, required this.itemId, required this.itemName, required this.itemCode, required this.quantity, required this.taxRate, required this.total, required this.createdAt, required final  List<TransactionItemBatchDetail> batches}): _batches = batches;
  

@override final  int id;
@override final  int itemId;
@override final  String itemName;
@override final  String itemCode;
@override final  double quantity;
@override final  int taxRate;
@override final  double total;
@override final  DateTime createdAt;
 final  List<TransactionItemBatchDetail> _batches;
@override List<TransactionItemBatchDetail> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of TransactionItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemDetailCopyWith<_TransactionItemDetail> get copyWith => __$TransactionItemDetailCopyWithImpl<_TransactionItemDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.total, total) || other.total == total)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._batches, _batches));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,taxRate,total,createdAt,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransactionItemDetail(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, taxRate: $taxRate, total: $total, createdAt: $createdAt, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemDetailCopyWith<$Res> implements $TransactionItemDetailCopyWith<$Res> {
  factory _$TransactionItemDetailCopyWith(_TransactionItemDetail value, $Res Function(_TransactionItemDetail) _then) = __$TransactionItemDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, int itemId, String itemName, String itemCode, double quantity, int taxRate, double total, DateTime createdAt, List<TransactionItemBatchDetail> batches
});




}
/// @nodoc
class __$TransactionItemDetailCopyWithImpl<$Res>
    implements _$TransactionItemDetailCopyWith<$Res> {
  __$TransactionItemDetailCopyWithImpl(this._self, this._then);

  final _TransactionItemDetail _self;
  final $Res Function(_TransactionItemDetail) _then;

/// Create a copy of TransactionItemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? taxRate = null,Object? total = null,Object? createdAt = null,Object? batches = null,}) {
  return _then(_TransactionItemDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionItemBatchDetail>,
  ));
}


}

// dart format on
