// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; int get companyId; String get name; String get description; DateTime get createdAt; DateTime? get updatedAt; int? get createdBy; int? get updatedBy;
/// Create a copy of ModelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelModelCopyWith<ModelModel> get copyWith => _$ModelModelCopyWithImpl<ModelModel>(this as ModelModel, _$identity);

  /// Serializes this ModelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,description,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'ModelModel(id: $id, companyId: $companyId, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $ModelModelCopyWith<$Res>  {
  factory $ModelModelCopyWith(ModelModel value, $Res Function(ModelModel) _then) = _$ModelModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, int companyId, String name, String description, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class _$ModelModelCopyWithImpl<$Res>
    implements $ModelModelCopyWith<$Res> {
  _$ModelModelCopyWithImpl(this._self, this._then);

  final ModelModel _self;
  final $Res Function(ModelModel) _then;

/// Create a copy of ModelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelModel].
extension ModelModelPatterns on ModelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelModel value)  $default,){
final _that = this;
switch (_that) {
case _ModelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelModel value)?  $default,){
final _that = this;
switch (_that) {
case _ModelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelModel() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _ModelModel():
return $default(_that.id,_that.companyId,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _ModelModel() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelModel implements ModelModel {
  const _ModelModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, required this.companyId, required this.name, required this.description, required this.createdAt, this.updatedAt, this.createdBy, this.updatedBy});
  factory _ModelModel.fromJson(Map<String, dynamic> json) => _$ModelModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  int companyId;
@override final  String name;
@override final  String description;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;

/// Create a copy of ModelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelModelCopyWith<_ModelModel> get copyWith => __$ModelModelCopyWithImpl<_ModelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,description,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'ModelModel(id: $id, companyId: $companyId, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$ModelModelCopyWith<$Res> implements $ModelModelCopyWith<$Res> {
  factory _$ModelModelCopyWith(_ModelModel value, $Res Function(_ModelModel) _then) = __$ModelModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, int companyId, String name, String description, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class __$ModelModelCopyWithImpl<$Res>
    implements _$ModelModelCopyWith<$Res> {
  __$ModelModelCopyWithImpl(this._self, this._then);

  final _ModelModel _self;
  final $Res Function(_ModelModel) _then;

/// Create a copy of ModelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_ModelModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
