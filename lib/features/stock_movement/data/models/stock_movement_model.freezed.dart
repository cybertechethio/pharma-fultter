// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_movement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockMovementModel {

 int get id; int get companyId; int get branchId; int get itemId; int? get transactionId;@JsonKey(fromJson: _typeFromJson) StockMovementType get type; String get quantity; String? get previousStock; String? get newStock; int? get sourceBranchId; int? get destinationBranchId; int? get transferId; int? get reversesMovementId; String? get notes;@JsonKey(fromJson: _statusFromJson) StockMovementStatus get status; DateTime get createdAt; DateTime get updatedAt; int? get createdBy; int? get updatedBy; String? get creatorName; String? get updaterName; String? get sourceBranchName; String? get destinationBranchName; StockMovementItemModel? get item;
/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMovementModelCopyWith<StockMovementModel> get copyWith => _$StockMovementModelCopyWithImpl<StockMovementModel>(this as StockMovementModel, _$identity);

  /// Serializes this StockMovementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMovementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.reversesMovementId, reversesMovementId) || other.reversesMovementId == reversesMovementId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updaterName, updaterName) || other.updaterName == updaterName)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,companyId,branchId,itemId,transactionId,type,quantity,previousStock,newStock,sourceBranchId,destinationBranchId,transferId,reversesMovementId,notes,status,createdAt,updatedAt,createdBy,updatedBy,creatorName,updaterName,sourceBranchName,destinationBranchName,item]);

@override
String toString() {
  return 'StockMovementModel(id: $id, companyId: $companyId, branchId: $branchId, itemId: $itemId, transactionId: $transactionId, type: $type, quantity: $quantity, previousStock: $previousStock, newStock: $newStock, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, transferId: $transferId, reversesMovementId: $reversesMovementId, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updaterName: $updaterName, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName, item: $item)';
}


}

