// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BatchEntity {

 int get id; int get itemId; String get batchNumber; String get batchName; String get itemName; String get itemCode; DateTime? get expirationDate; DateTime? get manufacturingDate; double? get costPrice; double? get unitPrice; String? get supplierBatchNumber; String? get notes; bool get isActive; int get quantity; DateTime get createdAt; String? get createdBy; String? get updatedBy;
/// Create a copy of BatchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchEntityCopyWith<BatchEntity> get copyWith => _$BatchEntityCopyWithImpl<BatchEntity>(this as BatchEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,batchNumber,batchName,itemName,itemCode,expirationDate,manufacturingDate,costPrice,unitPrice,supplierBatchNumber,notes,isActive,quantity,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'BatchEntity(id: $id, itemId: $itemId, batchNumber: $batchNumber, batchName: $batchName, itemName: $itemName, itemCode: $itemCode, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, costPrice: $costPrice, unitPrice: $unitPrice, supplierBatchNumber: $supplierBatchNumber, notes: $notes, isActive: $isActive, quantity: $quantity, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $BatchEntityCopyWith<$Res>  {
  factory $BatchEntityCopyWith(BatchEntity value, $Res Function(BatchEntity) _then) = _$BatchEntityCopyWithImpl;
@useResult
$Res call({
 int id, int itemId, String batchNumber, String batchName, String itemName, String itemCode, DateTime? expirationDate, DateTime? manufacturingDate, double? costPrice, double? unitPrice, String? supplierBatchNumber, String? notes, bool isActive, int quantity, DateTime createdAt, String? createdBy, String? updatedBy
});




}
/// @nodoc
class _$BatchEntityCopyWithImpl<$Res>
    implements $BatchEntityCopyWith<$Res> {
  _$BatchEntityCopyWithImpl(this._self, this._then);

  final BatchEntity _self;
  final $Res Function(BatchEntity) _then;

/// Create a copy of BatchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? batchNumber = null,Object? batchName = null,Object? itemName = null,Object? itemCode = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,Object? isActive = null,Object? quantity = null,Object? createdAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchEntity].
extension BatchEntityPatterns on BatchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchEntity value)  $default,){
final _that = this;
switch (_that) {
case _BatchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BatchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int itemId,  String batchNumber,  String batchName,  String itemName,  String itemCode,  DateTime? expirationDate,  DateTime? manufacturingDate,  double? costPrice,  double? unitPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  int quantity,  DateTime createdAt,  String? createdBy,  String? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchEntity() when $default != null:
return $default(_that.id,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.itemCode,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.unitPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.quantity,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int itemId,  String batchNumber,  String batchName,  String itemName,  String itemCode,  DateTime? expirationDate,  DateTime? manufacturingDate,  double? costPrice,  double? unitPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  int quantity,  DateTime createdAt,  String? createdBy,  String? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _BatchEntity():
return $default(_that.id,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.itemCode,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.unitPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.quantity,_that.createdAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int itemId,  String batchNumber,  String batchName,  String itemName,  String itemCode,  DateTime? expirationDate,  DateTime? manufacturingDate,  double? costPrice,  double? unitPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  int quantity,  DateTime createdAt,  String? createdBy,  String? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _BatchEntity() when $default != null:
return $default(_that.id,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.itemCode,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.unitPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.quantity,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc


class _BatchEntity implements BatchEntity {
  const _BatchEntity({required this.id, required this.itemId, required this.batchNumber, required this.batchName, required this.itemName, required this.itemCode, this.expirationDate, this.manufacturingDate, this.costPrice, this.unitPrice, this.supplierBatchNumber, this.notes, required this.isActive, required this.quantity, required this.createdAt, this.createdBy, this.updatedBy});
  

@override final  int id;
@override final  int itemId;
@override final  String batchNumber;
@override final  String batchName;
@override final  String itemName;
@override final  String itemCode;
@override final  DateTime? expirationDate;
@override final  DateTime? manufacturingDate;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  String? supplierBatchNumber;
@override final  String? notes;
@override final  bool isActive;
@override final  int quantity;
@override final  DateTime createdAt;
@override final  String? createdBy;
@override final  String? updatedBy;

/// Create a copy of BatchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchEntityCopyWith<_BatchEntity> get copyWith => __$BatchEntityCopyWithImpl<_BatchEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemId,batchNumber,batchName,itemName,itemCode,expirationDate,manufacturingDate,costPrice,unitPrice,supplierBatchNumber,notes,isActive,quantity,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'BatchEntity(id: $id, itemId: $itemId, batchNumber: $batchNumber, batchName: $batchName, itemName: $itemName, itemCode: $itemCode, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, costPrice: $costPrice, unitPrice: $unitPrice, supplierBatchNumber: $supplierBatchNumber, notes: $notes, isActive: $isActive, quantity: $quantity, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$BatchEntityCopyWith<$Res> implements $BatchEntityCopyWith<$Res> {
  factory _$BatchEntityCopyWith(_BatchEntity value, $Res Function(_BatchEntity) _then) = __$BatchEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int itemId, String batchNumber, String batchName, String itemName, String itemCode, DateTime? expirationDate, DateTime? manufacturingDate, double? costPrice, double? unitPrice, String? supplierBatchNumber, String? notes, bool isActive, int quantity, DateTime createdAt, String? createdBy, String? updatedBy
});




}
/// @nodoc
class __$BatchEntityCopyWithImpl<$Res>
    implements _$BatchEntityCopyWith<$Res> {
  __$BatchEntityCopyWithImpl(this._self, this._then);

  final _BatchEntity _self;
  final $Res Function(_BatchEntity) _then;

/// Create a copy of BatchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? batchNumber = null,Object? batchName = null,Object? itemName = null,Object? itemCode = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,Object? isActive = null,Object? quantity = null,Object? createdAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_BatchEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
