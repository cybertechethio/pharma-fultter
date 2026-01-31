// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockBatch {

 int get id; int get batchId; String get quantity; String get costPrice; String get unitPrice; DateTime? get lastUsedAt; String get batchNumber; String get batchName; DateTime? get expirationDate;
/// Create a copy of StockBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockBatchCopyWith<StockBatch> get copyWith => _$StockBatchCopyWithImpl<StockBatch>(this as StockBatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchId,quantity,costPrice,unitPrice,lastUsedAt,batchNumber,batchName,expirationDate);

@override
String toString() {
  return 'StockBatch(id: $id, batchId: $batchId, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, lastUsedAt: $lastUsedAt, batchNumber: $batchNumber, batchName: $batchName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $StockBatchCopyWith<$Res>  {
  factory $StockBatchCopyWith(StockBatch value, $Res Function(StockBatch) _then) = _$StockBatchCopyWithImpl;
@useResult
$Res call({
 int id, int batchId, String quantity, String costPrice, String unitPrice, DateTime? lastUsedAt, String batchNumber, String batchName, DateTime? expirationDate
});




}
/// @nodoc
class _$StockBatchCopyWithImpl<$Res>
    implements $StockBatchCopyWith<$Res> {
  _$StockBatchCopyWithImpl(this._self, this._then);

  final StockBatch _self;
  final $Res Function(StockBatch) _then;

/// Create a copy of StockBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? batchId = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? lastUsedAt = freezed,Object? batchNumber = null,Object? batchName = null,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockBatch].
extension StockBatchPatterns on StockBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockBatch value)  $default,){
final _that = this;
switch (_that) {
case _StockBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockBatch value)?  $default,){
final _that = this;
switch (_that) {
case _StockBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockBatch() when $default != null:
return $default(_that.id,_that.batchId,_that.quantity,_that.costPrice,_that.unitPrice,_that.lastUsedAt,_that.batchNumber,_that.batchName,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _StockBatch():
return $default(_that.id,_that.batchId,_that.quantity,_that.costPrice,_that.unitPrice,_that.lastUsedAt,_that.batchNumber,_that.batchName,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _StockBatch() when $default != null:
return $default(_that.id,_that.batchId,_that.quantity,_that.costPrice,_that.unitPrice,_that.lastUsedAt,_that.batchNumber,_that.batchName,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc


class _StockBatch implements StockBatch {
  const _StockBatch({required this.id, required this.batchId, required this.quantity, required this.costPrice, required this.unitPrice, this.lastUsedAt, required this.batchNumber, required this.batchName, this.expirationDate});
  

@override final  int id;
@override final  int batchId;
@override final  String quantity;
@override final  String costPrice;
@override final  String unitPrice;
@override final  DateTime? lastUsedAt;
@override final  String batchNumber;
@override final  String batchName;
@override final  DateTime? expirationDate;

/// Create a copy of StockBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockBatchCopyWith<_StockBatch> get copyWith => __$StockBatchCopyWithImpl<_StockBatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchId,quantity,costPrice,unitPrice,lastUsedAt,batchNumber,batchName,expirationDate);

@override
String toString() {
  return 'StockBatch(id: $id, batchId: $batchId, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, lastUsedAt: $lastUsedAt, batchNumber: $batchNumber, batchName: $batchName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$StockBatchCopyWith<$Res> implements $StockBatchCopyWith<$Res> {
  factory _$StockBatchCopyWith(_StockBatch value, $Res Function(_StockBatch) _then) = __$StockBatchCopyWithImpl;
@override @useResult
$Res call({
 int id, int batchId, String quantity, String costPrice, String unitPrice, DateTime? lastUsedAt, String batchNumber, String batchName, DateTime? expirationDate
});




}
/// @nodoc
class __$StockBatchCopyWithImpl<$Res>
    implements _$StockBatchCopyWith<$Res> {
  __$StockBatchCopyWithImpl(this._self, this._then);

  final _StockBatch _self;
  final $Res Function(_StockBatch) _then;

/// Create a copy of StockBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? batchId = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? lastUsedAt = freezed,Object? batchNumber = null,Object? batchName = null,Object? expirationDate = freezed,}) {
  return _then(_StockBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