/// @nodoc
abstract mixin class $StockMovementModelCopyWith<$Res>  {
  factory $StockMovementModelCopyWith(StockMovementModel value, $Res Function(StockMovementModel) _then) = _$StockMovementModelCopyWithImpl;
@useResult
$Res call({
 int id, int companyId, int branchId, int itemId, int? transactionId,@JsonKey(fromJson: _typeFromJson) StockMovementType type, String quantity, String? previousStock, String? newStock, int? sourceBranchId, int? destinationBranchId, int? transferId, int? reversesMovementId, String? notes,@JsonKey(fromJson: _statusFromJson) StockMovementStatus status, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updaterName, String? sourceBranchName, String? destinationBranchName, StockMovementItemModel? item
});


$StockMovementItemModelCopyWith<$Res>? get item;

}
/// @nodoc
class _$StockMovementModelCopyWithImpl<$Res>
    implements $StockMovementModelCopyWith<$Res> {
  _$StockMovementModelCopyWithImpl(this._self, this._then);

  final StockMovementModel _self;
  final $Res Function(StockMovementModel) _then;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? branchId = null,Object? itemId = null,Object? transactionId = freezed,Object? type = null,Object? quantity = null,Object? previousStock = freezed,Object? newStock = freezed,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? transferId = freezed,Object? reversesMovementId = freezed,Object? notes = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updaterName = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,Object? item = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockMovementType,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,previousStock: freezed == previousStock ? _self.previousStock : previousStock // ignore: cast_nullable_to_non_nullable
as String?,newStock: freezed == newStock ? _self.newStock : newStock // ignore: cast_nullable_to_non_nullable
as String?,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as int?,reversesMovementId: freezed == reversesMovementId ? _self.reversesMovementId : reversesMovementId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockMovementStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updaterName: freezed == updaterName ? _self.updaterName : updaterName // ignore: cast_nullable_to_non_nullable
as String?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockMovementItemModel?,
  ));
}
/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMovementItemModelCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $StockMovementItemModelCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockMovementModel].
extension StockMovementModelPatterns on StockMovementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMovementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMovementModel value)  $default,){
final _that = this;
switch (_that) {
case _StockMovementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMovementModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int companyId,  int branchId,  int itemId,  int? transactionId, @JsonKey(fromJson: _typeFromJson)  StockMovementType type,  String quantity,  String? previousStock,  String? newStock,  int? sourceBranchId,  int? destinationBranchId,  int? transferId,  int? reversesMovementId,  String? notes, @JsonKey(fromJson: _statusFromJson)  StockMovementStatus status,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updaterName,  String? sourceBranchName,  String? destinationBranchName,  StockMovementItemModel? item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.transactionId,_that.type,_that.quantity,_that.previousStock,_that.newStock,_that.sourceBranchId,_that.destinationBranchId,_that.transferId,_that.reversesMovementId,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updaterName,_that.sourceBranchName,_that.destinationBranchName,_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int companyId,  int branchId,  int itemId,  int? transactionId, @JsonKey(fromJson: _typeFromJson)  StockMovementType type,  String quantity,  String? previousStock,  String? newStock,  int? sourceBranchId,  int? destinationBranchId,  int? transferId,  int? reversesMovementId,  String? notes, @JsonKey(fromJson: _statusFromJson)  StockMovementStatus status,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updaterName,  String? sourceBranchName,  String? destinationBranchName,  StockMovementItemModel? item)  $default,) {final _that = this;
switch (_that) {
case _StockMovementModel():
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.transactionId,_that.type,_that.quantity,_that.previousStock,_that.newStock,_that.sourceBranchId,_that.destinationBranchId,_that.transferId,_that.reversesMovementId,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updaterName,_that.sourceBranchName,_that.destinationBranchName,_that.item);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int companyId,  int branchId,  int itemId,  int? transactionId, @JsonKey(fromJson: _typeFromJson)  StockMovementType type,  String quantity,  String? previousStock,  String? newStock,  int? sourceBranchId,  int? destinationBranchId,  int? transferId,  int? reversesMovementId,  String? notes, @JsonKey(fromJson: _statusFromJson)  StockMovementStatus status,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updaterName,  String? sourceBranchName,  String? destinationBranchName,  StockMovementItemModel? item)?  $default,) {final _that = this;
switch (_that) {
case _StockMovementModel() when $default != null:
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.transactionId,_that.type,_that.quantity,_that.previousStock,_that.newStock,_that.sourceBranchId,_that.destinationBranchId,_that.transferId,_that.reversesMovementId,_that.notes,_that.status,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updaterName,_that.sourceBranchName,_that.destinationBranchName,_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMovementModel implements StockMovementModel {
  const _StockMovementModel({required this.id, required this.companyId, required this.branchId, required this.itemId, this.transactionId, @JsonKey(fromJson: _typeFromJson) required this.type, required this.quantity, this.previousStock, this.newStock, this.sourceBranchId, this.destinationBranchId, this.transferId, this.reversesMovementId, this.notes, @JsonKey(fromJson: _statusFromJson) required this.status, required this.createdAt, required this.updatedAt, this.createdBy, this.updatedBy, this.creatorName, this.updaterName, this.sourceBranchName, this.destinationBranchName, this.item});
  factory _StockMovementModel.fromJson(Map<String, dynamic> json) => _$StockMovementModelFromJson(json);

@override final  int id;
@override final  int companyId;
@override final  int branchId;
@override final  int itemId;
@override final  int? transactionId;
@override@JsonKey(fromJson: _typeFromJson) final  StockMovementType type;
@override final  String quantity;
@override final  String? previousStock;
@override final  String? newStock;
@override final  int? sourceBranchId;
@override final  int? destinationBranchId;
@override final  int? transferId;
@override final  int? reversesMovementId;
@override final  String? notes;
@override@JsonKey(fromJson: _statusFromJson) final  StockMovementStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
@override final  String? creatorName;
@override final  String? updaterName;
@override final  String? sourceBranchName;
@override final  String? destinationBranchName;
@override final  StockMovementItemModel? item;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMovementModelCopyWith<_StockMovementModel> get copyWith => __$StockMovementModelCopyWithImpl<_StockMovementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMovementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMovementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.previousStock, previousStock) || other.previousStock == previousStock)&&(identical(other.newStock, newStock) || other.newStock == newStock)&&(identical(other.sourceBranchId, sourceBranchId) || other.sourceBranchId == sourceBranchId)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.transferId, transferId) || other.transferId == transferId)&&(identical(other.reversesMovementId, reversesMovementId) || other.reversesMovementId == reversesMovementId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updaterName, updaterName) || other.updaterName == updaterName)&&(identical(other.sourceBranchName, sourceBranchName) || other.sourceBranchName == sourceBranchName)&&(identical(other.destinationBranchName, destinationBranchName) || other.destinationBranchName == destinationBranchName)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,companyId,branchId,itemId,transactionId,type,quantity,previousStock,newStock,sourceBranchId,destinationBranchId,transferId,reversesMovementId,notes,status,createdAt,updatedAt,createdBy,updatedBy,creatorName,updaterName,sourceBranchName,destinationBranchName,item]);

