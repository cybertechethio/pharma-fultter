// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_consolidation_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchConsolidationRequestModel {

 int get itemId; String get destinationBatchNumber; List<BatchOperationItemModel> get sources; String? get notes;
/// Create a copy of BatchConsolidationRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchConsolidationRequestModelCopyWith<BatchConsolidationRequestModel> get copyWith => _$BatchConsolidationRequestModelCopyWithImpl<BatchConsolidationRequestModel>(this as BatchConsolidationRequestModel, _$identity);

  /// Serializes this BatchConsolidationRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchConsolidationRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.destinationBatchNumber, destinationBatchNumber) || other.destinationBatchNumber == destinationBatchNumber)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,destinationBatchNumber,const DeepCollectionEquality().hash(sources),notes);

@override
String toString() {
  return 'BatchConsolidationRequestModel(itemId: $itemId, destinationBatchNumber: $destinationBatchNumber, sources: $sources, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BatchConsolidationRequestModelCopyWith<$Res>  {
  factory $BatchConsolidationRequestModelCopyWith(BatchConsolidationRequestModel value, $Res Function(BatchConsolidationRequestModel) _then) = _$BatchConsolidationRequestModelCopyWithImpl;
@useResult
$Res call({
 int itemId, String destinationBatchNumber, List<BatchOperationItemModel> sources, String? notes
});




}
/// @nodoc
class _$BatchConsolidationRequestModelCopyWithImpl<$Res>
    implements $BatchConsolidationRequestModelCopyWith<$Res> {
  _$BatchConsolidationRequestModelCopyWithImpl(this._self, this._then);

  final BatchConsolidationRequestModel _self;
  final $Res Function(BatchConsolidationRequestModel) _then;

/// Create a copy of BatchConsolidationRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? destinationBatchNumber = null,Object? sources = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,destinationBatchNumber: null == destinationBatchNumber ? _self.destinationBatchNumber : destinationBatchNumber // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<BatchOperationItemModel>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchConsolidationRequestModel].
extension BatchConsolidationRequestModelPatterns on BatchConsolidationRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchConsolidationRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchConsolidationRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchConsolidationRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  String destinationBatchNumber,  List<BatchOperationItemModel> sources,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel() when $default != null:
return $default(_that.itemId,_that.destinationBatchNumber,_that.sources,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  String destinationBatchNumber,  List<BatchOperationItemModel> sources,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel():
return $default(_that.itemId,_that.destinationBatchNumber,_that.sources,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  String destinationBatchNumber,  List<BatchOperationItemModel> sources,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _BatchConsolidationRequestModel() when $default != null:
return $default(_that.itemId,_that.destinationBatchNumber,_that.sources,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchConsolidationRequestModel implements BatchConsolidationRequestModel {
  const _BatchConsolidationRequestModel({required this.itemId, required this.destinationBatchNumber, required final  List<BatchOperationItemModel> sources, this.notes}): _sources = sources;
  factory _BatchConsolidationRequestModel.fromJson(Map<String, dynamic> json) => _$BatchConsolidationRequestModelFromJson(json);

@override final  int itemId;
@override final  String destinationBatchNumber;
 final  List<BatchOperationItemModel> _sources;
@override List<BatchOperationItemModel> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

@override final  String? notes;

/// Create a copy of BatchConsolidationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchConsolidationRequestModelCopyWith<_BatchConsolidationRequestModel> get copyWith => __$BatchConsolidationRequestModelCopyWithImpl<_BatchConsolidationRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchConsolidationRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchConsolidationRequestModel&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.destinationBatchNumber, destinationBatchNumber) || other.destinationBatchNumber == destinationBatchNumber)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,destinationBatchNumber,const DeepCollectionEquality().hash(_sources),notes);

@override
String toString() {
  return 'BatchConsolidationRequestModel(itemId: $itemId, destinationBatchNumber: $destinationBatchNumber, sources: $sources, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BatchConsolidationRequestModelCopyWith<$Res> implements $BatchConsolidationRequestModelCopyWith<$Res> {
  factory _$BatchConsolidationRequestModelCopyWith(_BatchConsolidationRequestModel value, $Res Function(_BatchConsolidationRequestModel) _then) = __$BatchConsolidationRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int itemId, String destinationBatchNumber, List<BatchOperationItemModel> sources, String? notes
});




}
/// @nodoc
class __$BatchConsolidationRequestModelCopyWithImpl<$Res>
    implements _$BatchConsolidationRequestModelCopyWith<$Res> {
  __$BatchConsolidationRequestModelCopyWithImpl(this._self, this._then);

  final _BatchConsolidationRequestModel _self;
  final $Res Function(_BatchConsolidationRequestModel) _then;

/// Create a copy of BatchConsolidationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? destinationBatchNumber = null,Object? sources = null,Object? notes = freezed,}) {
  return _then(_BatchConsolidationRequestModel(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,destinationBatchNumber: null == destinationBatchNumber ? _self.destinationBatchNumber : destinationBatchNumber // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<BatchOperationItemModel>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
