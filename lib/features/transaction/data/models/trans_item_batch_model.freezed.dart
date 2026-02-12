// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_item_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransItemBatchModel {

 int get id; int get transactionItemId; String get batchNumber;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get costPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get unitPrice; DateTime? get expirationDate;
/// Create a copy of TransItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemBatchModelCopyWith<TransItemBatchModel> get copyWith => _$TransItemBatchModelCopyWithImpl<TransItemBatchModel>(this as TransItemBatchModel, _$identity);

  /// Serializes this TransItemBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItemBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionItemId, transactionItemId) || other.transactionItemId == transactionItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransItemBatchModel(id: $id, transactionItemId: $transactionItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $TransItemBatchModelCopyWith<$Res>  {
  factory $TransItemBatchModelCopyWith(TransItemBatchModel value, $Res Function(TransItemBatchModel) _then) = _$TransItemBatchModelCopyWithImpl;
@useResult
$Res call({
 int id, int transactionItemId, String batchNumber,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class _$TransItemBatchModelCopyWithImpl<$Res>
    implements $TransItemBatchModelCopyWith<$Res> {
  _$TransItemBatchModelCopyWithImpl(this._self, this._then);

  final TransItemBatchModel _self;
  final $Res Function(TransItemBatchModel) _then;

/// Create a copy of TransItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionItemId = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionItemId: null == transactionItemId ? _self.transactionItemId : transactionItemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransItemBatchModel].
extension TransItemBatchModelPatterns on TransItemBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransItemBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransItemBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransItemBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _TransItemBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransItemBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransItemBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int transactionItemId,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItemBatchModel() when $default != null:
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int transactionItemId,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _TransItemBatchModel():
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int transactionItemId,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _TransItemBatchModel() when $default != null:
return $default(_that.id,_that.transactionItemId,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransItemBatchModel implements TransItemBatchModel {
  const _TransItemBatchModel({required this.id, required this.transactionItemId, required this.batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.unitPrice, this.expirationDate});
  factory _TransItemBatchModel.fromJson(Map<String, dynamic> json) => _$TransItemBatchModelFromJson(json);

@override final  int id;
@override final  int transactionItemId;
@override final  String batchNumber;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? costPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? unitPrice;
@override final  DateTime? expirationDate;

/// Create a copy of TransItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransItemBatchModelCopyWith<_TransItemBatchModel> get copyWith => __$TransItemBatchModelCopyWithImpl<_TransItemBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransItemBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItemBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionItemId, transactionItemId) || other.transactionItemId == transactionItemId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionItemId,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'TransItemBatchModel(id: $id, transactionItemId: $transactionItemId, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$TransItemBatchModelCopyWith<$Res> implements $TransItemBatchModelCopyWith<$Res> {
  factory _$TransItemBatchModelCopyWith(_TransItemBatchModel value, $Res Function(_TransItemBatchModel) _then) = __$TransItemBatchModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int transactionItemId, String batchNumber,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice, DateTime? expirationDate
});




}
/// @nodoc
class __$TransItemBatchModelCopyWithImpl<$Res>
    implements _$TransItemBatchModelCopyWith<$Res> {
  __$TransItemBatchModelCopyWithImpl(this._self, this._then);

  final _TransItemBatchModel _self;
  final $Res Function(_TransItemBatchModel) _then;

/// Create a copy of TransItemBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionItemId = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_TransItemBatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionItemId: null == transactionItemId ? _self.transactionItemId : transactionItemId // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