@override
String toString() {
  return 'StockMovementModel(id: $id, companyId: $companyId, branchId: $branchId, itemId: $itemId, transactionId: $transactionId, type: $type, quantity: $quantity, previousStock: $previousStock, newStock: $newStock, sourceBranchId: $sourceBranchId, destinationBranchId: $destinationBranchId, transferId: $transferId, reversesMovementId: $reversesMovementId, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updaterName: $updaterName, sourceBranchName: $sourceBranchName, destinationBranchName: $destinationBranchName, item: $item)';
}


}

/// @nodoc
abstract mixin class _$StockMovementModelCopyWith<$Res> implements $StockMovementModelCopyWith<$Res> {
  factory _$StockMovementModelCopyWith(_StockMovementModel value, $Res Function(_StockMovementModel) _then) = __$StockMovementModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int companyId, int branchId, int itemId, int? transactionId,@JsonKey(fromJson: _typeFromJson) StockMovementType type, String quantity, String? previousStock, String? newStock, int? sourceBranchId, int? destinationBranchId, int? transferId, int? reversesMovementId, String? notes,@JsonKey(fromJson: _statusFromJson) StockMovementStatus status, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updaterName, String? sourceBranchName, String? destinationBranchName, StockMovementItemModel? item
});


@override $StockMovementItemModelCopyWith<$Res>? get item;

}
/// @nodoc
class __$StockMovementModelCopyWithImpl<$Res>
    implements _$StockMovementModelCopyWith<$Res> {
  __$StockMovementModelCopyWithImpl(this._self, this._then);

  final _StockMovementModel _self;
  final $Res Function(_StockMovementModel) _then;

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? branchId = null,Object? itemId = null,Object? transactionId = freezed,Object? type = null,Object? quantity = null,Object? previousStock = freezed,Object? newStock = freezed,Object? sourceBranchId = freezed,Object? destinationBranchId = freezed,Object? transferId = freezed,Object? reversesMovementId = freezed,Object? notes = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updaterName = freezed,Object? sourceBranchName = freezed,Object? destinationBranchName = freezed,Object? item = freezed,}) {
  return _then(_StockMovementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockMovementType,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,previousStock: freezed == previousStock ? _self.previousStock : previousStock // ignore: cast_nullable_to_non_nullable
as String?,newStock: freezed == newStock ? _self.newStock : newStock // ignore: cast_nullable_to_non_nullable
as String?,sourceBranchId: freezed == sourceBranchId ? _self.sourceBranchId : sourceBranchId // ignore: cast_nullable_to_non_nullable
as int?,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,transferId: freezed == transferId ? _self.transferId : transferId // ignore: cast_nullable_to_non_nullable
as int?,reversesMovementId: freezed == reversesMovementId ? _self.reversesMovementId : reversesMovementId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockMovementStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updaterName: freezed == updaterName ? _self.updaterName : updaterName // ignore: cast_nullable_to_non_nullable
as String?,sourceBranchName: freezed == sourceBranchName ? _self.sourceBranchName : sourceBranchName // ignore: cast_nullable_to_non_nullable
as String?,destinationBranchName: freezed == destinationBranchName ? _self.destinationBranchName : destinationBranchName // ignore: cast_nullable_to_non_nullable
as String?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockMovementItemModel?,
  ));
}

/// Create a copy of StockMovementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockMovementItemModelCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $StockMovementItemModelCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
