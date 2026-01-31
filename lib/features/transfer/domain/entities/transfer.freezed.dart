// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transfer {

 int get id; String get transferType; String get transferNumber; String get status; int? get sourceBranchId; int? get destinationBranchId; int? get relatedTransferId; String? get notes; DateTime get createdAt; DateTime? get updatedAt; String? get sourceBranchName; String? get destinationBranchName;
/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferCopyWith<Transfer> get copyWith => _$TransferCopyWithImpl<Transfer>(this as Transfer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName));
}


@override
int get hashCode => Object.hash(runtimeType,id,transferType,transferNumber,status,sourceBranchId,destinationBranchId,relatedTransferId,notes,createdAt,updatedAt,sourceBranchName,destinationBranchName);

@override
String toString() {
  return 'Transfer(id: $id, transferType: $transferType, transferNumber: $transferNumber, status: $status, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName)';
}


}

/// @nodoc
abstract mixin class $TransferCopyWith<$Res>  {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) _then) = _$TransferCopyWithImpl;
@useResult
$Res call({
 int id, String transferType, String transferNumber, String status, int? sourceBranchId, int? destinationBranchId, int? relatedTransferId, String? notes, DateTime createdAt, DateTime? updatedAt, String? sourceBranchName, String? destinationBranchName
});




}
/// @nodoc
class _$TransferCopyWithImpl<$Res>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._self, this._then);

  final Transfer _self;
  final $Res Function(Transfer) _then;

/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transferType = null,Object? transferNumber = null,Object? status = null,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? relatedTransferId = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Transfer].
extension TransferPatterns on Transfer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transfer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transfer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transfer value)  $default,){
final _that = this;
switch (_that) {
case _Transfer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transfer value)?  $default,){
final _that = this;
switch (_that) {
case _Transfer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  String? sourceBranchName,  String? destinationBranchName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transfer() when $default != null:
return $default(_that.id,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.createdAt,_that.updatedAt,_that.sourceBranchName,_that.destinationBranchName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  String? sourceBranchName,  String? destinationBranchName)  $default,) {final _that = this;
switch (_that) {
case _Transfer():
return $default(_that.id,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.createdAt,_that.updatedAt,_that.sourceBranchName,_that.destinationBranchName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  int? destinationBranchId,  int? relatedTransferId,  String? notes,  DateTime createdAt,  DateTime? updatedAt,  String? sourceBranchName,  String? destinationBranchName)?  $default,) {final _that = this;
switch (_that) {
case _Transfer() when $default != null:
return $default(_that.id,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.createdAt,_that.updatedAt,_that.sourceBranchName,_that.destinationBranchName);case _:
  return null;

}
}

}

/// @nodoc


class _Transfer implements Transfer {
  const _Transfer({required this.id, required this.transferType, required this.transferNumber, required this.status, this.sourceBranchId, this.destinationBranchId, this.relatedTransferId, this.notes, required this.createdAt, this.updatedAt, this.sourceBranchName, this.destinationBranchName});
  

@override final  int id;
@override final  String transferType;
@override final  String transferNumber;
@override final  String status;
@override final  int? sourceBranchId;
@override final  int? destinationBranchId;
@override final  int? relatedTransferId;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  String? sourceBranchName;
@override final  String? destinationBranchName;

/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferCopyWith<_Transfer> get copyWith => __$TransferCopyWithImpl<_Transfer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName));
}


@override
int get hashCode => Object.hash(runtimeType,id,transferType,transferNumber,status,sourceBranchId,destinationBranchId,relatedTransferId,notes,createdAt,updatedAt,sourceBranchName,destinationBranchName);

@override
String toString() {
  return 'Transfer(id: $id, transferType: $transferType, transferNumber: $transferNumber, status: $status, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName)';
}


}

/// @nodoc
abstract mixin class _$TransferCopyWith<$Res> implements $TransferCopyWith<$Res> {
  factory _$TransferCopyWith(_Transfer value, $Res Function(_Transfer) _then) = __$TransferCopyWithImpl;
@override @useResult
$Res call({
 int id, String transferType, String transferNumber, String status, int? sourceBranchId, int? destinationBranchId, int? relatedTransferId, String? notes, DateTime createdAt, DateTime? updatedAt, String? sourceBranchName, String? destinationBranchName
});




}
/// @nodoc
class __$TransferCopyWithImpl<$Res>
    implements _$TransferCopyWith<$Res> {
  __$TransferCopyWithImpl(this._self, this._then);

  final _Transfer _self;
  final $Res Function(_Transfer) _then;

/// Create a copy of Transfer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transferType = null,Object? transferNumber = null,Object? status = null,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? relatedTransferId = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,}) {
  return _then(_Transfer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
