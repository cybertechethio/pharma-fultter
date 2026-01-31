// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionItemModel {

 int get itemId; int get taxRate; List<TransactionBatchModel> get batches;
/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<TransactionItemModel> get copyWith => _$TransactionItemModelCopyWithImpl<TransactionItemModel>(this as TransactionItemModel, _$identity);

  /// Serializes this TransactionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,taxRate,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransactionItemModel(itemId: $itemId, taxRate: $taxRate, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransactionItemModelCopyWith<$Res>  {
  factory $TransactionItemModelCopyWith(TransactionItemModel value, $Res Function(TransactionItemModel) _then) = _$TransactionItemModelCopyWithImpl;
@useResult
$Res call({
 int itemId, int taxRate, List<TransactionBatchModel> batches
});




}
/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._self, this._then);

  final TransactionItemModel _self;
  final $Res Function(TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? taxRate = null,Object? batches = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionBatchModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemModel].
extension TransactionItemModelPatterns on TransactionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  int taxRate,  List<TransactionBatchModel> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.itemId,_that.taxRate,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  int taxRate,  List<TransactionBatchModel> batches)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel():
return $default(_that.itemId,_that.taxRate,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  int taxRate,  List<TransactionBatchModel> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.itemId,_that.taxRate,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemModel implements TransactionItemModel {
  const _TransactionItemModel({required this.itemId, required this.taxRate, required final  List<TransactionBatchModel> batches}): _batches = batches;
  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

@override final  int itemId;
@override final  int taxRate;
 final  List<TransactionBatchModel> _batches;
@override List<TransactionBatchModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemModelCopyWith<_TransactionItemModel> get copyWith => __$TransactionItemModelCopyWithImpl<_TransactionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,taxRate,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransactionItemModel(itemId: $itemId, taxRate: $taxRate, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemModelCopyWith<$Res> implements $TransactionItemModelCopyWith<$Res> {
  factory _$TransactionItemModelCopyWith(_TransactionItemModel value, $Res Function(_TransactionItemModel) _then) = __$TransactionItemModelCopyWithImpl;
@override @useResult
$Res call({
 int itemId, int taxRate, List<TransactionBatchModel> batches
});




}
/// @nodoc
class __$TransactionItemModelCopyWithImpl<$Res>
    implements _$TransactionItemModelCopyWith<$Res> {
  __$TransactionItemModelCopyWithImpl(this._self, this._then);

  final _TransactionItemModel _self;
  final $Res Function(_TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? taxRate = null,Object? batches = null,}) {
  return _then(_TransactionItemModel(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionBatchModel>,
  ));
}


}

// dart format on
