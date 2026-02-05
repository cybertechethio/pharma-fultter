// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferModel {

 int get id; int get companyId; String get transferType; String get transferNumber; String get status; int? get sourceBranchId; String? get sourceBranch; int? get destinationBranchId; String? get destinationBranch; int? get relatedTransferId; int? get transferId; String? get notes; DateTime get createdAt; DateTime get updatedAt; int? get createdBy; int? get updatedBy; String? get creatorName; String? get updatorName; List<TransferItemModel> get transferItems;
/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferModelCopyWith<TransferModel> get copyWith => _$TransferModelCopyWithImpl<TransferModel>(this as TransferModel, _$identity);

  /// Serializes this TransferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.sourceBranch, sourceBranch) || other.sourceBranch == sourceBranch)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.destinationBranch, destinationBranch) || other.destinationBranch == destinationBranch)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updatorName, updatorName) || other.updatorName == updatorName)&&const DeepCollectionEquality().equals(other.transferItems, transferItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,companyId,transferType,transferNumber,status,sourceBranchId,sourceBranch,destinationBranchId,destinationBranch,relatedTransferId,transferId,notes,createdAt,updatedAt,createdBy,updatedBy,creatorName,updatorName,const DeepCollectionEquality().hash(transferItems)]);

@override
String toString() {
  return 'TransferModel(id: $id, companyId: $companyId, transferType: $transferType, transferNumber: $transferNumber, status: $status, sourceBranchId: $sourceBranchId, sourceBranch: $sourceBranch, destinationBranchId: $destinationBranchId, destinationBranch: $destinationBranch, relatedTransferId: $relatedTransferId, transferId: $transferId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updatorName: $updatorName, transferItems: $transferItems)';
}


}

/// @nodoc
abstract mixin class $TransferModelCopyWith<$Res>  {
  factory $TransferModelCopyWith(TransferModel value, $Res Function(TransferModel) _then) = _$TransferModelCopyWithImpl;
@useResult
$Res call({
 int id, int companyId, String transferType, String transferNumber, String status, int? sourceBranchId, String? sourceBranch, int? destinationBranchId, String? destinationBranch, int? relatedTransferId, int? transferId, String? notes, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updatorName, List<TransferItemModel> transferItems
});




}
/// @nodoc
class _$TransferModelCopyWithImpl<$Res>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._self, this._then);

  final TransferModel _self;
  final $Res Function(TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? transferType = null,Object? transferNumber = null,Object? status = null,Object? sourceBranchId = freezed,Object? sourceBranch = freezed,Object? destinationBranchId = freezed,Object? destinationBranch = freezed,Object? relatedTransferId = freezed,Object? transferId = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updatorName = freezed,Object? transferItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,sourceBranch: freezed == sourceBranch ? _self.sourceBranch : sourceBranch // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranch: freezed == destinationBranch ? _self.destinationBranch : destinationBranch // ignore: cast_nullable_to_non_nullable
as String?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updatorName: freezed == updatorName ? _self.updatorName : updatorName // ignore: cast_nullable_to_non_nullable
as String?,transferItems: null == transferItems ? _self.transferItems : transferItems // ignore: cast_nullable_to_non_nullable
as List<TransferItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferModel].
extension TransferModelPatterns on TransferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  String? sourceBranch,  int? destinationBranchId,  String? destinationBranch,  int? relatedTransferId,  int? transferId,  String? notes,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransferItemModel> transferItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.sourceBranch,_that.destinationBranchId,_that.destinationBranch,_that.relatedTransferId,_that.transferId,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.transferItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  String? sourceBranch,  int? destinationBranchId,  String? destinationBranch,  int? relatedTransferId,  int? transferId,  String? notes,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransferItemModel> transferItems)  $default,) {final _that = this;
switch (_that) {
case _TransferModel():
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.sourceBranch,_that.destinationBranchId,_that.destinationBranch,_that.relatedTransferId,_that.transferId,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.transferItems);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId,  String transferType,  String transferNumber,  String status,  int? sourceBranchId,  String? sourceBranch,  int? destinationBranchId,  String? destinationBranch,  int? relatedTransferId,  int? transferId,  String? notes,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransferItemModel> transferItems)?  $default,) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
return $default(_that.id,_that.companyId,_that.transferType,_that.transferNumber,_that.status,_that.sourceBranchId,_that.sourceBranch,_that.destinationBranchId,_that.destinationBranch,_that.relatedTransferId,_that.transferId,_that.notes,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.transferItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferModel implements TransferModel {
  const _TransferModel({required this.id, required this.companyId, required this.transferType, required this.transferNumber, required this.status, this.sourceBranchId, this.sourceBranch, this.destinationBranchId, this.destinationBranch, this.relatedTransferId, this.transferId, this.notes, required this.createdAt, required this.updatedAt, this.createdBy, this.updatedBy, this.creatorName, this.updatorName, final  List<TransferItemModel> transferItems = const []}): _transferItems = transferItems;
  factory _TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);

@override final  int id;
@override final  int companyId;
@override final  String transferType;
@override final  String transferNumber;
@override final  String status;
@override final  int? sourceBranchId;
@override final  String? sourceBranch;
@override final  int? destinationBranchId;
@override final  String? destinationBranch;
@override final  int? relatedTransferId;
@override final  int? transferId;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
@override final  String? creatorName;
@override final  String? updatorName;
 final  List<TransferItemModel> _transferItems;
@override@JsonKey() List<TransferItemModel> get transferItems {
  if (_transferItems is EqualUnmodifiableListView) return _transferItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transferItems);
}


