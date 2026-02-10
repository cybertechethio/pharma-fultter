// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferItemModel {

 int get id; String? get itemName; String? get itemCode; int get quantity; List<TransferItemBatchModel> get transferItemBatches;
/// Create a copy of TransferItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferItemModelCopyWith<TransferItemModel> get copyWith => _$TransferItemModelCopyWithImpl<TransferItemModel>(this as TransferItemModel, _$identity);

  /// Serializes this TransferItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.transferItemBatches, transferItemBatches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(transferItemBatches));

@override
String toString() {
  return 'TransferItemModel(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, transferItemBatches: $transferItemBatches)';
}


}

/// @nodoc
abstract mixin class $TransferItemModelCopyWith<$Res>  {
  factory $TransferItemModelCopyWith(TransferItemModel value, $Res Function(TransferItemModel) _then) = _$TransferItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String? itemName, String? itemCode, int quantity, List<TransferItemBatchModel> transferItemBatches
});




}
/// @nodoc
class _$TransferItemModelCopyWithImpl<$Res>
    implements $TransferItemModelCopyWith<$Res> {
  _$TransferItemModelCopyWithImpl(this._self, this._then);

  final TransferItemModel _self;
  final $Res Function(TransferItemModel) _then;

/// Create a copy of TransferItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemName = freezed,Object? itemCode = freezed,Object? quantity = null,Object? transferItemBatches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transferItemBatches: null == transferItemBatches ? _self.transferItemBatches : transferItemBatches // ignore: cast_nullable_to_non_nullable
as List<TransferItemBatchModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferItemModel].
extension TransferItemModelPatterns on TransferItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? itemName,  String? itemCode,  int quantity,  List<TransferItemBatchModel> transferItemBatches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.transferItemBatches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? itemName,  String? itemCode,  int quantity,  List<TransferItemBatchModel> transferItemBatches)  $default,) {final _that = this;
switch (_that) {
case _TransferItemModel():
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.transferItemBatches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? itemName,  String? itemCode,  int quantity,  List<TransferItemBatchModel> transferItemBatches)?  $default,) {final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.transferItemBatches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferItemModel implements TransferItemModel {
  const _TransferItemModel({required this.id, this.itemName, this.itemCode, required this.quantity, final  List<TransferItemBatchModel> transferItemBatches = const []}): _transferItemBatches = transferItemBatches;
  factory _TransferItemModel.fromJson(Map<String, dynamic> json) => _$TransferItemModelFromJson(json);

@override final  int id;
@override final  String? itemName;
@override final  String? itemCode;
@override final  int quantity;
 final  List<TransferItemBatchModel> _transferItemBatches;
@override@JsonKey() List<TransferItemBatchModel> get transferItemBatches {
  if (_transferItemBatches is EqualUnmodifiableListView) return _transferItemBatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transferItemBatches);
}


/// Create a copy of TransferItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferItemModelCopyWith<_TransferItemModel> get copyWith => __$TransferItemModelCopyWithImpl<_TransferItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._transferItemBatches, _transferItemBatches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(_transferItemBatches));

@override
String toString() {
  return 'TransferItemModel(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, transferItemBatches: $transferItemBatches)';
}


}

/// @nodoc
abstract mixin class _$TransferItemModelCopyWith<$Res> implements $TransferItemModelCopyWith<$Res> {
  factory _$TransferItemModelCopyWith(_TransferItemModel value, $Res Function(_TransferItemModel) _then) = __$TransferItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? itemName, String? itemCode, int quantity, List<TransferItemBatchModel> transferItemBatches
});




}
/// @nodoc
class __$TransferItemModelCopyWithImpl<$Res>
    implements _$TransferItemModelCopyWith<$Res> {
  __$TransferItemModelCopyWithImpl(this._self, this._then);

  final _TransferItemModel _self;
  final $Res Function(_TransferItemModel) _then;

/// Create a copy of TransferItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemName = freezed,Object? itemCode = freezed,Object? quantity = null,Object? transferItemBatches = null,}) {
  return _then(_TransferItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transferItemBatches: null == transferItemBatches ? _self._transferItemBatches : transferItemBatches // ignore: cast_nullable_to_non_nullable
as List<TransferItemBatchModel>,
  ));
}


}

// dart format on
