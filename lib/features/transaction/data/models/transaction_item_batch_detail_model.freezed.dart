// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_batch_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionItemBatchDetailModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get batchNumber;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get costPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get unitPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get taxableAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get taxAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get total;@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable) DateTime? get expirationDate; String get allocatedFrom;@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime get createdAt;
/// Create a copy of TransactionItemBatchDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemBatchDetailModelCopyWith<TransactionItemBatchDetailModel> get copyWith => _$TransactionItemBatchDetailModelCopyWithImpl<TransactionItemBatchDetailModel>(this as TransactionItemBatchDetailModel, _$identity);

  /// Serializes this TransactionItemBatchDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemBatchDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,quantity,costPrice,unitPrice,taxableAmount,taxAmount,total,expirationDate,allocatedFrom,createdAt);

@override
String toString() {
  return 'TransactionItemBatchDetailModel(id: $id, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionItemBatchDetailModelCopyWith<$Res>  {
  factory $TransactionItemBatchDetailModelCopyWith(TransactionItemBatchDetailModel value, $Res Function(TransactionItemBatchDetailModel) _then) = _$TransactionItemBatchDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String batchNumber,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double unitPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double taxableAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double taxAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable) DateTime? expirationDate, String allocatedFrom,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt
});




}
/// @nodoc
class _$TransactionItemBatchDetailModelCopyWithImpl<$Res>
    implements $TransactionItemBatchDetailModelCopyWith<$Res> {
  _$TransactionItemBatchDetailModelCopyWithImpl(this._self, this._then);

  final TransactionItemBatchDetailModel _self;
  final $Res Function(TransactionItemBatchDetailModel) _then;

/// Create a copy of TransactionItemBatchDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? taxableAmount = null,Object? taxAmount = null,Object? total = null,Object? expirationDate = freezed,Object? allocatedFrom = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,taxableAmount: null == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: null == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemBatchDetailModel].
extension TransactionItemBatchDetailModelPatterns on TransactionItemBatchDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemBatchDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemBatchDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemBatchDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable)  DateTime? expirationDate,  String allocatedFrom, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel() when $default != null:
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable)  DateTime? expirationDate,  String allocatedFrom, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel():
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable)  DateTime? expirationDate,  String allocatedFrom, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemBatchDetailModel() when $default != null:
return $default(_that.id,_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.taxableAmount,_that.taxAmount,_that.total,_that.expirationDate,_that.allocatedFrom,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemBatchDetailModel implements TransactionItemBatchDetailModel {
  const _TransactionItemBatchDetailModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.batchNumber, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable) this.expirationDate, required this.allocatedFrom, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) required this.createdAt});
  factory _TransactionItemBatchDetailModel.fromJson(Map<String, dynamic> json) => _$TransactionItemBatchDetailModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String batchNumber;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double costPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double unitPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double taxableAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double taxAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double total;
@override@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable) final  DateTime? expirationDate;
@override final  String allocatedFrom;
@override@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) final  DateTime createdAt;

/// Create a copy of TransactionItemBatchDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemBatchDetailModelCopyWith<_TransactionItemBatchDetailModel> get copyWith => __$TransactionItemBatchDetailModelCopyWithImpl<_TransactionItemBatchDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemBatchDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemBatchDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.allocatedFrom, allocatedFrom) || other.allocatedFrom == allocatedFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,quantity,costPrice,unitPrice,taxableAmount,taxAmount,total,expirationDate,allocatedFrom,createdAt);

@override
String toString() {
  return 'TransactionItemBatchDetailModel(id: $id, batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total, expirationDate: $expirationDate, allocatedFrom: $allocatedFrom, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemBatchDetailModelCopyWith<$Res> implements $TransactionItemBatchDetailModelCopyWith<$Res> {
  factory _$TransactionItemBatchDetailModelCopyWith(_TransactionItemBatchDetailModel value, $Res Function(_TransactionItemBatchDetailModel) _then) = __$TransactionItemBatchDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String batchNumber,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double unitPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double taxableAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double taxAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamicNullable) DateTime? expirationDate, String allocatedFrom,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt
});




}
/// @nodoc
class __$TransactionItemBatchDetailModelCopyWithImpl<$Res>
    implements _$TransactionItemBatchDetailModelCopyWith<$Res> {
  __$TransactionItemBatchDetailModelCopyWithImpl(this._self, this._then);

  final _TransactionItemBatchDetailModel _self;
  final $Res Function(_TransactionItemBatchDetailModel) _then;

/// Create a copy of TransactionItemBatchDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? batchNumber = null,Object? quantity = null,Object? costPrice = null,Object? unitPrice = null,Object? taxableAmount = null,Object? taxAmount = null,Object? total = null,Object? expirationDate = freezed,Object? allocatedFrom = null,Object? createdAt = null,}) {
  return _then(_TransactionItemBatchDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,taxableAmount: null == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,allocatedFrom: null == allocatedFrom ? _self.allocatedFrom : allocatedFrom // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
