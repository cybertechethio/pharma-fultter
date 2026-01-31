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

 int get itemId; List<TransferBatchModel> get batches;
/// Create a copy of TransferItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferItemModelCopyWith<TransferItemModel> get copyWith => _$TransferItemModelCopyWithImpl<TransferItemModel>(this as TransferItemModel, _$identity);

  /// Serializes this TransferItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferItemModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransferItemModel(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransferItemModelCopyWith<$Res>  {
  factory $TransferItemModelCopyWith(TransferItemModel value, $Res Function(TransferItemModel) _then) = _$TransferItemModelCopyWithImpl;
@useResult
$Res call({
 int itemId, List<TransferBatchModel> batches
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
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransferBatchModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  List<TransferBatchModel> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
return $default(_that.itemId,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  List<TransferBatchModel> batches)  $default,) {final _that = this;
switch (_that) {
case _TransferItemModel():
return $default(_that.itemId,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  List<TransferBatchModel> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransferItemModel() when $default != null:
return $default(_that.itemId,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferItemModel implements TransferItemModel {
  const _TransferItemModel({required this.itemId, required final  List<TransferBatchModel> batches}): _batches = batches;
  factory _TransferItemModel.fromJson(Map<String, dynamic> json) => _$TransferItemModelFromJson(json);

@override final  int itemId;
 final  List<TransferBatchModel> _batches;
@override List<TransferBatchModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferItemModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransferItemModel(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransferItemModelCopyWith<$Res> implements $TransferItemModelCopyWith<$Res> {
  factory _$TransferItemModelCopyWith(_TransferItemModel value, $Res Function(_TransferItemModel) _then) = __$TransferItemModelCopyWithImpl;
@override @useResult
$Res call({
 int itemId, List<TransferBatchModel> batches
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
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_TransferItemModel(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransferBatchModel>,
  ));
}


}

// dart format on
