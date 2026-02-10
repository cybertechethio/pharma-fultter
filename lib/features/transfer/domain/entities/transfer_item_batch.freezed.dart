// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_item_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferItemBatch {

 int get id; int? get transferItemId; String get batchNumber; int get quantity; double? get costPrice; double? get unitPrice; DateTime? get expirationDate;
/// Create a copy of TransferItemBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferItemBatchCopyWith<TransferItemBatch> get copyWith => _$TransferItemBatchCopyWithImpl<TransferItemBatch>(this as TransferItemBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferItemBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.transferItemId, transferItemId) || other.transferItemId == transferItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,transferItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransferItemBatch(id: $id, transferItemId: $transferItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $TransferItemBatchCopyWith<$Res>  {
  factory $TransferItemBatchCopyWith(TransferItemBatch value, $Res Function(TransferItemBatch) _then) = _$TransferItemBatchCopyWithImpl;
@useResult
$Res call({
 int id, int? transferItemId, String batchNumber, int quantity, double? costPrice, double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class _$TransferItemBatchCopyWithImpl<$Res>
    implements $TransferItemBatchCopyWith<$Res> {
  _$TransferItemBatchCopyWithImpl(this._self, this._then);

  final TransferItemBatch _self;
  final $Res Function(TransferItemBatch) _then;

/// Create a copy of TransferItemBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transferItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferItemId: freezed == transferItemId ? _self.transferItemId : transferItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferItemBatch].
extension TransferItemBatchPatterns on TransferItemBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferItemBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferItemBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferItemBatch value)  $default,){
final _that = this;
switch (_that) {
case _TransferItemBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferItemBatch value)?  $default,){
final _that = this;
switch (_that) {
case _TransferItemBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? transferItemId,  String batchNumber,  int quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferItemBatch() when $default != null:
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? transferItemId,  String batchNumber,  int quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _TransferItemBatch():
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? transferItemId,  String batchNumber,  int quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _TransferItemBatch() when $default != null:
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc


class _TransferItemBatch implements TransferItemBatch {
  const _TransferItemBatch({required this.id, this.transferItemId, required this.batchNumber, required this.quantity, this.costPrice, this.unitPrice, this.expirationDate});
  

@override final  int id;
@override final  int? transferItemId;
@override final  String batchNumber;
@override final  int quantity;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  DateTime? expirationDate;

/// Create a copy of TransferItemBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferItemBatchCopyWith<_TransferItemBatch> get copyWith => __$TransferItemBatchCopyWithImpl<_TransferItemBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferItemBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.transferItemId, transferItemId) || other.transferItemId == transferItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,transferItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransferItemBatch(id: $id, transferItemId: $transferItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$TransferItemBatchCopyWith<$Res> implements $TransferItemBatchCopyWith<$Res> {
  factory _$TransferItemBatchCopyWith(_TransferItemBatch value, $Res Function(_TransferItemBatch) _then) = __$TransferItemBatchCopyWithImpl;
@override @useResult
$Res call({
 int id, int? transferItemId, String batchNumber, int quantity, double? costPrice, double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class __$TransferItemBatchCopyWithImpl<$Res>
    implements _$TransferItemBatchCopyWith<$Res> {
  __$TransferItemBatchCopyWithImpl(this._self, this._then);

  final _TransferItemBatch _self;
  final $Res Function(_TransferItemBatch) _then;

/// Create a copy of TransferItemBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transferItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_TransferItemBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferItemId: freezed == transferItemId ? _self.transferItemId : transferItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
