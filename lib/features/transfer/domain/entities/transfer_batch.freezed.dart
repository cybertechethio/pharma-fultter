// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferBatch {

 String get batchNumber; double get quantity; double get costPrice; double get unitPrice; DateTime? get expirationDate; String? get allocatedFrom;
/// Create a copy of TransferBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferBatchCopyWith<TransferBatch> get copyWith => _$TransferBatchCopyWithImpl<TransferBatch>(this as TransferBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferBatch&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom));
}


@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate,allocatedFrom);

@override
String toString() {
  return 'TransferBatch(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom)';
}


}

/// @nodoc
abstract mixin class $TransferBatchCopyWith<$Res>  {
  factory $TransferBatchCopyWith(TransferBatch value, $Res Function(TransferBatch) _then) = _$TransferBatchCopyWithImpl;
@useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice, DateTime? expirationDate, String? allocatedFrom
});




}
/// @nodoc
class _$TransferBatchCopyWithImpl<$Res>
    implements $TransferBatchCopyWith<$Res> {
  _$TransferBatchCopyWithImpl(this._self, this._then);

  final TransferBatch _self;
  final $Res Function(TransferBatch) _then;

/// Create a copy of TransferBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? allocatedFrom = freezed,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: freezed == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferBatch].
extension TransferBatchPatterns on TransferBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferBatch value)  $default,){
final _that = this;
switch (_that) {
case _TransferBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferBatch value)?  $default,){
final _that = this;
switch (_that) {
case _TransferBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferBatch() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)  $default,) {final _that = this;
switch (_that) {
case _TransferBatch():
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)?  $default,) {final _that = this;
switch (_that) {
case _TransferBatch() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);case _:
  return null;

}
}

}

/// @nodoc


class _TransferBatch implements TransferBatch {
  const _TransferBatch({required this.batchNumber, required this.quantity, required this.costPrice, required this.unitPrice, this.expirationDate, this.allocatedFrom});
  

@override final  String batchNumber;
@override final  double quantity;
@override final  double costPrice;
@override final  double unitPrice;
@override final  DateTime? expirationDate;
@override final  String? allocatedFrom;

/// Create a copy of TransferBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferBatchCopyWith<_TransferBatch> get copyWith => __$TransferBatchCopyWithImpl<_TransferBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferBatch&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom));
}


@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate,allocatedFrom);

@override
String toString() {
  return 'TransferBatch(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom)';
}


}

/// @nodoc
abstract mixin class _$TransferBatchCopyWith<$Res> implements $TransferBatchCopyWith<$Res> {
  factory _$TransferBatchCopyWith(_TransferBatch value, $Res Function(_TransferBatch) _then) = __$TransferBatchCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice, DateTime? expirationDate, String? allocatedFrom
});




}
/// @nodoc
class __$TransferBatchCopyWithImpl<$Res>
    implements _$TransferBatchCopyWith<$Res> {
  __$TransferBatchCopyWithImpl(this._self, this._then);

  final _TransferBatch _self;
  final $Res Function(_TransferBatch) _then;

/// Create a copy of TransferBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? allocatedFrom = freezed,}) {
  return _then(_TransferBatch(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: freezed == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
