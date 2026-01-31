// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelEntity {

 String get id; int get companyId; String get name; String get description; DateTime get createdAt; DateTime? get updatedAt; int? get createdBy; int? get updatedBy;
/// Create a copy of ModelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelEntityCopyWith<ModelEntity> get copyWith => _$ModelEntityCopyWithImpl<ModelEntity>(this as ModelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,description,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'ModelEntity(id: $id, companyId: $companyId, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $ModelEntityCopyWith<$Res>  {
  factory $ModelEntityCopyWith(ModelEntity value, $Res Function(ModelEntity) _then) = _$ModelEntityCopyWithImpl;
@useResult
$Res call({
 String id, int companyId, String name, String description, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class _$ModelEntityCopyWithImpl<$Res>
    implements $ModelEntityCopyWith<$Res> {
  _$ModelEntityCopyWithImpl(this._self, this._then);

  final ModelEntity _self;
  final $Res Function(ModelEntity) _then;

/// Create a copy of ModelEntity
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


/// Adds pattern-matching-related methods to [ModelEntity].
extension ModelEntityPatterns on ModelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelEntity value)  $default,){
final _that = this;
switch (_that) {
case _ModelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ModelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _ModelEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int companyId,  String name,  String description,  DateTime createdAt,  DateTime? updatedAt,  int? createdBy,  int? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _ModelEntity() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc


class _ModelEntity implements ModelEntity {
  const _ModelEntity({required this.id, required this.companyId, required this.name, required this.description, required this.createdAt, this.updatedAt, this.createdBy, this.updatedBy});
  

@override final  String id;
@override final  int companyId;
@override final  String name;
@override final  String description;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;

/// Create a copy of ModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelEntityCopyWith<_ModelEntity> get copyWith => __$ModelEntityCopyWithImpl<_ModelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,companyId,name,description,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'ModelEntity(id: $id, companyId: $companyId, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$ModelEntityCopyWith<$Res> implements $ModelEntityCopyWith<$Res> {
  factory _$ModelEntityCopyWith(_ModelEntity value, $Res Function(_ModelEntity) _then) = __$ModelEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int companyId, String name, String description, DateTime createdAt, DateTime? updatedAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class __$ModelEntityCopyWithImpl<$Res>
    implements _$ModelEntityCopyWith<$Res> {
  __$ModelEntityCopyWithImpl(this._self, this._then);

  final _ModelEntity _self;
  final $Res Function(_ModelEntity) _then;

/// Create a copy of ModelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_ModelEntity(
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