/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferModelCopyWith<_TransferModel> get copyWith => __$TransferModelCopyWithImpl<_TransferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.transferNumber, transferNumber) || other.transferNumber == transferNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.sourceBranch, sourceBranch) || other.sourceBranch == sourceBranch)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.destinationBranch, destinationBranch) || other.destinationBranch == destinationBranch)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updatorName, updatorName) || other.updatorName == updatorName)&&const DeepCollectionEquality().equals(other._transferItems, _transferItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,companyId,transferType,transferNumber,status,sourceBranchId,sourceBranch,destinationBranchId,destinationBranch,relatedTransferId,transferId,notes,createdAt,updatedAt,createdBy,updatedBy,creatorName,updatorName,const DeepCollectionEquality().hash(_transferItems)]);

@override
String toString() {
  return 'TransferModel(id: $id, companyId: $companyId, transferType: $transferType, transferNumber: $transferNumber, status: $status, sourceBranchId: $sourceBranchId, sourceBranch: $sourceBranch, destinationBranchId: $destinationBranchId, destinationBranch: $destinationBranch, relatedTransferId: $relatedTransferId, transferId: $transferId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updatorName: $updatorName, transferItems: $transferItems)';
}


}

/// @nodoc
abstract mixin class _$TransferModelCopyWith<$Res> implements $TransferModelCopyWith<$Res> {
  factory _$TransferModelCopyWith(_TransferModel value, $Res Function(_TransferModel) _then) = __$TransferModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId, String transferType, String transferNumber, String status, int? sourceBranchId, String? sourceBranch, int? destinationBranchId, String? destinationBranch, int? relatedTransferId, int? transferId, String? notes, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updatorName, List<TransferItemModel> transferItems
});




}
/// @nodoc
class __$TransferModelCopyWithImpl<$Res>
    implements _$TransferModelCopyWith<$Res> {
  __$TransferModelCopyWithImpl(this._self, this._then);

  final _TransferModel _self;
  final $Res Function(_TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? transferType = null,Object? transferNumber = null,Object? status = null,Object? sourceBranchId = freezed,Object? sourceBranch = freezed,Object? destinationBranchId = freezed,Object? destinationBranch = freezed,Object? relatedTransferId = freezed,Object? transferId = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updatorName = freezed,Object? transferItems = null,}) {
  return _then(_TransferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as String,transferNumber: null == transferNumber ? _self.transferNumber : transferNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,sourceBranch: freezed == sourceBranch ? _self.sourceBranch : sourceBranch // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranch: freezed == destinationBranch ? _self.destinationBranch : destinationBranch // ignore: cast_nullable_to_non_nullable
as String?,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updatorName: freezed == updatorName ? _self.updatorName : updatorName // ignore: cast_nullable_to_non_nullable
as String?,transferItems: null == transferItems ? _self._transferItems : transferItems // ignore: cast_nullable_to_non_nullable
as List<TransferItemModel>,
  ));
}


}

// dart format on
