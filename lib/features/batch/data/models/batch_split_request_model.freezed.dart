// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_split_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchSplitRequestModel {

 int get itemId; String get sourceBatchNumber; List<BatchOperationItemModel> get destinations; String? get notes;
/// Create a copy of BatchSplitRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchSplitRequestModelCopyWith<BatchSplitRequestModel> get copyWith => _$BatchSplitRequestModelCopyWithImpl<BatchSplitRequestModel>(this as BatchSplitRequestModel, _$identity);

  /// Serializes this BatchSplitRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchSplitRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sourceBatchNumber, sourceBatchNumber) || other.sourceBatchNumber == sourceBatchNumber)&&const DeepCollectionEquality().equals(other.destinations, destinations)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sourceBatchNumber,const DeepCollectionEquality().hash(destinations),notes);

@override
String toString() {
  return 'BatchSplitRequestModel(itemId: $itemId, sourceBatchNumber: $sourceBatchNumber, destinations: $destinations, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BatchSplitRequestModelCopyWith<$Res>  {
  factory $BatchSplitRequestModelCopyWith(BatchSplitRequestModel value, $Res Function(BatchSplitRequestModel) _then) = _$BatchSplitRequestModelCopyWithImpl;
@useResult
$Res call({
 int itemId, String sourceBatchNumber, List<BatchOperationItemModel> destinations, String? notes
});




}
/// @nodoc
class _$BatchSplitRequestModelCopyWithImpl<$Res>
    implements $BatchSplitRequestModelCopyWith<$Res> {
  _$BatchSplitRequestModelCopyWithImpl(this._self, this._then);

  final BatchSplitRequestModel _self;
  final $Res Function(BatchSplitRequestModel) _then;

/// Create a copy of BatchSplitRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? sourceBatchNumber = null,Object? destinations = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,sourceBatchNumber: null == sourceBatchNumber ? _self.sourceBatchNumber : sourceBatchNumber // ignore: cast_nullable_to_non_nullable
as String,destinations: null == destinations ? _self.destinations : destinations // ignore: cast_nullable_to_non_nullable
as List<BatchOperationItemModel>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchSplitRequestModel].
extension BatchSplitRequestModelPatterns on BatchSplitRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchSplitRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchSplitRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchSplitRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BatchSplitRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchSplitRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BatchSplitRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  String sourceBatchNumber,  List<BatchOperationItemModel> destinations,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchSplitRequestModel() when $default != null:
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinations,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  String sourceBatchNumber,  List<BatchOperationItemModel> destinations,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _BatchSplitRequestModel():
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinations,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  String sourceBatchNumber,  List<BatchOperationItemModel> destinations,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _BatchSplitRequestModel() when $default != null:
return $default(_that.itemId,_that.sourceBatchNumber,_that.destinations,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchSplitRequestModel implements BatchSplitRequestModel {
  const _BatchSplitRequestModel({required this.itemId, required this.sourceBatchNumber, required final  List<BatchOperationItemModel> destinations, this.notes}): _destinations = destinations;
  factory _BatchSplitRequestModel.fromJson(Map<String, dynamic> json) => _$BatchSplitRequestModelFromJson(json);

@override final  int itemId;
@override final  String sourceBatchNumber;
 final  List<BatchOperationItemModel> _destinations;
@override List<BatchOperationItemModel> get destinations {
  if (_destinations is EqualUnmodifiableListView) return _destinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_destinations);
}

@override final  String? notes;

/// Create a copy of BatchSplitRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchSplitRequestModelCopyWith<_BatchSplitRequestModel> get copyWith => __$BatchSplitRequestModelCopyWithImpl<_BatchSplitRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchSplitRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchSplitRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sourceBatchNumber, sourceBatchNumber) || other.sourceBatchNumber == sourceBatchNumber)&&const DeepCollectionEquality().equals(other._destinations, _destinations)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sourceBatchNumber,const DeepCollectionEquality().hash(_destinations),notes);

@override
String toString() {
  return 'BatchSplitRequestModel(itemId: $itemId, sourceBatchNumber: $sourceBatchNumber, destinations: $destinations, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BatchSplitRequestModelCopyWith<$Res> implements $BatchSplitRequestModelCopyWith<$Res> {
  factory _$BatchSplitRequestModelCopyWith(_BatchSplitRequestModel value, $Res Function(_BatchSplitRequestModel) _then) = __$BatchSplitRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int itemId, String sourceBatchNumber, List<BatchOperationItemModel> destinations, String? notes
});




}
/// @nodoc
class __$BatchSplitRequestModelCopyWithImpl<$Res>
    implements _$BatchSplitRequestModelCopyWith<$Res> {
  __$BatchSplitRequestModelCopyWithImpl(this._self, this._then);

  final _BatchSplitRequestModel _self;
  final $Res Function(_BatchSplitRequestModel) _then;

/// Create a copy of BatchSplitRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? sourceBatchNumber = null,Object? destinations = null,Object? notes = freezed,}) {
  return _then(_BatchSplitRequestModel(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,sourceBatchNumber: null == sourceBatchNumber ? _self.sourceBatchNumber : sourceBatchNumber // ignore: cast_nullable_to_non_nullable
as String,destinations: null == destinations ? _self._destinations : destinations // ignore: cast_nullable_to_non_nullable
as List<BatchOperationItemModel>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
