// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoleEntity {

 int get id; String get name; String? get description; int get companyId; bool get isActive; DateTime get createdAt; DateTime? get updatedAt;// Permissions as simple list - comes from role response
 List<RolePermissionEntity> get permissions;
/// Create a copy of RoleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleEntityCopyWith<RoleEntity> get copyWith => _$RoleEntityCopyWithImpl<RoleEntity>(this as RoleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,companyId,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'RoleEntity(id: $id, name: $name, description: $description, companyId: $companyId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $RoleEntityCopyWith<$Res>  {
  factory $RoleEntityCopyWith(RoleEntity value, $Res Function(RoleEntity) _then) = _$RoleEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, int companyId, bool isActive, DateTime createdAt, DateTime? updatedAt, List<RolePermissionEntity> permissions
});




}
/// @nodoc
class _$RoleEntityCopyWithImpl<$Res>
    implements $RoleEntityCopyWith<$Res> {
  _$RoleEntityCopyWithImpl(this._self, this._then);

  final RoleEntity _self;
  final $Res Function(RoleEntity) _then;

/// Create a copy of RoleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? companyId = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? permissions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<RolePermissionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleEntity].
extension RoleEntityPatterns on RoleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleEntity value)  $default,){
final _that = this;
switch (_that) {
case _RoleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RoleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  int companyId,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  List<RolePermissionEntity> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.companyId,_that.isActive,_that.createdAt,_that.updatedAt,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  int companyId,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  List<RolePermissionEntity> permissions)  $default,) {final _that = this;
switch (_that) {
case _RoleEntity():
return $default(_that.id,_that.name,_that.description,_that.companyId,_that.isActive,_that.createdAt,_that.updatedAt,_that.permissions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  int companyId,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  List<RolePermissionEntity> permissions)?  $default,) {final _that = this;
switch (_that) {
case _RoleEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.companyId,_that.isActive,_that.createdAt,_that.updatedAt,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc


class _RoleEntity extends RoleEntity {
  const _RoleEntity({required this.id, required this.name, this.description, required this.companyId, this.isActive = true, required this.createdAt, this.updatedAt, final  List<RolePermissionEntity> permissions = const <RolePermissionEntity>[]}): _permissions = permissions,super._();
  

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  int companyId;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
// Permissions as simple list - comes from role response
 final  List<RolePermissionEntity> _permissions;
// Permissions as simple list - comes from role response
@override@JsonKey() List<RolePermissionEntity> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of RoleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleEntityCopyWith<_RoleEntity> get copyWith => __$RoleEntityCopyWithImpl<_RoleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,companyId,isActive,createdAt,updatedAt,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'RoleEntity(id: $id, name: $name, description: $description, companyId: $companyId, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$RoleEntityCopyWith<$Res> implements $RoleEntityCopyWith<$Res> {
  factory _$RoleEntityCopyWith(_RoleEntity value, $Res Function(_RoleEntity) _then) = __$RoleEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, int companyId, bool isActive, DateTime createdAt, DateTime? updatedAt, List<RolePermissionEntity> permissions
});




}
/// @nodoc
class __$RoleEntityCopyWithImpl<$Res>
    implements _$RoleEntityCopyWith<$Res> {
  __$RoleEntityCopyWithImpl(this._self, this._then);

  final _RoleEntity _self;
  final $Res Function(_RoleEntity) _then;

/// Create a copy of RoleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? companyId = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? permissions = null,}) {
  return _then(_RoleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<RolePermissionEntity>,
  ));
}


}

// dart format on
