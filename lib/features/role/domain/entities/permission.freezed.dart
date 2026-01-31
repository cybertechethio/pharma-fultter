// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionEntity {

 int get id; String get name;// e.g., "users.read"
 String? get description; String? get category;// e.g., "user_management"
 bool get isActive; DateTime? get createdAt; int? get createdBy; int? get updatedBy;
/// Create a copy of PermissionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionEntityCopyWith<PermissionEntity> get copyWith => _$PermissionEntityCopyWithImpl<PermissionEntity>(this as PermissionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,isActive,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'PermissionEntity(id: $id, name: $name, description: $description, category: $category, isActive: $isActive, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $PermissionEntityCopyWith<$Res>  {
  factory $PermissionEntityCopyWith(PermissionEntity value, $Res Function(PermissionEntity) _then) = _$PermissionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? category, bool isActive, DateTime? createdAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class _$PermissionEntityCopyWithImpl<$Res>
    implements $PermissionEntityCopyWith<$Res> {
  _$PermissionEntityCopyWithImpl(this._self, this._then);

  final PermissionEntity _self;
  final $Res Function(PermissionEntity) _then;

/// Create a copy of PermissionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? category = freezed,Object? isActive = null,Object? createdAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionEntity].
extension PermissionEntityPatterns on PermissionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionEntity value)  $default,){
final _that = this;
switch (_that) {
case _PermissionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? category,  bool isActive,  DateTime? createdAt,  int? createdBy,  int? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.category,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? category,  bool isActive,  DateTime? createdAt,  int? createdBy,  int? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _PermissionEntity():
return $default(_that.id,_that.name,_that.description,_that.category,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? category,  bool isActive,  DateTime? createdAt,  int? createdBy,  int? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _PermissionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.category,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionEntity implements PermissionEntity {
  const _PermissionEntity({required this.id, required this.name, this.description, this.category, this.isActive = true, this.createdAt, this.createdBy, this.updatedBy});
  

@override final  int id;
@override final  String name;
// e.g., "users.read"
@override final  String? description;
@override final  String? category;
// e.g., "user_management"
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;
@override final  int? createdBy;
@override final  int? updatedBy;

/// Create a copy of PermissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionEntityCopyWith<_PermissionEntity> get copyWith => __$PermissionEntityCopyWithImpl<_PermissionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,isActive,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'PermissionEntity(id: $id, name: $name, description: $description, category: $category, isActive: $isActive, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$PermissionEntityCopyWith<$Res> implements $PermissionEntityCopyWith<$Res> {
  factory _$PermissionEntityCopyWith(_PermissionEntity value, $Res Function(_PermissionEntity) _then) = __$PermissionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? category, bool isActive, DateTime? createdAt, int? createdBy, int? updatedBy
});




}
/// @nodoc
class __$PermissionEntityCopyWithImpl<$Res>
    implements _$PermissionEntityCopyWith<$Res> {
  __$PermissionEntityCopyWithImpl(this._self, this._then);

  final _PermissionEntity _self;
  final $Res Function(_PermissionEntity) _then;

/// Create a copy of PermissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? category = freezed,Object? isActive = null,Object? createdAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_PermissionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
