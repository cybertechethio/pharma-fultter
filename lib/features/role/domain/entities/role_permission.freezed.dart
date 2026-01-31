// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RolePermissionEntity {

 int get id; String? get description; String? get category;
/// Create a copy of RolePermissionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolePermissionEntityCopyWith<RolePermissionEntity> get copyWith => _$RolePermissionEntityCopyWithImpl<RolePermissionEntity>(this as RolePermissionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolePermissionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,category);

@override
String toString() {
  return 'RolePermissionEntity(id: $id, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class $RolePermissionEntityCopyWith<$Res>  {
  factory $RolePermissionEntityCopyWith(RolePermissionEntity value, $Res Function(RolePermissionEntity) _then) = _$RolePermissionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String? description, String? category
});




}
/// @nodoc
class _$RolePermissionEntityCopyWithImpl<$Res>
    implements $RolePermissionEntityCopyWith<$Res> {
  _$RolePermissionEntityCopyWithImpl(this._self, this._then);

  final RolePermissionEntity _self;
  final $Res Function(RolePermissionEntity) _then;

/// Create a copy of RolePermissionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RolePermissionEntity].
extension RolePermissionEntityPatterns on RolePermissionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolePermissionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolePermissionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolePermissionEntity value)  $default,){
final _that = this;
switch (_that) {
case _RolePermissionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolePermissionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RolePermissionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? description,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolePermissionEntity() when $default != null:
return $default(_that.id,_that.description,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? description,  String? category)  $default,) {final _that = this;
switch (_that) {
case _RolePermissionEntity():
return $default(_that.id,_that.description,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? description,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _RolePermissionEntity() when $default != null:
return $default(_that.id,_that.description,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _RolePermissionEntity implements RolePermissionEntity {
  const _RolePermissionEntity({required this.id, this.description, this.category});
  

@override final  int id;
@override final  String? description;
@override final  String? category;

/// Create a copy of RolePermissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolePermissionEntityCopyWith<_RolePermissionEntity> get copyWith => __$RolePermissionEntityCopyWithImpl<_RolePermissionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolePermissionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,category);

@override
String toString() {
  return 'RolePermissionEntity(id: $id, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class _$RolePermissionEntityCopyWith<$Res> implements $RolePermissionEntityCopyWith<$Res> {
  factory _$RolePermissionEntityCopyWith(_RolePermissionEntity value, $Res Function(_RolePermissionEntity) _then) = __$RolePermissionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String? description, String? category
});




}
/// @nodoc
class __$RolePermissionEntityCopyWithImpl<$Res>
    implements _$RolePermissionEntityCopyWith<$Res> {
  __$RolePermissionEntityCopyWithImpl(this._self, this._then);

  final _RolePermissionEntity _self;
  final $Res Function(_RolePermissionEntity) _then;

/// Create a copy of RolePermissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = freezed,Object? category = freezed,}) {
  return _then(_RolePermissionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
