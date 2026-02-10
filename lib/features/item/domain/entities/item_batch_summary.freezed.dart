// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_batch_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemBatchSummary {

 int get id; String get batchNumber; String? get batchName; double? get costPrice; double? get unitPrice; int get quantity;
/// Create a copy of ItemBatchSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemBatchSummaryCopyWith<ItemBatchSummary> get copyWith => _$ItemBatchSummaryCopyWithImpl<ItemBatchSummary>(this as ItemBatchSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemBatchSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,batchName,costPrice,unitPrice,quantity);

@override
String toString() {
  return 'ItemBatchSummary(id: $id, batchNumber: $batchNumber, batchName: $batchName, costPrice: $costPrice, unitPrice: $unitPrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ItemBatchSummaryCopyWith<$Res>  {
  factory $ItemBatchSummaryCopyWith(ItemBatchSummary value, $Res Function(ItemBatchSummary) _then) = _$ItemBatchSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String batchNumber, String? batchName, double? costPrice, double? unitPrice, int quantity
});




}
/// @nodoc
class _$ItemBatchSummaryCopyWithImpl<$Res>
    implements $ItemBatchSummaryCopyWith<$Res> {
  _$ItemBatchSummaryCopyWithImpl(this._self, this._then);

  final ItemBatchSummary _self;
  final $Res Function(ItemBatchSummary) _then;

/// Create a copy of ItemBatchSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? batchNumber = null,Object? batchName = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: freezed == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemBatchSummary].
extension ItemBatchSummaryPatterns on ItemBatchSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemBatchSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemBatchSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemBatchSummary value)  $default,){
final _that = this;
switch (_that) {
case _ItemBatchSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemBatchSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ItemBatchSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String batchNumber,  String? batchName,  double? costPrice,  double? unitPrice,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemBatchSummary() when $default != null:
return $default(_that.id,_that.batchNumber,_that.batchName,_that.costPrice,_that.unitPrice,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String batchNumber,  String? batchName,  double? costPrice,  double? unitPrice,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _ItemBatchSummary():
return $default(_that.id,_that.batchNumber,_that.batchName,_that.costPrice,_that.unitPrice,_that.quantity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String batchNumber,  String? batchName,  double? costPrice,  double? unitPrice,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _ItemBatchSummary() when $default != null:
return $default(_that.id,_that.batchNumber,_that.batchName,_that.costPrice,_that.unitPrice,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _ItemBatchSummary implements ItemBatchSummary {
  const _ItemBatchSummary({required this.id, required this.batchNumber, this.batchName, this.costPrice, this.unitPrice, required this.quantity});
  

@override final  int id;
@override final  String batchNumber;
@override final  String? batchName;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  int quantity;

/// Create a copy of ItemBatchSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemBatchSummaryCopyWith<_ItemBatchSummary> get copyWith => __$ItemBatchSummaryCopyWithImpl<_ItemBatchSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemBatchSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,batchNumber,batchName,costPrice,unitPrice,quantity);

@override
String toString() {
  return 'ItemBatchSummary(id: $id, batchNumber: $batchNumber, batchName: $batchName, costPrice: $costPrice, unitPrice: $unitPrice, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ItemBatchSummaryCopyWith<$Res> implements $ItemBatchSummaryCopyWith<$Res> {
  factory _$ItemBatchSummaryCopyWith(_ItemBatchSummary value, $Res Function(_ItemBatchSummary) _then) = __$ItemBatchSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String batchNumber, String? batchName, double? costPrice, double? unitPrice, int quantity
});




}
/// @nodoc
class __$ItemBatchSummaryCopyWithImpl<$Res>
    implements _$ItemBatchSummaryCopyWith<$Res> {
  __$ItemBatchSummaryCopyWithImpl(this._self, this._then);

  final _ItemBatchSummary _self;
  final $Res Function(_ItemBatchSummary) _then;

/// Create a copy of ItemBatchSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? batchNumber = null,Object? batchName = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? quantity = null,}) {
  return _then(_ItemBatchSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,batchName: freezed == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
