// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RolePermissionModel {

 int get id; String? get description; String? get category;
/// Create a copy of RolePermissionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolePermissionModelCopyWith<RolePermissionModel> get copyWith => _$RolePermissionModelCopyWithImpl<RolePermissionModel>(this as RolePermissionModel, _$identity);

  /// Serializes this RolePermissionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolePermissionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,category);

@override
String toString() {
  return 'RolePermissionModel(id: $id, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class $RolePermissionModelCopyWith<$Res>  {
  factory $RolePermissionModelCopyWith(RolePermissionModel value, $Res Function(RolePermissionModel) _then) = _$RolePermissionModelCopyWithImpl;
@useResult
$Res call({
 int id, String? description, String? category
});




}
/// @nodoc
class _$RolePermissionModelCopyWithImpl<$Res>
    implements $RolePermissionModelCopyWith<$Res> {
  _$RolePermissionModelCopyWithImpl(this._self, this._then);

  final RolePermissionModel _self;
  final $Res Function(RolePermissionModel) _then;

/// Create a copy of RolePermissionModel
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


/// Adds pattern-matching-related methods to [RolePermissionModel].
extension RolePermissionModelPatterns on RolePermissionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolePermissionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolePermissionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolePermissionModel value)  $default,){
final _that = this;
switch (_that) {
case _RolePermissionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolePermissionModel value)?  $default,){
final _that = this;
switch (_that) {
case _RolePermissionModel() when $default != null:
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
case _RolePermissionModel() when $default != null:
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
case _RolePermissionModel():
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
case _RolePermissionModel() when $default != null:
return $default(_that.id,_that.description,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RolePermissionModel implements RolePermissionModel {
  const _RolePermissionModel({required this.id, this.description, this.category});
  factory _RolePermissionModel.fromJson(Map<String, dynamic> json) => _$RolePermissionModelFromJson(json);

@override final  int id;
@override final  String? description;
@override final  String? category;

/// Create a copy of RolePermissionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolePermissionModelCopyWith<_RolePermissionModel> get copyWith => __$RolePermissionModelCopyWithImpl<_RolePermissionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RolePermissionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolePermissionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,category);

@override
String toString() {
  return 'RolePermissionModel(id: $id, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class _$RolePermissionModelCopyWith<$Res> implements $RolePermissionModelCopyWith<$Res> {
  factory _$RolePermissionModelCopyWith(_RolePermissionModel value, $Res Function(_RolePermissionModel) _then) = __$RolePermissionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? description, String? category
});




}
/// @nodoc
class __$RolePermissionModelCopyWithImpl<$Res>
    implements _$RolePermissionModelCopyWith<$Res> {
  __$RolePermissionModelCopyWithImpl(this._self, this._then);

  final _RolePermissionModel _self;
  final $Res Function(_RolePermissionModel) _then;

/// Create a copy of RolePermissionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = freezed,Object? category = freezed,}) {
  return _then(_RolePermissionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
