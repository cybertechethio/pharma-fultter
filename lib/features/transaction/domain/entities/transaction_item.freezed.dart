// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionItem {

 int get itemId; double get taxRate; List<TransactionBatch> get batches;
/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemCopyWith<TransactionItem> get copyWith => _$TransactionItemCopyWithImpl<TransactionItem>(this as TransactionItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&const DeepCollectionEquality().equals(other.batches, batches));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,taxRate,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransactionItem(itemId: $itemId, taxRate: $taxRate, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransactionItemCopyWith<$Res>  {
  factory $TransactionItemCopyWith(TransactionItem value, $Res Function(TransactionItem) _then) = _$TransactionItemCopyWithImpl;
@useResult
$Res call({
 int itemId, double taxRate, List<TransactionBatch> batches
});




}
/// @nodoc
class _$TransactionItemCopyWithImpl<$Res>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._self, this._then);

  final TransactionItem _self;
  final $Res Function(TransactionItem) _then;

/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? taxRate = null,Object? batches = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionBatch>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItem].
extension TransactionItemPatterns on TransactionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItem value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  double taxRate,  List<TransactionBatch> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  double taxRate,  List<TransactionBatch> batches)  $default,) {final _that = this;
switch (_that) {
case _TransactionItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  double taxRate,  List<TransactionBatch> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItem() when $default != null:
return $default(_that.itemId,_that.taxRate,_that.batches);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionItem implements TransactionItem {
  const _TransactionItem({required this.itemId, required this.taxRate, required final  List<TransactionBatch> batches}): _batches = batches;
  

@override final  int itemId;
@override final  double taxRate;
 final  List<TransactionBatch> _batches;
@override List<TransactionBatch> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemCopyWith<_TransactionItem> get copyWith => __$TransactionItemCopyWithImpl<_TransactionItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&const DeepCollectionEquality().equals(other._batches, _batches));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,taxRate,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransactionItem(itemId: $itemId, taxRate: $taxRate, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemCopyWith<$Res> implements $TransactionItemCopyWith<$Res> {
  factory _$TransactionItemCopyWith(_TransactionItem value, $Res Function(_TransactionItem) _then) = __$TransactionItemCopyWithImpl;
@override @useResult
$Res call({
 int itemId, double taxRate, List<TransactionBatch> batches
});




}
/// @nodoc
class __$TransactionItemCopyWithImpl<$Res>
    implements _$TransactionItemCopyWith<$Res> {
  __$TransactionItemCopyWithImpl(this._self, this._then);

  final _TransactionItem _self;
  final $Res Function(_TransactionItem) _then;

/// Create a copy of TransactionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? taxRate = null,Object? batches = null,}) {
  return _then(_TransactionItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionBatch>,
  ));
}


}

// dart format on
