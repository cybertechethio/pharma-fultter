// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trans_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransItem {

 int get id; String get itemName; String get itemCode; double get quantity; List<TransItemBatch> get batches;
/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransItemCopyWith<TransItem> get copyWith => _$TransItemCopyWithImpl<TransItem>(this as TransItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.batches, batches));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransItem(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransItemCopyWith<$Res>  {
  factory $TransItemCopyWith(TransItem value, $Res Function(TransItem) _then) = _$TransItemCopyWithImpl;
@useResult
$Res call({
 int id, String itemName, String itemCode, double quantity, List<TransItemBatch> batches
});




}
/// @nodoc
class _$TransItemCopyWithImpl<$Res>
    implements $TransItemCopyWith<$Res> {
  _$TransItemCopyWithImpl(this._self, this._then);

  final TransItem _self;
  final $Res Function(TransItem) _then;

/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? batches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransItemBatch>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransItem].
extension TransItemPatterns on TransItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransItem value)  $default,){
final _that = this;
switch (_that) {
case _TransItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String itemName,  String itemCode,  double quantity,  List<TransItemBatch> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String itemName,  String itemCode,  double quantity,  List<TransItemBatch> batches)  $default,) {final _that = this;
switch (_that) {
case _TransItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String itemName,  String itemCode,  double quantity,  List<TransItemBatch> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransItem() when $default != null:
return $default(_that.id,_that.itemName,_that.itemCode,_that.quantity,_that.batches);case _:
  return null;

}
}

}

/// @nodoc


class _TransItem implements TransItem {
  const _TransItem({required this.id, required this.itemName, required this.itemCode, required this.quantity, final  List<TransItemBatch> batches = const []}): _batches = batches;
  

@override final  int id;
@override final  String itemName;
@override final  String itemCode;
@override final  double quantity;
 final  List<TransItemBatch> _batches;
@override@JsonKey() List<TransItemBatch> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransItemCopyWith<_TransItem> get copyWith => __$TransItemCopyWithImpl<_TransItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._batches, _batches));
}


@override
int get hashCode => Object.hash(runtimeType,id,itemName,itemCode,quantity,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransItem(id: $id, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransItemCopyWith<$Res> implements $TransItemCopyWith<$Res> {
  factory _$TransItemCopyWith(_TransItem value, $Res Function(_TransItem) _then) = __$TransItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String itemName, String itemCode, double quantity, List<TransItemBatch> batches
});




}
/// @nodoc
class __$TransItemCopyWithImpl<$Res>
    implements _$TransItemCopyWith<$Res> {
  __$TransItemCopyWithImpl(this._self, this._then);

  final _TransItem _self;
  final $Res Function(_TransItem) _then;

/// Create a copy of TransItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? batches = null,}) {
  return _then(_TransItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransItemBatch>,
  ));
}


}

// dart format on
