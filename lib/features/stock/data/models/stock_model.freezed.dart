// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; int get companyId; int get branchId; int get itemId; ItemModel get item; String get totalQuantity; String get lowStockThreshold;@JsonKey(fromJson: _stockStatusFromJson) StockStatus get lowStockStatus; String? get location; DateTime get createdAt; DateTime? get updatedAt; int? get createdBy; int? get updatedBy; List<StockBatchModel> get branchStockBatches;
/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockModelCopyWith<StockModel> get copyWith => _$StockModelCopyWithImpl<StockModel>(this as StockModel, _$identity);

  /// Serializes this StockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.lowStockThreshold, lowStockThreshold) || other.lowStockThreshold == lowStockThreshold)&&(identical(other.lowStockStatus, lowStockStatus) || other.lowStockStatus == lowStockStatus)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&const DeepCollectionEquality().equals(other.branchStockBatches, branchStockBatches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,branchId,itemId,item,totalQuantity,lowStockThreshold,lowStockStatus,location,createdAt,updatedAt,createdBy,updatedBy,const DeepCollectionEquality().hash(branchStockBatches));

@override
String toString() {
  return 'StockModel(id: $id, companyId: $companyId, branchId: $branchId, itemId: $itemId, item: $item, totalQuantity: $totalQuantity, lowStockThreshold: $lowStockThreshold, lowStockStatus: $lowStockStatus, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, branchStockBatches: $branchStockBatches)';
}


}

/// @nodoc
abstract mixin class $StockModelCopyWith<$Res>  {
  factory $StockModelCopyWith(StockModel value, $Res Function(StockModel) _then) = _$StockModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int companyId, int branchId, int itemId, ItemModel item, String totalQuantity, String lowStockThreshold,@JsonKey(fromJson: _stockStatusFromJson) StockStatus lowStockStatus, String? location, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy, List<StockBatchModel> branchStockBatches
});


$ItemModelCopyWith<$Res> get item;

}
/// @nodoc
class _$StockModelCopyWithImpl<$Res>
    implements $StockModelCopyWith<$Res> {
  _$StockModelCopyWithImpl(this._self, this._then);

  final StockModel _self;
  final $Res Function(StockModel) _then;

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? branchId = null,Object? itemId = null,Object? item = null,Object? totalQuantity = null,Object? lowStockThreshold = null,Object? lowStockStatus = null,Object? location = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? branchStockBatches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ItemModel,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as String,lowStockThreshold: null == lowStockThreshold ? _self.lowStockThreshold : lowStockThreshold // ignore: cast_nullable_to_non_nullable
as String,lowStockStatus: null == lowStockStatus ? _self.lowStockStatus : lowStockStatus // ignore: cast_nullable_to_non_nullable
as StockStatus,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,branchStockBatches: null == branchStockBatches ? _self.branchStockBatches : branchStockBatches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,
  ));
}
/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemModelCopyWith<$Res> get item {
  
  return $ItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockModel].
