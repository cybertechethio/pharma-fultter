// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_operation_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchOperationItemModel {

 String get batchNumber; int? get quantity; double? get costPrice; double? get unitPrice; String? get expirationDate;
/// Create a copy of BatchOperationItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchOperationItemModelCopyWith<BatchOperationItemModel> get copyWith => _$BatchOperationItemModelCopyWithImpl<BatchOperationItemModel>(this as BatchOperationItemModel, _$identity);

  /// Serializes this BatchOperationItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchOperationItemModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'BatchOperationItemModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $BatchOperationItemModelCopyWith<$Res>  {
  factory $BatchOperationItemModelCopyWith(BatchOperationItemModel value, $Res Function(BatchOperationItemModel) _then) = _$BatchOperationItemModelCopyWithImpl;
@useResult
$Res call({
 String batchNumber, int? quantity, double? costPrice, double? unitPrice, String? expirationDate
});




}
/// @nodoc
class _$BatchOperationItemModelCopyWithImpl<$Res>
    implements $BatchOperationItemModelCopyWith<$Res> {
  _$BatchOperationItemModelCopyWithImpl(this._self, this._then);

  final BatchOperationItemModel _self;
  final $Res Function(BatchOperationItemModel) _then;

/// Create a copy of BatchOperationItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchOperationItemModel].
extension BatchOperationItemModelPatterns on BatchOperationItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchOperationItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchOperationItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchOperationItemModel value)  $default,){
final _that = this;
switch (_that) {
case _BatchOperationItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchOperationItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _BatchOperationItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber,  int? quantity,  double? costPrice,  double? unitPrice,  String? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchOperationItemModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber,  int? quantity,  double? costPrice,  double? unitPrice,  String? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _BatchOperationItemModel():
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber,  int? quantity,  double? costPrice,  double? unitPrice,  String? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _BatchOperationItemModel() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchOperationItemModel implements BatchOperationItemModel {
  const _BatchOperationItemModel({required this.batchNumber, this.quantity, this.costPrice, this.unitPrice, this.expirationDate});
  factory _BatchOperationItemModel.fromJson(Map<String, dynamic> json) => _$BatchOperationItemModelFromJson(json);

@override final  String batchNumber;
@override final  int? quantity;
@override final  double? costPrice;
@override final  double? unitPrice;
@override final  String? expirationDate;

/// Create a copy of BatchOperationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchOperationItemModelCopyWith<_BatchOperationItemModel> get copyWith => __$BatchOperationItemModelCopyWithImpl<_BatchOperationItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchOperationItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchOperationItemModel&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice,expirationDate);

@override
String toString() {
  return 'BatchOperationItemModel(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$BatchOperationItemModelCopyWith<$Res> implements $BatchOperationItemModelCopyWith<$Res> {
  factory _$BatchOperationItemModelCopyWith(_BatchOperationItemModel value, $Res Function(_BatchOperationItemModel) _then) = __$BatchOperationItemModelCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber, int? quantity, double? costPrice, double? unitPrice, String? expirationDate
});




}
/// @nodoc
class __$BatchOperationItemModelCopyWithImpl<$Res>
    implements _$BatchOperationItemModelCopyWith<$Res> {
  __$BatchOperationItemModelCopyWithImpl(this._self, this._then);

  final _BatchOperationItemModel _self;
  final $Res Function(_BatchOperationItemModel) _then;

/// Create a copy of BatchOperationItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = freezed,Object? costPrice = freezed,Object? unitPrice = freezed,Object? expirationDate = freezed,}) {
  return _then(_BatchOperationItemModel(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
