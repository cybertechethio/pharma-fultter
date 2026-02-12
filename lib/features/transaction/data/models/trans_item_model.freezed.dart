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

 int get id; String get itemName; String get itemCode;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity; List<TransItemBatchModel> get batches;
/// Create a copy of TransItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemModelCopyWith<TransItemModel> get copyWith => _$TransItemModelCopyWithImpl<TransItemModel>(this as TransItemModel, _$identity);

  /// Serializes this TransItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransItemModel(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransItemModelCopyWith<$Res>  {
  factory $TransItemModelCopyWith(TransItemModel value, $Res Function(TransItemModel) _then) = _$TransItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity, List<TransItemBatchModel> batches
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? batches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransItemBatchModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity,  List<TransItemBatchModel> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity,  List<TransItemBatchModel> batches)  $default,) {final _that = this;
switch (_that) {
case _TransItemModel():
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity,  List<TransItemBatchModel> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransItemModel() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransItemModel implements TransItemModel {
  const _TransItemModel({required this.id, required this.itemName, required this.itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity, final  List<TransItemBatchModel> batches = const []}): _batches = batches;
  factory _TransItemModel.fromJson(Map<String, dynamic> json) => _$TransItemModelFromJson(json);

@override final  int id;
@override final  String itemName;
@override final  String itemCode;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;
 final  List<TransItemBatchModel> _batches;
@override@JsonKey() List<TransItemBatchModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransItemModel(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransItemModelCopyWith<$Res> implements $TransItemModelCopyWith<$Res> {
  factory _$TransItemModelCopyWith(_TransItemModel value, $Res Function(_TransItemModel) _then) = __$TransItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity, List<TransItemBatchModel> batches
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? batches = null,}) {
  return _then(_TransItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransItemBatchModel>,
  ));
}


}

// dart format on