extension StockModelPatterns on StockModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockModel value)  $default,){
final _that = this;
switch (_that) {
case _StockModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int branchId,  int itemId,  ItemModel item,  String totalQuantity,  String lowStockThreshold, @JsonKey(fromJson: _stockStatusFromJson)  StockStatus lowStockStatus,  String? location,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  List<StockBatchModel> branchStockBatches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.item,_that.totalQuantity,_that.lowStockThreshold,_that.lowStockStatus,_that.location,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.branchStockBatches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int branchId,  int itemId,  ItemModel item,  String totalQuantity,  String lowStockThreshold, @JsonKey(fromJson: _stockStatusFromJson)  StockStatus lowStockStatus,  String? location,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  List<StockBatchModel> branchStockBatches)  $default,) {final _that = this;
switch (_that) {
case _StockModel():
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.item,_that.totalQuantity,_that.lowStockThreshold,_that.lowStockStatus,_that.location,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.branchStockBatches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int companyId,  int branchId,  int itemId,  ItemModel item,  String totalQuantity,  String lowStockThreshold, @JsonKey(fromJson: _stockStatusFromJson)  StockStatus lowStockStatus,  String? location,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy,  List<StockBatchModel> branchStockBatches)?  $default,) {final _that = this;
switch (_that) {
case _StockModel() when $default != null:
return $default(_that.id,_that.companyId,_that.branchId,_that.itemId,_that.item,_that.totalQuantity,_that.lowStockThreshold,_that.lowStockStatus,_that.location,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.branchStockBatches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockModel implements StockModel {
  const _StockModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.companyId, required this.branchId, required this.itemId, required this.item, this.totalQuantity = '0', this.lowStockThreshold = '0', @JsonKey(fromJson: _stockStatusFromJson) required this.lowStockStatus, this.location, required this.createdAt, this.updatedAt, this.createdBy, this.updatedBy, final  List<StockBatchModel> branchStockBatches = const []}): _branchStockBatches = branchStockBatches;
  factory _StockModel.fromJson(Map<String, dynamic> json) => _$StockModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  int companyId;
@override final  int branchId;
@override final  int itemId;
@override final  ItemModel item;
@override@JsonKey() final  String totalQuantity;
@override@JsonKey() final  String lowStockThreshold;
@override@JsonKey(fromJson: _stockStatusFromJson) final  StockStatus lowStockStatus;
@override final  String? location;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
 final  List<StockBatchModel> _branchStockBatches;
@override@JsonKey() List<StockBatchModel> get branchStockBatches {
  if (_branchStockBatches is EqualUnmodifiableListView) return _branchStockBatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_branchStockBatches);
}


/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockModelCopyWith<_StockModel> get copyWith => __$StockModelCopyWithImpl<_StockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.item, item) || other.item == item)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.lowStockThreshold, lowStockThreshold) || other.lowStockThreshold == lowStockThreshold)&&(identical(other.lowStockStatus, lowStockStatus) || other.lowStockStatus == lowStockStatus)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&const DeepCollectionEquality().equals(other._branchStockBatches, _branchStockBatches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,branchId,itemId,item,totalQuantity,lowStockThreshold,lowStockStatus,location,createdAt,updatedAt,createdBy,updatedBy,const DeepCollectionEquality().hash(_branchStockBatches));

@override
String toString() {
  return 'StockModel(id: $id, companyId: $companyId, branchId: $branchId, itemId: $itemId, item: $item, totalQuantity: $totalQuantity, lowStockThreshold: $lowStockThreshold, lowStockStatus: $lowStockStatus, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, branchStockBatches: $branchStockBatches)';
}


}

/// @nodoc
abstract mixin class _$StockModelCopyWith<$Res> implements $StockModelCopyWith<$Res> {
  factory _$StockModelCopyWith(_StockModel value, $Res Function(_StockModel) _then) = __$StockModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int companyId, int branchId, int itemId, ItemModel item, String totalQuantity, String lowStockThreshold,@JsonKey(fromJson: _stockStatusFromJson) StockStatus lowStockStatus, String? location, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy, List<StockBatchModel> branchStockBatches
});


@override $ItemModelCopyWith<$Res> get item;

}
/// @nodoc
class __$StockModelCopyWithImpl<$Res>
    implements _$StockModelCopyWith<$Res> {
  __$StockModelCopyWithImpl(this._self, this._then);

  final _StockModel _self;
  final $Res Function(_StockModel) _then;

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? branchId = null,Object? itemId = null,Object? item = null,Object? totalQuantity = null,Object? lowStockThreshold = null,Object? lowStockStatus = null,Object? location = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? branchStockBatches = null,}) {
  return _then(_StockModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ItemModel,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as String,lowStockThreshold: null == lowStockThreshold ? _self.lowStockThreshold : lowStockThreshold // ignore: cast_nullable_to_non_nullable
as String,lowStockStatus: null == lowStockStatus ? _self.lowStockStatus : lowStockStatus // ignore: cast_nullable_to_non_nullable
as StockStatus,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,branchStockBatches: null == branchStockBatches ? _self._branchStockBatches : branchStockBatches // ignore: cast_nullable_to_non_nullable
as List<StockBatchModel>,
  ));
}

/// Create a copy of StockModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemModelCopyWith<$Res> get item {
  
  return $ItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
