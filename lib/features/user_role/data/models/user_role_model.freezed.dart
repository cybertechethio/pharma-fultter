// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBranchRoleAssignmentModel {

 int get branchId; String get branchName; List<RoleAssignmentModel> get roles;
/// Create a copy of UserBranchRoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBranchRoleAssignmentModelCopyWith<UserBranchRoleAssignmentModel> get copyWith => _$UserBranchRoleAssignmentModelCopyWithImpl<UserBranchRoleAssignmentModel>(this as UserBranchRoleAssignmentModel, _$identity);

  /// Serializes this UserBranchRoleAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBranchRoleAssignmentModel&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,branchName,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'UserBranchRoleAssignmentModel(branchId: $branchId, branchName: $branchName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserBranchRoleAssignmentModelCopyWith<$Res>  {
  factory $UserBranchRoleAssignmentModelCopyWith(UserBranchRoleAssignmentModel value, $Res Function(UserBranchRoleAssignmentModel) _then) = _$UserBranchRoleAssignmentModelCopyWithImpl;
@useResult
$Res call({
 int branchId, String branchName, List<RoleAssignmentModel> roles
});




}
/// @nodoc
class _$UserBranchRoleAssignmentModelCopyWithImpl<$Res>
    implements $UserBranchRoleAssignmentModelCopyWith<$Res> {
  _$UserBranchRoleAssignmentModelCopyWithImpl(this._self, this._then);

  final UserBranchRoleAssignmentModel _self;
  final $Res Function(UserBranchRoleAssignmentModel) _then;

/// Create a copy of UserBranchRoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? branchName = null,Object? roles = null,}) {
  return _then(_self.copyWith(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleAssignmentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBranchRoleAssignmentModel].
extension UserBranchRoleAssignmentModelPatterns on UserBranchRoleAssignmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBranchRoleAssignmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBranchRoleAssignmentModel value)  $default,){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBranchRoleAssignmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int branchId,  String branchName,  List<RoleAssignmentModel> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int branchId,  String branchName,  List<RoleAssignmentModel> roles)  $default,) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int branchId,  String branchName,  List<RoleAssignmentModel> roles)?  $default,) {final _that = this;
switch (_that) {
case _UserBranchRoleAssignmentModel() when $default != null:
return $default(_that.branchId,_that.branchName,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBranchRoleAssignmentModel implements UserBranchRoleAssignmentModel {
  const _UserBranchRoleAssignmentModel({required this.branchId, required this.branchName, required final  List<RoleAssignmentModel> roles}): _roles = roles;
  factory _UserBranchRoleAssignmentModel.fromJson(Map<String, dynamic> json) => _$UserBranchRoleAssignmentModelFromJson(json);

@override final  int branchId;
@override final  String branchName;
 final  List<RoleAssignmentModel> _roles;
@override List<RoleAssignmentModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of UserBranchRoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBranchRoleAssignmentModelCopyWith<_UserBranchRoleAssignmentModel> get copyWith => __$UserBranchRoleAssignmentModelCopyWithImpl<_UserBranchRoleAssignmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBranchRoleAssignmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBranchRoleAssignmentModel&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,branchName,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'UserBranchRoleAssignmentModel(branchId: $branchId, branchName: $branchName, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$UserBranchRoleAssignmentModelCopyWith<$Res> implements $UserBranchRoleAssignmentModelCopyWith<$Res> {
  factory _$UserBranchRoleAssignmentModelCopyWith(_UserBranchRoleAssignmentModel value, $Res Function(_UserBranchRoleAssignmentModel) _then) = __$UserBranchRoleAssignmentModelCopyWithImpl;
@override @useResult
$Res call({
 int branchId, String branchName, List<RoleAssignmentModel> roles
});




}
/// @nodoc
class __$UserBranchRoleAssignmentModelCopyWithImpl<$Res>
    implements _$UserBranchRoleAssignmentModelCopyWith<$Res> {
  __$UserBranchRoleAssignmentModelCopyWithImpl(this._self, this._then);

  final _UserBranchRoleAssignmentModel _self;
  final $Res Function(_UserBranchRoleAssignmentModel) _then;

/// Create a copy of UserBranchRoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? branchName = null,Object? roles = null,}) {
  return _then(_UserBranchRoleAssignmentModel(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleAssignmentModel>,
  ));
}


}


/// @nodoc
mixin _$RoleAssignmentModel {

 int get id; String get name;
/// Create a copy of RoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleAssignmentModelCopyWith<RoleAssignmentModel> get copyWith => _$RoleAssignmentModelCopyWithImpl<RoleAssignmentModel>(this as RoleAssignmentModel, _$identity);

  /// Serializes this RoleAssignmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleAssignmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RoleAssignmentModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RoleAssignmentModelCopyWith<$Res>  {
  factory $RoleAssignmentModelCopyWith(RoleAssignmentModel value, $Res Function(RoleAssignmentModel) _then) = _$RoleAssignmentModelCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$RoleAssignmentModelCopyWithImpl<$Res>
    implements $RoleAssignmentModelCopyWith<$Res> {
  _$RoleAssignmentModelCopyWithImpl(this._self, this._then);

  final RoleAssignmentModel _self;
  final $Res Function(RoleAssignmentModel) _then;

/// Create a copy of RoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleAssignmentModel].
extension RoleAssignmentModelPatterns on RoleAssignmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleAssignmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleAssignmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleAssignmentModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleAssignmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleAssignmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleAssignmentModel() when $default != null:
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
case _RoleAssignmentModel() when $default != null:
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
case _RoleAssignmentModel():
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
case _RoleAssignmentModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleAssignmentModel implements RoleAssignmentModel {
  const _RoleAssignmentModel({required this.id, required this.name});
  factory _RoleAssignmentModel.fromJson(Map<String, dynamic> json) => _$RoleAssignmentModelFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of RoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleAssignmentModelCopyWith<_RoleAssignmentModel> get copyWith => __$RoleAssignmentModelCopyWithImpl<_RoleAssignmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleAssignmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleAssignmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RoleAssignmentModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RoleAssignmentModelCopyWith<$Res> implements $RoleAssignmentModelCopyWith<$Res> {
  factory _$RoleAssignmentModelCopyWith(_RoleAssignmentModel value, $Res Function(_RoleAssignmentModel) _then) = __$RoleAssignmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$RoleAssignmentModelCopyWithImpl<$Res>
    implements _$RoleAssignmentModelCopyWith<$Res> {
  __$RoleAssignmentModelCopyWithImpl(this._self, this._then);

  final _RoleAssignmentModel _self;
  final $Res Function(_RoleAssignmentModel) _then;

/// Create a copy of RoleAssignmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RoleAssignmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
