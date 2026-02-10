// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_item_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferItemBatchModel {

 int get id; int? get transferItemId; String get batchNumber; int get quantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get costPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get unitPrice; DateTime? get expirationDate;
/// Create a copy of TransferItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferItemBatchModelCopyWith<TransferItemBatchModel> get copyWith => _$TransferItemBatchModelCopyWithImpl<TransferItemBatchModel>(this as TransferItemBatchModel, _$identity);

  /// Serializes this TransferItemBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferItemBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transferItemId, transferItemId) || other.transferItemId == transferItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transferItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransferItemBatchModel(id: $id, transferItemId: $transferItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $TransferItemBatchModelCopyWith<$Res>  {
  factory $TransferItemBatchModelCopyWith(TransferItemBatchModel value, $Res Function(TransferItemBatchModel) _then) = _$TransferItemBatchModelCopyWithImpl;
@useResult
$Res call({
 int id, int? transferItemId, String batchNumber, int quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class _$TransferItemBatchModelCopyWithImpl<$Res>
    implements $TransferItemBatchModelCopyWith<$Res> {
  _$TransferItemBatchModelCopyWithImpl(this._self, this._then);

  final TransferItemBatchModel _self;
  final $Res Function(TransferItemBatchModel) _then;

/// Create a copy of TransferItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transferItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferItemId: freezed == transferItemId ? _self.transferItemId : transferItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferItemBatchModel].
extension TransferItemBatchModelPatterns on TransferItemBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferItemBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferItemBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferItemBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferItemBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferItemBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferItemBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? transferItemId,  String batchNumber,  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferItemBatchModel() when $default != null:
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? transferItemId,  String batchNumber,  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _TransferItemBatchModel():
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? transferItemId,  String batchNumber,  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _TransferItemBatchModel() when $default != null:
return $default(_that.id,_that.transferItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferItemBatchModel implements TransferItemBatchModel {
  const _TransferItemBatchModel({required this.id, this.transferItemId, required this.batchNumber, required this.quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.unitPrice, this.expirationDate});
  factory _TransferItemBatchModel.fromJson(Map<String, dynamic> json) => _$TransferItemBatchModelFromJson(json);

@override final  int id;
@override final  int? transferItemId;
@override final  String batchNumber;
@override final  int quantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? costPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? unitPrice;
@override final  DateTime? expirationDate;

/// Create a copy of TransferItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferItemBatchModelCopyWith<_TransferItemBatchModel> get copyWith => __$TransferItemBatchModelCopyWithImpl<_TransferItemBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferItemBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferItemBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transferItemId, transferItemId) || other.transferItemId == transferItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transferItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransferItemBatchModel(id: $id, transferItemId: $transferItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$TransferItemBatchModelCopyWith<$Res> implements $TransferItemBatchModelCopyWith<$Res> {
  factory _$TransferItemBatchModelCopyWith(_TransferItemBatchModel value, $Res Function(_TransferItemBatchModel) _then) = __$TransferItemBatchModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int? transferItemId, String batchNumber, int quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class __$TransferItemBatchModelCopyWithImpl<$Res>
    implements _$TransferItemBatchModelCopyWith<$Res> {
  __$TransferItemBatchModelCopyWithImpl(this._self, this._then);

  final _TransferItemBatchModel _self;
  final $Res Function(_TransferItemBatchModel) _then;

/// Create a copy of TransferItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transferItemId = freezed,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_TransferItemBatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transferItemId: freezed == transferItemId ? _self.transferItemId : transferItemId // ignore: cast_nullable_to_non_nullable
as int?,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
