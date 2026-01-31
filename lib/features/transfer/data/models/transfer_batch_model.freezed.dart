// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferBatchModel {

 String get batchNumber; double get quantity; double get costPrice; double get unitPrice; DateTime? get expirationDate; String? get allocatedFrom;
/// Create a copy of TransferBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferBatchModelCopyWith<TransferBatchModel> get copyWith => _$TransferBatchModelCopyWithImpl<TransferBatchModel>(this as TransferBatchModel, _$identity);

  /// Serializes this TransferBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferBatchModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate,allocatedFrom);

@override
String toString() {
  return 'TransferBatchModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom)';
}


}

/// @nodoc
abstract mixin class $TransferBatchModelCopyWith<$Res>  {
  factory $TransferBatchModelCopyWith(TransferBatchModel value, $Res Function(TransferBatchModel) _then) = _$TransferBatchModelCopyWithImpl;
@useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice, DateTime? expirationDate, String? allocatedFrom
});




}
/// @nodoc
class _$TransferBatchModelCopyWithImpl<$Res>
    implements $TransferBatchModelCopyWith<$Res> {
  _$TransferBatchModelCopyWithImpl(this._self, this._then);

  final TransferBatchModel _self;
  final $Res Function(TransferBatchModel) _then;

/// Create a copy of TransferBatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? allocatedFrom = freezed,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: freezed == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferBatchModel].
extension TransferBatchModelPatterns on TransferBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferBatchModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)  $default,) {final _that = this;
switch (_that) {
case _TransferBatchModel():
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice,  DateTime? expirationDate,  String? allocatedFrom)?  $default,) {final _that = this;
switch (_that) {
case _TransferBatchModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.allocatedFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferBatchModel implements TransferBatchModel {
  const _TransferBatchModel({required this.batchNumber, required this.quantity, required this.costPrice, required this.unitPrice, this.expirationDate, this.allocatedFrom});
  factory _TransferBatchModel.fromJson(Map<String, dynamic> json) => _$TransferBatchModelFromJson(json);

@override final  String batchNumber;
@override final  double quantity;
@override final  double costPrice;
@override final  double unitPrice;
@override final  DateTime? expirationDate;
@override final  String? allocatedFrom;

/// Create a copy of TransferBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferBatchModelCopyWith<_TransferBatchModel> get copyWith => __$TransferBatchModelCopyWithImpl<_TransferBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferBatchModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate,allocatedFrom);

@override
String toString() {
  return 'TransferBatchModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom)';
}


}

/// @nodoc
abstract mixin class _$TransferBatchModelCopyWith<$Res> implements $TransferBatchModelCopyWith<$Res> {
  factory _$TransferBatchModelCopyWith(_TransferBatchModel value, $Res Function(_TransferBatchModel) _then) = __$TransferBatchModelCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice, DateTime? expirationDate, String? allocatedFrom
});




}
/// @nodoc
class __$TransferBatchModelCopyWithImpl<$Res>
    implements _$TransferBatchModelCopyWith<$Res> {
  __$TransferBatchModelCopyWithImpl(this._self, this._then);

  final _TransferBatchModel _self;
  final $Res Function(_TransferBatchModel) _then;

/// Create a copy of TransferBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? allocatedFrom = freezed,}) {
  return _then(_TransferBatchModel(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: freezed == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
