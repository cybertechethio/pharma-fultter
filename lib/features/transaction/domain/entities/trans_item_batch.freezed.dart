// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_item_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransItemBatch {

 int get id; int? get transactionItemId; String get batchNumber; double get quantity; double? get costPrice; double? get unitPrice; DateTime? get expirationDate;
/// Create a copy of TransItemBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemBatchCopyWith<TransItemBatch> get copyWith => _$TransItemBatchCopyWithImpl<TransItemBatch>(this as TransItemBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItemBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionItemId, transactionItemId) || other.transactionItemId == transactionItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,transactionItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransItemBatch(id: $id, transactionItemId: $transactionItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $TransItemBatchCopyWith<$Res>  {
  factory $TransItemBatchCopyWith(TransItemBatch value, $Res Function(TransItemBatch) _then) = _$TransItemBatchCopyWithImpl;
@useResult
$Res call({
 int id, int? transactionItemId, String batchNumber, double quantity, double? costPrice, double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class _$TransItemBatchCopyWithImpl<$Res>
    implements $TransItemBatchCopyWith<$Res> {
  _$TransItemBatchCopyWithImpl(this._self, this._then);

  final TransItemBatch _self;
  final $Res Function(TransItemBatch) _then;

/// Create a copy of TransItemBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionItemId: freezed == transactionItemId ? _self.transactionItemId : transactionItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransItemBatch].
extension TransItemBatchPatterns on TransItemBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransItemBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransItemBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransItemBatch value)  $default,){
final _that = this;
switch (_that) {
case _TransItemBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransItemBatch value)?  $default,){
final _that = this;
switch (_that) {
case _TransItemBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? transactionItemId,  String batchNumber,  double quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItemBatch() when $default != null:
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? transactionItemId,  String batchNumber,  double quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _TransItemBatch():
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? transactionItemId,  String batchNumber,  double quantity,  double? costPrice,  double? unitPrice,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _TransItemBatch() when $default != null:
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc


class _TransItemBatch implements TransItemBatch {
  const _TransItemBatch({required this.id, this.transactionItemId, required this.batchNumber, required this.quantity, this.costPrice, this.unitPrice, this.expirationDate});
  

@override final  int id;
@override final  int? transactionItemId;
@override final  String batchNumber;
@override final  double quantity;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  DateTime? expirationDate;

/// Create a copy of TransItemBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransItemBatchCopyWith<_TransItemBatch> get copyWith => __$TransItemBatchCopyWithImpl<_TransItemBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItemBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionItemId, transactionItemId) || other.transactionItemId == transactionItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,transactionItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransItemBatch(id: $id, transactionItemId: $transactionItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$TransItemBatchCopyWith<$Res> implements $TransItemBatchCopyWith<$Res> {
  factory _$TransItemBatchCopyWith(_TransItemBatch value, $Res Function(_TransItemBatch) _then) = __$TransItemBatchCopyWithImpl;
@override @useResult
$Res call({
 int id, int? transactionItemId, String batchNumber, double quantity, double? costPrice, double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class __$TransItemBatchCopyWithImpl<$Res>
    implements _$TransItemBatchCopyWith<$Res> {
  __$TransItemBatchCopyWithImpl(this._self, this._then);

  final _TransItemBatch _self;
  final $Res Function(_TransItemBatch) _then;

/// Create a copy of TransItemBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_TransItemBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionItemId: freezed == transactionItemId ? _self.transactionItemId : transactionItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
