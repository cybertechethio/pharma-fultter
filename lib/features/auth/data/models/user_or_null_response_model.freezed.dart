// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_or_null_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserOrNullResponseModel {

 UserModel? get user;
/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserOrNullResponseModelCopyWith<UserOrNullResponseModel> get copyWith => _$UserOrNullResponseModelCopyWithImpl<UserOrNullResponseModel>(this as UserOrNullResponseModel, _$identity);

  /// Serializes this UserOrNullResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserOrNullResponseModel&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserOrNullResponseModel(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserOrNullResponseModelCopyWith<$Res>  {
  factory $UserOrNullResponseModelCopyWith(UserOrNullResponseModel value, $Res Function(UserOrNullResponseModel) _then) = _$UserOrNullResponseModelCopyWithImpl;
@useResult
$Res call({
 UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$UserOrNullResponseModelCopyWithImpl<$Res>
    implements $UserOrNullResponseModelCopyWith<$Res> {
  _$UserOrNullResponseModelCopyWithImpl(this._self, this._then);

  final UserOrNullResponseModel _self;
  final $Res Function(UserOrNullResponseModel) _then;

/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserOrNullResponseModel].
extension UserOrNullResponseModelPatterns on UserOrNullResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserOrNullResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserOrNullResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserOrNullResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UserOrNullResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserOrNullResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserOrNullResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserOrNullResponseModel() when $default != null:
return $default(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _UserOrNullResponseModel():
return $default(_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _UserOrNullResponseModel() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserOrNullResponseModel implements UserOrNullResponseModel {
  const _UserOrNullResponseModel({this.user});
  factory _UserOrNullResponseModel.fromJson(Map<String, dynamic> json) => _$UserOrNullResponseModelFromJson(json);

@override final  UserModel? user;

/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserOrNullResponseModelCopyWith<_UserOrNullResponseModel> get copyWith => __$UserOrNullResponseModelCopyWithImpl<_UserOrNullResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserOrNullResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserOrNullResponseModel&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserOrNullResponseModel(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserOrNullResponseModelCopyWith<$Res> implements $UserOrNullResponseModelCopyWith<$Res> {
  factory _$UserOrNullResponseModelCopyWith(_UserOrNullResponseModel value, $Res Function(_UserOrNullResponseModel) _then) = __$UserOrNullResponseModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$UserOrNullResponseModelCopyWithImpl<$Res>
    implements _$UserOrNullResponseModelCopyWith<$Res> {
  __$UserOrNullResponseModelCopyWithImpl(this._self, this._then);

  final _UserOrNullResponseModel _self;
  final $Res Function(_UserOrNullResponseModel) _then;

/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_UserOrNullResponseModel(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of UserOrNullResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
