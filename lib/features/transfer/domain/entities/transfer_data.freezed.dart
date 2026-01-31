// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferData {

 int get destinationBranchId; int? get relatedTransferId; String? get notes; List<TransactionItem> get items;
/// Create a copy of TransferData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferDataCopyWith<TransferData> get copyWith => _$TransferDataCopyWithImpl<TransferData>(this as TransferData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferData&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,relatedTransferId,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'TransferData(destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $TransferDataCopyWith<$Res>  {
  factory $TransferDataCopyWith(TransferData value, $Res Function(TransferData) _then) = _$TransferDataCopyWithImpl;
@useResult
$Res call({
 int destinationBranchId, int? relatedTransferId, String? notes, List<TransactionItem> items
});




}
/// @nodoc
class _$TransferDataCopyWithImpl<$Res>
    implements $TransferDataCopyWith<$Res> {
  _$TransferDataCopyWithImpl(this._self, this._then);

  final TransferData _self;
  final $Res Function(TransferData) _then;

/// Create a copy of TransferData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destinationBranchId = null,Object? relatedTransferId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferData].
extension TransferDataPatterns on TransferData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferData value)  $default,){
final _that = this;
switch (_that) {
case _TransferData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferData value)?  $default,){
final _that = this;
switch (_that) {
case _TransferData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransactionItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferData() when $default != null:
return $default(_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransactionItem> items)  $default,) {final _that = this;
switch (_that) {
case _TransferData():
return $default(_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransactionItem> items)?  $default,) {final _that = this;
switch (_that) {
case _TransferData() when $default != null:
return $default(_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _TransferData implements TransferData {
  const _TransferData({required this.destinationBranchId, this.relatedTransferId, this.notes, required final  List<TransactionItem> items}): _items = items;
  

@override final  int destinationBranchId;
@override final  int? relatedTransferId;
@override final  String? notes;
 final  List<TransactionItem> _items;
@override List<TransactionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TransferData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferDataCopyWith<_TransferData> get copyWith => __$TransferDataCopyWithImpl<_TransferData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferData&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,relatedTransferId,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TransferData(destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$TransferDataCopyWith<$Res> implements $TransferDataCopyWith<$Res> {
  factory _$TransferDataCopyWith(_TransferData value, $Res Function(_TransferData) _then) = __$TransferDataCopyWithImpl;
@override @useResult
$Res call({
 int destinationBranchId, int? relatedTransferId, String? notes, List<TransactionItem> items
});




}
/// @nodoc
class __$TransferDataCopyWithImpl<$Res>
    implements _$TransferDataCopyWith<$Res> {
  __$TransferDataCopyWithImpl(this._self, this._then);

  final _TransferData _self;
  final $Res Function(_TransferData) _then;

/// Create a copy of TransferData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destinationBranchId = null,Object? relatedTransferId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_TransferData(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItem>,
  ));
}


}

// dart format on
