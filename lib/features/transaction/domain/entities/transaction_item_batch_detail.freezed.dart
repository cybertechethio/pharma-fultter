// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_batch_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionItemBatchDetail {

 int get id; String get batchNumber; double get quantity; double get costPrice; double get unitPrice; double get taxableAmount; double get taxAmount; double get total; DateTime? get expirationDate; String get allocatedFrom; DateTime get createdAt;
/// Create a copy of TransactionItemBatchDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemBatchDetailCopyWith<TransactionItemBatchDetail> get copyWith => _$TransactionItemBatchDetailCopyWithImpl<TransactionItemBatchDetail>(this as TransactionItemBatchDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemBatchDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,quantity,costPrice,unitPrice,taxableAmount,taxAmount,total,expirationDate,allocatedFrom,createdAt);

@override
String toString() {
  return 'TransactionItemBatchDetail(id: $id, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionItemBatchDetailCopyWith<$Res>  {
  factory $TransactionItemBatchDetailCopyWith(TransactionItemBatchDetail value, $Res Function(TransactionItemBatchDetail) _then) = _$TransactionItemBatchDetailCopyWithImpl;
@useResult
$Res call({
 int id, String batchNumber, double quantity, double costPrice, double unitPrice, double taxableAmount, double taxAmount, double total, DateTime? expirationDate, String allocatedFrom, DateTime createdAt
});




}
/// @nodoc
class _$TransactionItemBatchDetailCopyWithImpl<$Res>
    implements $TransactionItemBatchDetailCopyWith<$Res> {
  _$TransactionItemBatchDetailCopyWithImpl(this._self, this._then);

  final TransactionItemBatchDetail _self;
  final $Res Function(TransactionItemBatchDetail) _then;

/// Create a copy of TransactionItemBatchDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? taxableAmount = null,Object? taxAmount = null,Object? total = null,Object? expirationDate = freezed,Object? allocatedFrom = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,taxableAmount: null == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: null == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemBatchDetail].
extension TransactionItemBatchDetailPatterns on TransactionItemBatchDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemBatchDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemBatchDetail value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemBatchDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String batchNumber,  double quantity,  double costPrice,  double unitPrice,  double taxableAmount,  double taxAmount,  double total,  DateTime? expirationDate,  String allocatedFrom,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetail() when $default != null:
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String batchNumber,  double quantity,  double costPrice,  double unitPrice,  double taxableAmount,  double taxAmount,  double total,  DateTime? expirationDate,  String allocatedFrom,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetail():
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String batchNumber,  double quantity,  double costPrice,  double unitPrice,  double taxableAmount,  double taxAmount,  double total,  DateTime? expirationDate,  String allocatedFrom,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetail() when $default != null:
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionItemBatchDetail implements TransactionItemBatchDetail {
  const _TransactionItemBatchDetail({required this.id, required this.batchNumber, required this.quantity, required this.costPrice, required this.unitPrice, required this.taxableAmount, required this.taxAmount, required this.total, this.expirationDate, required this.allocatedFrom, required this.createdAt});
  

@override final  int id;
@override final  String batchNumber;
@override final  double quantity;
@override final  double costPrice;
@override final  double unitPrice;
@override final  double taxableAmount;
@override final  double taxAmount;
@override final  double total;
@override final  DateTime? expirationDate;
@override final  String allocatedFrom;
@override final  DateTime createdAt;

/// Create a copy of TransactionItemBatchDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemBatchDetailCopyWith<_TransactionItemBatchDetail> get copyWith => __$TransactionItemBatchDetailCopyWithImpl<_TransactionItemBatchDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemBatchDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,quantity,costPrice,unitPrice,taxableAmount,taxAmount,total,expirationDate,allocatedFrom,createdAt);

@override
String toString() {
  return 'TransactionItemBatchDetail(id: $id, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemBatchDetailCopyWith<$Res> implements $TransactionItemBatchDetailCopyWith<$Res> {
  factory _$TransactionItemBatchDetailCopyWith(_TransactionItemBatchDetail value, $Res Function(_TransactionItemBatchDetail) _then) = __$TransactionItemBatchDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String batchNumber, double quantity, double costPrice, double unitPrice, double taxableAmount, double taxAmount, double total, DateTime? expirationDate, String allocatedFrom, DateTime createdAt
});




}
/// @nodoc
class __$TransactionItemBatchDetailCopyWithImpl<$Res>
    implements _$TransactionItemBatchDetailCopyWith<$Res> {
  __$TransactionItemBatchDetailCopyWithImpl(this._self, this._then);

  final _TransactionItemBatchDetail _self;
  final $Res Function(_TransactionItemBatchDetail) _then;

/// Create a copy of TransactionItemBatchDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? taxableAmount = null,Object? taxAmount = null,Object? total = null,Object? expirationDate = freezed,Object? allocatedFrom = null,Object? createdAt = null,}) {
  return _then(_TransactionItemBatchDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,taxableAmount: null == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: null == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
