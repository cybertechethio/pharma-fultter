// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferResponseModel {

 int get id; int? get companyId; String get transferType; String get transferNumber; int? get sourceBranchId; int? get destinationBranchId; int? get relatedTransferId; String get status; String? get notes; DateTime get createdAt; DateTime? get updatedAt; int? get createdBy; int? get updatedBy; String? get sourceBranchName; String? get destinationBranchName; TransferResponseModel? get relatedTransfer;
/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferResponseModelCopyWith<TransferResponseModel> get copyWith => _$TransferResponseModelCopyWithImpl<TransferResponseModel>(this as TransferResponseModel, _$identity);

  /// Serializes this TransferResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName)&&(identical(other.relatedTransfer, relatedTransfer) || other.relatedTransfer == relatedTransfer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,transferType,transferNumber,sourceBranchId,destinationBranchId,relatedTransferId,status,notes,createdAt,updatedAt,createdBy,updatedBy,sourceBranchName,destinationBranchName,relatedTransfer);

@override
String toString() {
  return 'TransferResponseModel(id: $id, companyId: $companyId, transferType: $transferType, transferNumber: $transferNumber, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName, relatedTransfer: $relatedTransfer)';
}


}

/// @nodoc
abstract mixin class $TransferResponseModelCopyWith<$Res>  {
  factory $TransferResponseModelCopyWith(TransferResponseModel value, $Res Function(TransferResponseModel) _then) = _$TransferResponseModelCopyWithImpl;
@useResult
$Res call({
 int id, int? companyId, String transferType, String transferNumber, int? sourceBranchId, int? destinationBranchId, int? relatedTransferId, String status, String? notes, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy, String? sourceBranchName, String? destinationBranchName, TransferResponseModel? relatedTransfer
});


$TransferResponseModelCopyWith<$Res>? get relatedTransfer;

}
/// @nodoc
class _$TransferResponseModelCopyWithImpl<$Res>
    implements $TransferResponseModelCopyWith<$Res> {
  _$TransferResponseModelCopyWithImpl(this._self, this._then);

  final TransferResponseModel _self;
  final $Res Function(TransferResponseModel) _then;

/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = freezed,Object? transferType = null,Object? transferNumber = null,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? relatedTransferId = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,Object? relatedTransfer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,relatedTransfer: freezed == relatedTransfer ? _self.relatedTransfer : relatedTransfer // ignore: cast_nullable_to_non_nullable
as TransferResponseModel?,
  ));
}
/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransferResponseModelCopyWith<$Res>? get relatedTransfer {
    if (_self.relatedTransfer == null) {
    return null;
  }

  return $TransferResponseModelCopyWith<$Res>(_self.relatedTransfer!, (value) {
    return _then(_self.copyWith(relatedTransfer: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransferResponseModel].
extension TransferResponseModelPatterns on TransferResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? companyId,  String transferType,  String transferNumber,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String status,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  String? sourceBranchName,  String? destinationBranchName,  TransferResponseModel? relatedTransfer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferResponseModel() when $default != null:
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.sourceBranchName,_that.destinationBranchName,_that.relatedTransfer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? companyId,  String transferType,  String transferNumber,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String status,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  String? sourceBranchName,  String? destinationBranchName,  TransferResponseModel? relatedTransfer)  $default,) {final _that = this;
switch (_that) {
case _TransferResponseModel():
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.sourceBranchName,_that.destinationBranchName,_that.relatedTransfer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? companyId,  String transferType,  String transferNumber,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String status,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  String? sourceBranchName,  String? destinationBranchName,  TransferResponseModel? relatedTransfer)?  $default,) {final _that = this;
switch (_that) {
case _TransferResponseModel() when $default != null:
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.sourceBranchName,_that.destinationBranchName,_that.relatedTransfer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferResponseModel implements TransferResponseModel {
  const _TransferResponseModel({required this.id, this.companyId, required this.transferType, required this.transferNumber, this.sourceBranchId, this.destinationBranchId, this.relatedTransferId, required this.status, this.notes, required this.createdAt, this.updatedAt, this.createdBy, this.updatedBy, this.sourceBranchName, this.destinationBranchName, this.relatedTransfer});
  factory _TransferResponseModel.fromJson(Map<String, dynamic> json) => _$TransferResponseModelFromJson(json);

@override final  int id;
@override final  int? companyId;
@override final  String transferType;
@override final  String transferNumber;
@override final  int? sourceBranchId;
@override final  int? destinationBranchId;
@override final  int? relatedTransferId;
@override final  String status;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
@override final  String? sourceBranchName;
@override final  String? destinationBranchName;
@override final  TransferResponseModel? relatedTransfer;

/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferResponseModelCopyWith<_TransferResponseModel> get copyWith => __$TransferResponseModelCopyWithImpl<_TransferResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName)&&(identical(other.relatedTransfer, relatedTransfer) || other.relatedTransfer == relatedTransfer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,transferType,transferNumber,sourceBranchId,destinationBranchId,relatedTransferId,status,notes,createdAt,updatedAt,createdBy,updatedBy,sourceBranchName,destinationBranchName,relatedTransfer);

@override
String toString() {
  return 'TransferResponseModel(id: $id, companyId: $companyId, transferType: $transferType, transferNumber: $transferNumber, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName, relatedTransfer: $relatedTransfer)';
}


}

/// @nodoc
abstract mixin class _$TransferResponseModelCopyWith<$Res> implements $TransferResponseModelCopyWith<$Res> {
  factory _$TransferResponseModelCopyWith(_TransferResponseModel value, $Res Function(_TransferResponseModel) _then) = __$TransferResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int? companyId, String transferType, String transferNumber, int? sourceBranchId, int? destinationBranchId, int? relatedTransferId, String status, String? notes, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy, String? sourceBranchName, String? destinationBranchName, TransferResponseModel? relatedTransfer
});


@override $TransferResponseModelCopyWith<$Res>? get relatedTransfer;

}
/// @nodoc
class __$TransferResponseModelCopyWithImpl<$Res>
    implements _$TransferResponseModelCopyWith<$Res> {
  __$TransferResponseModelCopyWithImpl(this._self, this._then);

  final _TransferResponseModel _self;
  final $Res Function(_TransferResponseModel) _then;

/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = freezed,Object? transferType = null,Object? transferNumber = null,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? relatedTransferId = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,Object? relatedTransfer = freezed,}) {
  return _then(_TransferResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,relatedTransfer: freezed == relatedTransfer ? _self.relatedTransfer : relatedTransfer // ignore: cast_nullable_to_non_nullable
as TransferResponseModel?,
  ));
}

/// Create a copy of TransferResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransferResponseModelCopyWith<$Res>? get relatedTransfer {
    if (_self.relatedTransfer == null) {
    return null;
  }

  return $TransferResponseModelCopyWith<$Res>(_self.relatedTransfer!, (value) {
    return _then(_self.copyWith(relatedTransfer: value));
  });
}
}

// dart format on
