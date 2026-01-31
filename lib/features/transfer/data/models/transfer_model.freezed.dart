// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferModel {

 int get destinationBranchId; int? get relatedTransferId; String? get notes; List<TransferItemModel> get items;
/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferModelCopyWith<TransferModel> get copyWith => _$TransferModelCopyWithImpl<TransferModel>(this as TransferModel, _$identity);

  /// Serializes this TransferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferModel&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,relatedTransferId,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'TransferModel(destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $TransferModelCopyWith<$Res>  {
  factory $TransferModelCopyWith(TransferModel value, $Res Function(TransferModel) _then) = _$TransferModelCopyWithImpl;
@useResult
$Res call({
 int destinationBranchId, int? relatedTransferId, String? notes, List<TransferItemModel> items
});




}
/// @nodoc
class _$TransferModelCopyWithImpl<$Res>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._self, this._then);

  final TransferModel _self;
  final $Res Function(TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destinationBranchId = null,Object? relatedTransferId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransferItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferModel].
extension TransferModelPatterns on TransferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferModel value)  $default,){
final _that = this;
switch (_that) {
case _TransferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransferItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransferItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _TransferModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int destinationBranchId,  int? relatedTransferId,  String? notes,  List<TransferItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _TransferModel() when $default != null:
return $default(_that.destinationBranchId,_that.relatedTransferId,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferModel implements TransferModel {
  const _TransferModel({required this.destinationBranchId, this.relatedTransferId, this.notes, required final  List<TransferItemModel> items}): _items = items;
  factory _TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);

@override final  int destinationBranchId;
@override final  int? relatedTransferId;
@override final  String? notes;
 final  List<TransferItemModel> _items;
@override List<TransferItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferModelCopyWith<_TransferModel> get copyWith => __$TransferModelCopyWithImpl<_TransferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferModel&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.relatedTransferId, relatedTransferId) || other.relatedTransferId == relatedTransferId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,relatedTransferId,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'TransferModel(destinationBranchId: $destinationBranchId, relatedTransferId: $relatedTransferId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$TransferModelCopyWith<$Res> implements $TransferModelCopyWith<$Res> {
  factory _$TransferModelCopyWith(_TransferModel value, $Res Function(_TransferModel) _then) = __$TransferModelCopyWithImpl;
@override @useResult
$Res call({
 int destinationBranchId, int? relatedTransferId, String? notes, List<TransferItemModel> items
});




}
/// @nodoc
class __$TransferModelCopyWithImpl<$Res>
    implements _$TransferModelCopyWith<$Res> {
  __$TransferModelCopyWithImpl(this._self, this._then);

  final _TransferModel _self;
  final $Res Function(_TransferModel) _then;

/// Create a copy of TransferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destinationBranchId = null,Object? relatedTransferId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_TransferModel(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,relatedTransferId: freezed == relatedTransferId ? _self.relatedTransferId : relatedTransferId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransferItemModel>,
  ));
}


}

// dart format on
