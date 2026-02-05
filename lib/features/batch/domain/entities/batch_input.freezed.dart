// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BatchInput {

 int? get itemId; String get batchName; double get costPrice; double get unitPrice; String? get expirationDate; String? get manufacturingDate; String? get supplierBatchNumber; String? get notes;
/// Create a copy of BatchInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchInputCopyWith<BatchInput> get copyWith => _$BatchInputCopyWithImpl<BatchInput>(this as BatchInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchInput&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,batchName,costPrice,unitPrice,expirationDate,manufacturingDate,supplierBatchNumber,notes);

@override
String toString() {
  return 'BatchInput(itemId: $itemId, batchName: $batchName, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, supplierBatchNumber: $supplierBatchNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BatchInputCopyWith<$Res>  {
  factory $BatchInputCopyWith(BatchInput value, $Res Function(BatchInput) _then) = _$BatchInputCopyWithImpl;
@useResult
$Res call({
 int? itemId, String batchName, double costPrice, double unitPrice, String? expirationDate, String? manufacturingDate, String? supplierBatchNumber, String? notes
});




}
/// @nodoc
class _$BatchInputCopyWithImpl<$Res>
    implements $BatchInputCopyWith<$Res> {
  _$BatchInputCopyWithImpl(this._self, this._then);

  final BatchInput _self;
  final $Res Function(BatchInput) _then;

/// Create a copy of BatchInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = freezed,Object? batchName = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchInput].
extension BatchInputPatterns on BatchInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchInput value)  $default,){
final _that = this;
switch (_that) {
case _BatchInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchInput value)?  $default,){
final _that = this;
switch (_that) {
case _BatchInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? itemId,  String batchName,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate,  String? supplierBatchNumber,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchInput() when $default != null:
return $default(_that.itemId,_that.batchName,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.supplierBatchNumber,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? itemId,  String batchName,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate,  String? supplierBatchNumber,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _BatchInput():
return $default(_that.itemId,_that.batchName,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.supplierBatchNumber,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? itemId,  String batchName,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate,  String? supplierBatchNumber,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _BatchInput() when $default != null:
return $default(_that.itemId,_that.batchName,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.supplierBatchNumber,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _BatchInput implements BatchInput {
  const _BatchInput({this.itemId, required this.batchName, required this.costPrice, required this.unitPrice, this.expirationDate, this.manufacturingDate, this.supplierBatchNumber, this.notes});
  

@override final  int? itemId;
@override final  String batchName;
@override final  double costPrice;
@override final  double unitPrice;
@override final  String? expirationDate;
@override final  String? manufacturingDate;
@override final  String? supplierBatchNumber;
@override final  String? notes;

/// Create a copy of BatchInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchInputCopyWith<_BatchInput> get copyWith => __$BatchInputCopyWithImpl<_BatchInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchInput&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.batchName, batchName) || other.batchName == batchName)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.supplierBatchNumber, supplierBatchNumber) || other.supplierBatchNumber == supplierBatchNumber)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,batchName,costPrice,unitPrice,expirationDate,manufacturingDate,supplierBatchNumber,notes);

@override
String toString() {
  return 'BatchInput(itemId: $itemId, batchName: $batchName, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, supplierBatchNumber: $supplierBatchNumber, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BatchInputCopyWith<$Res> implements $BatchInputCopyWith<$Res> {
  factory _$BatchInputCopyWith(_BatchInput value, $Res Function(_BatchInput) _then) = __$BatchInputCopyWithImpl;
@override @useResult
$Res call({
 int? itemId, String batchName, double costPrice, double unitPrice, String? expirationDate, String? manufacturingDate, String? supplierBatchNumber, String? notes
});




}
/// @nodoc
class __$BatchInputCopyWithImpl<$Res>
    implements _$BatchInputCopyWith<$Res> {
  __$BatchInputCopyWithImpl(this._self, this._then);

  final _BatchInput _self;
  final $Res Function(_BatchInput) _then;

/// Create a copy of BatchInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = freezed,Object? batchName = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? supplierBatchNumber = freezed,Object? notes = freezed,}) {
  return _then(_BatchInput(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,batchName: null == batchName ? _self.batchName : batchName // ignore: cast_nullable_to_non_nullable
as String,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,supplierBatchNumber: freezed == supplierBatchNumber ? _self.supplierBatchNumber : supplierBatchNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
