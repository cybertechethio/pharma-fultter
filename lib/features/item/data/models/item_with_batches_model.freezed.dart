// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_with_batches_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemWithBatchesModel {

 int get id; String get name; String? get code; List<ItemBatchSummaryModel> get batches;
/// Create a copy of ItemWithBatchesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemWithBatchesModelCopyWith<ItemWithBatchesModel> get copyWith => _$ItemWithBatchesModelCopyWithImpl<ItemWithBatchesModel>(this as ItemWithBatchesModel, _$identity);

  /// Serializes this ItemWithBatchesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemWithBatchesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'ItemWithBatchesModel(id: $id, name: $name, code: $code, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $ItemWithBatchesModelCopyWith<$Res>  {
  factory $ItemWithBatchesModelCopyWith(ItemWithBatchesModel value, $Res Function(ItemWithBatchesModel) _then) = _$ItemWithBatchesModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? code, List<ItemBatchSummaryModel> batches
});




}
/// @nodoc
class _$ItemWithBatchesModelCopyWithImpl<$Res>
    implements $ItemWithBatchesModelCopyWith<$Res> {
  _$ItemWithBatchesModelCopyWithImpl(this._self, this._then);

  final ItemWithBatchesModel _self;
  final $Res Function(ItemWithBatchesModel) _then;

/// Create a copy of ItemWithBatchesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? batches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<ItemBatchSummaryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemWithBatchesModel].
extension ItemWithBatchesModelPatterns on ItemWithBatchesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemWithBatchesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemWithBatchesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemWithBatchesModel value)  $default,){
final _that = this;
switch (_that) {
case _ItemWithBatchesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemWithBatchesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItemWithBatchesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  List<ItemBatchSummaryModel> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemWithBatchesModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  List<ItemBatchSummaryModel> batches)  $default,) {final _that = this;
switch (_that) {
case _ItemWithBatchesModel():
return $default(_that.id,_that.name,_that.code,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? code,  List<ItemBatchSummaryModel> batches)?  $default,) {final _that = this;
switch (_that) {
case _ItemWithBatchesModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemWithBatchesModel implements ItemWithBatchesModel {
  const _ItemWithBatchesModel({required this.id, required this.name, this.code, final  List<ItemBatchSummaryModel> batches = const []}): _batches = batches;
  factory _ItemWithBatchesModel.fromJson(Map<String, dynamic> json) => _$ItemWithBatchesModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? code;
 final  List<ItemBatchSummaryModel> _batches;
@override@JsonKey() List<ItemBatchSummaryModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of ItemWithBatchesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemWithBatchesModelCopyWith<_ItemWithBatchesModel> get copyWith => __$ItemWithBatchesModelCopyWithImpl<_ItemWithBatchesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemWithBatchesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemWithBatchesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'ItemWithBatchesModel(id: $id, name: $name, code: $code, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$ItemWithBatchesModelCopyWith<$Res> implements $ItemWithBatchesModelCopyWith<$Res> {
  factory _$ItemWithBatchesModelCopyWith(_ItemWithBatchesModel value, $Res Function(_ItemWithBatchesModel) _then) = __$ItemWithBatchesModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? code, List<ItemBatchSummaryModel> batches
});




}
/// @nodoc
class __$ItemWithBatchesModelCopyWithImpl<$Res>
    implements _$ItemWithBatchesModelCopyWith<$Res> {
  __$ItemWithBatchesModelCopyWithImpl(this._self, this._then);

  final _ItemWithBatchesModel _self;
  final $Res Function(_ItemWithBatchesModel) _then;

/// Create a copy of ItemWithBatchesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? batches = null,}) {
  return _then(_ItemWithBatchesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<ItemBatchSummaryModel>,
  ));
}


}

// dart format on
