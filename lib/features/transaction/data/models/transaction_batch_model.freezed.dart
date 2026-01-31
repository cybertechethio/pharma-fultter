// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionBatchModel {

 String get batchNumber; double get quantity; double get costPrice; double get unitPrice;
/// Create a copy of TransactionBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionBatchModelCopyWith<TransactionBatchModel> get copyWith => _$TransactionBatchModelCopyWithImpl<TransactionBatchModel>(this as TransactionBatchModel, _$identity);

  /// Serializes this TransactionBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionBatchModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice);

@override
String toString() {
  return 'TransactionBatchModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $TransactionBatchModelCopyWith<$Res>  {
  factory $TransactionBatchModelCopyWith(TransactionBatchModel value, $Res Function(TransactionBatchModel) _then) = _$TransactionBatchModelCopyWithImpl;
@useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice
});




}
/// @nodoc
class _$TransactionBatchModelCopyWithImpl<$Res>
    implements $TransactionBatchModelCopyWith<$Res> {
  _$TransactionBatchModelCopyWithImpl(this._self, this._then);

  final TransactionBatchModel _self;
  final $Res Function(TransactionBatchModel) _then;

/// Create a copy of TransactionBatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionBatchModel].
extension TransactionBatchModelPatterns on TransactionBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionBatchModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice)  $default,) {final _that = this;
switch (_that) {
case _TransactionBatchModel():
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber,  double quantity,  double costPrice,  double unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _TransactionBatchModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionBatchModel implements TransactionBatchModel {
  const _TransactionBatchModel({required this.batchNumber, required this.quantity, required this.costPrice, required this.unitPrice});
  factory _TransactionBatchModel.fromJson(Map<String, dynamic> json) => _$TransactionBatchModelFromJson(json);

@override final  String batchNumber;
@override final  double quantity;
@override final  double costPrice;
@override final  double unitPrice;

/// Create a copy of TransactionBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionBatchModelCopyWith<_TransactionBatchModel> get copyWith => __$TransactionBatchModelCopyWithImpl<_TransactionBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionBatchModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice);

@override
String toString() {
  return 'TransactionBatchModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$TransactionBatchModelCopyWith<$Res> implements $TransactionBatchModelCopyWith<$Res> {
  factory _$TransactionBatchModelCopyWith(_TransactionBatchModel value, $Res Function(_TransactionBatchModel) _then) = __$TransactionBatchModelCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber, double quantity, double costPrice, double unitPrice
});




}
/// @nodoc
class __$TransactionBatchModelCopyWithImpl<$Res>
    implements _$TransactionBatchModelCopyWith<$Res> {
  __$TransactionBatchModelCopyWithImpl(this._self, this._then);

  final _TransactionBatchModel _self;
  final $Res Function(_TransactionBatchModel) _then;

/// Create a copy of TransactionBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,}) {
  return _then(_TransactionBatchModel(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
