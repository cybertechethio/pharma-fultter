// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockBatchModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; int get batchId; String get quantity; String get costPrice; String get unitPrice; DateTime? get lastUsedAt; String get batchNumber; String get batchName; DateTime? get expirationDate;
/// Create a copy of StockBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockBatchModelCopyWith<StockBatchModel> get copyWith => _$StockBatchModelCopyWithImpl<StockBatchModel>(this as StockBatchModel, _$identity);

  /// Serializes this StockBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,batchId,quantity,costPrice,unitPrice,lastUsedAt,batchNumber,batchName,expirationDate);

@override
String toString() {
  return 'StockBatchModel(id: $id, batchId: $batchId, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, lastUsedAt: $lastUsedAt, batchNumber: $batchNumber, batchName: $batchName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $StockBatchModelCopyWith<$Res>  {
  factory $StockBatchModelCopyWith(StockBatchModel value, $Res Function(StockBatchModel) _then) = _$StockBatchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int batchId, String quantity, String costPrice, String unitPrice, DateTime? lastUsedAt, String batchNumber, String batchName, DateTime? expirationDate
});




}
/// @nodoc
class _$StockBatchModelCopyWithImpl<$Res>
    implements $StockBatchModelCopyWith<$Res> {
  _$StockBatchModelCopyWithImpl(this._self, this._then);

  final StockBatchModel _self;
  final $Res Function(StockBatchModel) _then;

/// Create a copy of StockBatchModel
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


/// Adds pattern-matching-related methods to [StockBatchModel].
extension StockBatchModelPatterns on StockBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _StockBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockBatchModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _StockBatchModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  int batchId,  String quantity,  String costPrice,  String unitPrice,  DateTime? lastUsedAt,  String batchNumber,  String batchName,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _StockBatchModel() when $default != null:
return $default(_that.id,_that.batchId,_that.quantity,_that.costPrice,_that.unitPrice,_that.lastUsedAt,_that.batchNumber,_that.batchName,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockBatchModel implements StockBatchModel {
  const _StockBatchModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.batchId, this.quantity = '0', this.costPrice = '0', this.unitPrice = '0', this.lastUsedAt, this.batchNumber = '', this.batchName = '', this.expirationDate});
  factory _StockBatchModel.fromJson(Map<String, dynamic> json) => _$StockBatchModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  int batchId;
@override@JsonKey() final  String quantity;
@override@JsonKey() final  String costPrice;
@override@JsonKey() final  String unitPrice;
@override final  DateTime? lastUsedAt;
@override@JsonKey() final  String batchNumber;
@override@JsonKey() final  String batchName;
@override final  DateTime? expirationDate;

/// Create a copy of StockBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockBatchModelCopyWith<_StockBatchModel> get copyWith => __$StockBatchModelCopyWithImpl<_StockBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,batchId,quantity,costPrice,unitPrice,lastUsedAt,batchNumber,batchName,expirationDate);

@override
String toString() {
  return 'StockBatchModel(id: $id, batchId: $batchId, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, lastUsedAt: $lastUsedAt, batchNumber: $batchNumber, batchName: $batchName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$StockBatchModelCopyWith<$Res> implements $StockBatchModelCopyWith<$Res> {
  factory _$StockBatchModelCopyWith(_StockBatchModel value, $Res Function(_StockBatchModel) _then) = __$StockBatchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, int batchId, String quantity, String costPrice, String unitPrice, DateTime? lastUsedAt, String batchNumber, String batchName, DateTime? expirationDate
});




}
/// @nodoc
class __$StockBatchModelCopyWithImpl<$Res>
    implements _$StockBatchModelCopyWith<$Res> {
  __$StockBatchModelCopyWithImpl(this._self, this._then);

  final _StockBatchModel _self;
  final $Res Function(_StockBatchModel) _then;

/// Create a copy of StockBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? batchId = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? lastUsedAt = freezed,Object? batchNumber = null,Object? batchName = null,Object? expirationDate = freezed,}) {
  return _then(_StockBatchModel(
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
