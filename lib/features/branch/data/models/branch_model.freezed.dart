// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; String get name;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get companyId; bool get isActive; DateTime? get createdAt;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? get createdBy;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? get updatedBy;
/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchModelCopyWith<BranchModel> get copyWith => _$BranchModelCopyWithImpl<BranchModel>(this as BranchModel, _$identity);

  /// Serializes this BranchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,companyId,isActive,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'BranchModel(id: $id, name: $name, companyId: $companyId, isActive: $isActive, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $BranchModelCopyWith<$Res>  {
  factory $BranchModelCopyWith(BranchModel value, $Res Function(BranchModel) _then) = _$BranchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String companyId, bool isActive, DateTime? createdAt,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? createdBy,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? updatedBy
});




}
/// @nodoc
class _$BranchModelCopyWithImpl<$Res>
    implements $BranchModelCopyWith<$Res> {
  _$BranchModelCopyWithImpl(this._self, this._then);

  final BranchModel _self;
  final $Res Function(BranchModel) _then;

/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? companyId = null,Object? isActive = null,Object? createdAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchModel].
extension BranchModelPatterns on BranchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchModel value)  $default,){
final _that = this;
switch (_that) {
case _BranchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchModel value)?  $default,){
final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String companyId,  bool isActive,  DateTime? createdAt, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? createdBy, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
return $default(_that.id,_that.name,_that.companyId,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String companyId,  bool isActive,  DateTime? createdAt, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? createdBy, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _BranchModel():
return $default(_that.id,_that.name,_that.companyId,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String companyId,  bool isActive,  DateTime? createdAt, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? createdBy, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable)  String? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
return $default(_that.id,_that.name,_that.companyId,_that.isActive,_that.createdAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchModel implements BranchModel {
  const _BranchModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, required this.name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.companyId, this.isActive = true, this.createdAt, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) this.createdBy, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) this.updatedBy});
  factory _BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  String name;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String companyId;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) final  String? createdBy;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) final  String? updatedBy;

/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchModelCopyWith<_BranchModel> get copyWith => __$BranchModelCopyWithImpl<_BranchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,companyId,isActive,createdAt,createdBy,updatedBy);

@override
String toString() {
  return 'BranchModel(id: $id, name: $name, companyId: $companyId, isActive: $isActive, createdAt: $createdAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$BranchModelCopyWith<$Res> implements $BranchModelCopyWith<$Res> {
  factory _$BranchModelCopyWith(_BranchModel value, $Res Function(_BranchModel) _then) = __$BranchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String companyId, bool isActive, DateTime? createdAt,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? createdBy,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamicNullable) String? updatedBy
});




}
/// @nodoc
class __$BranchModelCopyWithImpl<$Res>
    implements _$BranchModelCopyWith<$Res> {
  __$BranchModelCopyWithImpl(this._self, this._then);

  final _BranchModel _self;
  final $Res Function(_BranchModel) _then;

/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? companyId = null,Object? isActive = null,Object? createdAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_BranchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
