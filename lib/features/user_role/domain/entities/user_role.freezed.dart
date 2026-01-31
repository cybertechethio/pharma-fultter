// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserBranchRoleAssignment {

 int get branchId; String get branchName; List<RoleAssignment> get roles;
/// Create a copy of UserBranchRoleAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBranchRoleAssignmentCopyWith<UserBranchRoleAssignment> get copyWith => _$UserBranchRoleAssignmentCopyWithImpl<UserBranchRoleAssignment>(this as UserBranchRoleAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBranchRoleAssignment&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&const DeepCollectionEquality().equals(other.roles, roles));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,branchName,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserBranchRoleAssignment(branchId: $branchId, branchName: $branchName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserBranchRoleAssignmentCopyWith<$Res>  {
  factory $UserBranchRoleAssignmentCopyWith(UserBranchRoleAssignment value, $Res Function(UserBranchRoleAssignment) _then) = _$UserBranchRoleAssignmentCopyWithImpl;
@useResult
$Res call({
 int branchId, String branchName, List<RoleAssignment> roles
});




}
/// @nodoc
class _$UserBranchRoleAssignmentCopyWithImpl<$Res>
    implements $UserBranchRoleAssignmentCopyWith<$Res> {
  _$UserBranchRoleAssignmentCopyWithImpl(this._self, this._then);

  final UserBranchRoleAssignment _self;
  final $Res Function(UserBranchRoleAssignment) _then;

/// Create a copy of UserBranchRoleAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? branchName = null,Object? roles = null,}) {
  return _then(_self.copyWith(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleAssignment>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBranchRoleAssignment].
extension UserBranchRoleAssignmentPatterns on UserBranchRoleAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBranchRoleAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBranchRoleAssignment value)  $default,){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBranchRoleAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int branchId,  String branchName,  List<RoleAssignment> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignment() when $default != null:
return $default(_that.branchId,_that.branchName,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int branchId,  String branchName,  List<RoleAssignment> roles)  $default,) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignment():
return $default(_that.branchId,_that.branchName,_that.roles);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int branchId,  String branchName,  List<RoleAssignment> roles)?  $default,) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignment() when $default != null:
return $default(_that.branchId,_that.branchName,_that.roles);case _:
  return null;

}
}

}

/// @nodoc


class _UserBranchRoleAssignment implements UserBranchRoleAssignment {
  const _UserBranchRoleAssignment({required this.branchId, required this.branchName, required final  List<RoleAssignment> roles}): _roles = roles;
  

@override final  int branchId;
@override final  String branchName;
 final  List<RoleAssignment> _roles;
@override List<RoleAssignment> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserBranchRoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBranchRoleAssignmentCopyWith<_UserBranchRoleAssignment> get copyWith => __$UserBranchRoleAssignmentCopyWithImpl<_UserBranchRoleAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBranchRoleAssignment&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&const DeepCollectionEquality().equals(other._roles, _roles));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,branchName,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserBranchRoleAssignment(branchId: $branchId, branchName: $branchName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserBranchRoleAssignmentCopyWith<$Res> implements $UserBranchRoleAssignmentCopyWith<$Res> {
  factory _$UserBranchRoleAssignmentCopyWith(_UserBranchRoleAssignment value, $Res Function(_UserBranchRoleAssignment) _then) = __$UserBranchRoleAssignmentCopyWithImpl;
@override @useResult
$Res call({
 int branchId, String branchName, List<RoleAssignment> roles
});




}
/// @nodoc
class __$UserBranchRoleAssignmentCopyWithImpl<$Res>
    implements _$UserBranchRoleAssignmentCopyWith<$Res> {
  __$UserBranchRoleAssignmentCopyWithImpl(this._self, this._then);

  final _UserBranchRoleAssignment _self;
  final $Res Function(_UserBranchRoleAssignment) _then;

/// Create a copy of UserBranchRoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? branchName = null,Object? roles = null,}) {
  return _then(_UserBranchRoleAssignment(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleAssignment>,
  ));
}


}

/// @nodoc
mixin _$RoleAssignment {

 int get id; String get name;
/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleAssignmentCopyWith<RoleAssignment> get copyWith => _$RoleAssignmentCopyWithImpl<RoleAssignment>(this as RoleAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RoleAssignment(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RoleAssignmentCopyWith<$Res>  {
  factory $RoleAssignmentCopyWith(RoleAssignment value, $Res Function(RoleAssignment) _then) = _$RoleAssignmentCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$RoleAssignmentCopyWithImpl<$Res>
    implements $RoleAssignmentCopyWith<$Res> {
  _$RoleAssignmentCopyWithImpl(this._self, this._then);

  final RoleAssignment _self;
  final $Res Function(RoleAssignment) _then;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleAssignment].
extension RoleAssignmentPatterns on RoleAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleAssignment value)  $default,){
final _that = this;
switch (_that) {
case _RoleAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _RoleAssignment():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _RoleAssignment() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _RoleAssignment implements RoleAssignment {
  const _RoleAssignment({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleAssignmentCopyWith<_RoleAssignment> get copyWith => __$RoleAssignmentCopyWithImpl<_RoleAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RoleAssignment(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RoleAssignmentCopyWith<$Res> implements $RoleAssignmentCopyWith<$Res> {
  factory _$RoleAssignmentCopyWith(_RoleAssignment value, $Res Function(_RoleAssignment) _then) = __$RoleAssignmentCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$RoleAssignmentCopyWithImpl<$Res>
    implements _$RoleAssignmentCopyWith<$Res> {
  __$RoleAssignmentCopyWithImpl(this._self, this._then);

  final _RoleAssignment _self;
  final $Res Function(_RoleAssignment) _then;

/// Create a copy of RoleAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RoleAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
