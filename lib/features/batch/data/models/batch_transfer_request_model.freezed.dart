// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_transfer_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchTransferRequestModel {

 int get itemId; String get sourceBatchNumber; String get destinationBatchNumber; int get quantity; double? get costPrice; double? get unitPrice; String? get expirationDate; String? get notes;
/// Create a copy of BatchTransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchTransferRequestModelCopyWith<BatchTransferRequestModel> get copyWith => _$BatchTransferRequestModelCopyWithImpl<BatchTransferRequestModel>(this as BatchTransferRequestModel, _$identity);

  /// Serializes this BatchTransferRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchTransferRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sourceBatchNumber, sourceBatchNumber) || other.sourceBatchNumber == sourceBatchNumber)&&(identical(other.destinationBatchNumber, destinationBatchNumber) || other.destinationBatchNumber == destinationBatchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sourceBatchNumber,destinationBatchNumber,quantity,costPrice,unitPrice,expirationDate,notes);

@override
String toString() {
  return 'BatchTransferRequestModel(itemId: $itemId, sourceBatchNumber: $sourceBatchNumber, destinationBatchNumber: $destinationBatchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BatchTransferRequestModelCopyWith<$Res>  {
  factory $BatchTransferRequestModelCopyWith(BatchTransferRequestModel value, $Res Function(BatchTransferRequestModel) _then) = _$BatchTransferRequestModelCopyWithImpl;
@useResult
$Res call({
 int itemId, String sourceBatchNumber, String destinationBatchNumber, int quantity, double? costPrice, double? unitPrice, String? expirationDate, String? notes
});




}
/// @nodoc
class _$BatchTransferRequestModelCopyWithImpl<$Res>
    implements $BatchTransferRequestModelCopyWith<$Res> {
  _$BatchTransferRequestModelCopyWithImpl(this._self, this._then);

  final BatchTransferRequestModel _self;
  final $Res Function(BatchTransferRequestModel) _then;

/// Create a copy of BatchTransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? sourceBatchNumber = null,Object? destinationBatchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,sourceBatchNumber: null == sourceBatchNumber ? _self.sourceBatchNumber : sourceBatchNumber // ignore: cast_nullable_to_non_nullable
as String,destinationBatchNumber: null == destinationBatchNumber ? _self.destinationBatchNumber : destinationBatchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchTransferRequestModel].
extension BatchTransferRequestModelPatterns on BatchTransferRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchTransferRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchTransferRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchTransferRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BatchTransferRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchTransferRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BatchTransferRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  String sourceBatchNumber,  String destinationBatchNumber,  int quantity,  double? costPrice,  double? unitPrice,  String? expirationDate,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchTransferRequestModel() when $default != null:
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinationBatchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  String sourceBatchNumber,  String destinationBatchNumber,  int quantity,  double? costPrice,  double? unitPrice,  String? expirationDate,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _BatchTransferRequestModel():
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinationBatchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  String sourceBatchNumber,  String destinationBatchNumber,  int quantity,  double? costPrice,  double? unitPrice,  String? expirationDate,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _BatchTransferRequestModel() when $default != null:
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinationBatchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchTransferRequestModel implements BatchTransferRequestModel {
  const _BatchTransferRequestModel({required this.itemId, required this.sourceBatchNumber, required this.destinationBatchNumber, required this.quantity, this.costPrice, this.unitPrice, this.expirationDate, this.notes});
  factory _BatchTransferRequestModel.fromJson(Map<String, dynamic> json) => _$BatchTransferRequestModelFromJson(json);

@override final  int itemId;
@override final  String sourceBatchNumber;
@override final  String destinationBatchNumber;
@override final  int quantity;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  String? expirationDate;
@override final  String? notes;

/// Create a copy of BatchTransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchTransferRequestModelCopyWith<_BatchTransferRequestModel> get copyWith => __$BatchTransferRequestModelCopyWithImpl<_BatchTransferRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchTransferRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchTransferRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sourceBatchNumber, sourceBatchNumber) || other.sourceBatchNumber == sourceBatchNumber)&&(identical(other.destinationBatchNumber, destinationBatchNumber) || other.destinationBatchNumber == destinationBatchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sourceBatchNumber,destinationBatchNumber,quantity,costPrice,unitPrice,expirationDate,notes);

@override
String toString() {
  return 'BatchTransferRequestModel(itemId: $itemId, sourceBatchNumber: $sourceBatchNumber, destinationBatchNumber: $destinationBatchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BatchTransferRequestModelCopyWith<$Res> implements $BatchTransferRequestModelCopyWith<$Res> {
  factory _$BatchTransferRequestModelCopyWith(_BatchTransferRequestModel value, $Res Function(_BatchTransferRequestModel) _then) = __$BatchTransferRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int itemId, String sourceBatchNumber, String destinationBatchNumber, int quantity, double? costPrice, double? unitPrice, String? expirationDate, String? notes
});




}
/// @nodoc
class __$BatchTransferRequestModelCopyWithImpl<$Res>
    implements _$BatchTransferRequestModelCopyWith<$Res> {
  __$BatchTransferRequestModelCopyWithImpl(this._self, this._then);

  final _BatchTransferRequestModel _self;
  final $Res Function(_BatchTransferRequestModel) _then;

/// Create a copy of BatchTransferRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? sourceBatchNumber = null,Object? destinationBatchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,Object? notes = freezed,}) {
  return _then(_BatchTransferRequestModel(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,sourceBatchNumber: null == sourceBatchNumber ? _self.sourceBatchNumber : sourceBatchNumber // ignore: cast_nullable_to_non_nullable
as String,destinationBatchNumber: null == destinationBatchNumber ? _self.destinationBatchNumber : destinationBatchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
