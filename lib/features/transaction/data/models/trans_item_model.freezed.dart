// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransItemModel {

 int get id; int get itemId; String get itemName; String get itemCode;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double get unitPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double get costPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get taxRate;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get taxableAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get taxAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get total;
/// Create a copy of TransItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemModelCopyWith<TransItemModel> get copyWith => _$TransItemModelCopyWithImpl<TransItemModel>(this as TransItemModel, _$identity);

  /// Serializes this TransItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,unitPrice,costPrice,taxRate,taxableAmount,taxAmount,total);

@override
String toString() {
  return 'TransItemModel(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, taxRate: $taxRate, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class $TransItemModelCopyWith<$Res>  {
  factory $TransItemModelCopyWith(TransItemModel value, $Res Function(TransItemModel) _then) = _$TransItemModelCopyWithImpl;
@useResult
$Res call({
 int id, int itemId, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double unitPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxRate,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxableAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total
});




}
/// @nodoc
class _$TransItemModelCopyWithImpl<$Res>
    implements $TransItemModelCopyWith<$Res> {
  _$TransItemModelCopyWithImpl(this._self, this._then);

  final TransItemModel _self;
  final $Res Function(TransItemModel) _then;

/// Create a copy of TransItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? unitPrice = null,Object? costPrice = null,Object? taxRate = freezed,Object? taxableAmount = freezed,Object? taxAmount = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,taxableAmount: freezed == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TransItemModel].
extension TransItemModelPatterns on TransItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)  $default,) {final _that = this;
switch (_that) {
case _TransItemModel():
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero)  double costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)?  $default,) {final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.unitPrice,_that.costPrice,_that.taxRate,_that.taxableAmount,_that.taxAmount,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransItemModel implements TransItemModel {
  const _TransItemModel({required this.id, required this.itemId, required this.itemName, required this.itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) required this.unitPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) required this.costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.taxableAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.taxAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.total});
  factory _TransItemModel.fromJson(Map<String, dynamic> json) => _$TransItemModelFromJson(json);

@override final  int id;
@override final  int itemId;
@override final  String itemName;
@override final  String itemCode;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) final  double unitPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) final  double costPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? taxRate;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? taxableAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? taxAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double total;

/// Create a copy of TransItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransItemModelCopyWith<_TransItemModel> get copyWith => __$TransItemModelCopyWithImpl<_TransItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.taxableAmount, taxableAmount) || other.taxableAmount == taxableAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,unitPrice,costPrice,taxRate,taxableAmount,taxAmount,total);

@override
String toString() {
  return 'TransItemModel(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, taxRate: $taxRate, taxableAmount: $taxableAmount, taxAmount: $taxAmount, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TransItemModelCopyWith<$Res> implements $TransItemModelCopyWith<$Res> {
  factory _$TransItemModelCopyWith(_TransItemModel value, $Res Function(_TransItemModel) _then) = __$TransItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int itemId, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double unitPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicOrZero) double costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxRate,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxableAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? taxAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total
});




}
/// @nodoc
class __$TransItemModelCopyWithImpl<$Res>
    implements _$TransItemModelCopyWith<$Res> {
  __$TransItemModelCopyWithImpl(this._self, this._then);

  final _TransItemModel _self;
  final $Res Function(_TransItemModel) _then;

/// Create a copy of TransItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? unitPrice = null,Object? costPrice = null,Object? taxRate = freezed,Object? taxableAmount = freezed,Object? taxAmount = freezed,Object? total = null,}) {
  return _then(_TransItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,taxRate: freezed == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double?,taxableAmount: freezed == taxableAmount ? _self.taxableAmount : taxableAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
