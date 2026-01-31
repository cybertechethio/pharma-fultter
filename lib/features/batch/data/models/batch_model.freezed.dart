// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; int get companyId; int get itemId; String get batchNumber; String get batchName; String get itemName; DateTime? get expirationDate; DateTime? get manufacturingDate; String? get costPrice; String? get supplierBatchNumber; String? get notes; bool get isActive; DateTime get createdAt; DateTime? get updatedAt; int? get createdBy; int? get updatedBy;
/// Create a copy of BatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchModelCopyWith<BatchModel> get copyWith => _$BatchModelCopyWithImpl<BatchModel>(this as BatchModel, _$identity);

  /// Serializes this BatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,itemId,batchNumber,batchName,itemName,expirationDate,manufacturingDate,costPrice,supplierBatchNumber,notes,isActive,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'BatchModel(id: $id, companyId: $companyId, itemId: $itemId, batchNumber: $batchNumber, batchName: $batchName, itemName: $itemName, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, costPrice: $costPrice, supplierBatchNumber: $supplierBatchNumber, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $BatchModelCopyWith<$Res>  {
  factory $BatchModelCopyWith(BatchModel value, $Res Function(BatchModel) _then) = _$BatchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int companyId, int itemId, String batchNumber, String batchName, String itemName, DateTime? expirationDate, DateTime? manufacturingDate, String? costPrice, String? supplierBatchNumber, String? notes, bool isActive, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class _$BatchModelCopyWithImpl<$Res>
    implements $BatchModelCopyWith<$Res> {
  _$BatchModelCopyWithImpl(this._self, this._then);

  final BatchModel _self;
  final $Res Function(BatchModel) _then;

/// Create a copy of BatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? itemId = null,Object? batchNumber = null,Object? batchName = null,Object? itemName = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? costPrice = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as String?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchModel].
extension BatchModelPatterns on BatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchModel value)  $default,){
final _that = this;
switch (_that) {
case _BatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _BatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int itemId,  String batchNumber,  String batchName,  String itemName,  DateTime? expirationDate,  DateTime? manufacturingDate,  String? costPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchModel() when $default != null:
return $default(_that.id,_that.companyId,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int itemId,  String batchNumber,  String batchName,  String itemName,  DateTime? expirationDate,  DateTime? manufacturingDate,  String? costPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _BatchModel():
return $default(_that.id,_that.companyId,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int itemId,  String batchNumber,  String batchName,  String itemName,  DateTime? expirationDate,  DateTime? manufacturingDate,  String? costPrice,  String? supplierBatchNumber,  String? notes,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _BatchModel() when $default != null:
return $default(_that.id,_that.companyId,_that.itemId,_that.batchNumber,_that.batchName,_that.itemName,_that.expirationDate,_that.manufacturingDate,_that.costPrice,_that.supplierBatchNumber,_that.notes,_that.isActive,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchModel implements BatchModel {
  const _BatchModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.companyId, required this.itemId, this.batchNumber = '', required this.batchName, this.itemName = 'N/A', this.expirationDate, this.manufacturingDate, this.costPrice, this.supplierBatchNumber, this.notes, this.isActive = true, required this.createdAt, this.updatedAt, this.createdBy, this.updatedBy});
  factory _BatchModel.fromJson(Map<String, dynamic> json) => _$BatchModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  int companyId;
@override final  int itemId;
@override@JsonKey() final  String batchNumber;
@override final  String batchName;
@override@JsonKey() final  String itemName;
@override final  DateTime? expirationDate;
@override final  DateTime? manufacturingDate;
@override final  String? costPrice;
@override final  String? supplierBatchNumber;
@override final  String? notes;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;

/// Create a copy of BatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchModelCopyWith<_BatchModel> get copyWith => __$BatchModelCopyWithImpl<_BatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,itemId,batchNumber,batchName,itemName,expirationDate,manufacturingDate,costPrice,supplierBatchNumber,notes,isActive,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'BatchModel(id: $id, companyId: $companyId, itemId: $itemId, batchNumber: $batchNumber, batchName: $batchName, itemName: $itemName, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, costPrice: $costPrice, supplierBatchNumber: $supplierBatchNumber, notes: $notes, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$BatchModelCopyWith<$Res> implements $BatchModelCopyWith<$Res> {
  factory _$BatchModelCopyWith(_BatchModel value, $Res Function(_BatchModel) _then) = __$BatchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int companyId, int itemId, String batchNumber, String batchName, String itemName, DateTime? expirationDate, DateTime? manufacturingDate, String? costPrice, String? supplierBatchNumber, String? notes, bool isActive, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class __$BatchModelCopyWithImpl<$Res>
    implements _$BatchModelCopyWith<$Res> {
  __$BatchModelCopyWithImpl(this._self, this._then);

  final _BatchModel _self;
  final $Res Function(_BatchModel) _then;

/// Create a copy of BatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? itemId = null,Object? batchNumber = null,Object? batchName = null,Object? itemName = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? costPrice = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_BatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as String?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
