// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_context_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentContextModel {

@JsonKey(fromJson: _idFromJson) String? get currentCompanyId;@JsonKey(fromJson: _idFromJson) String? get currentBranchId;
/// Create a copy of CurrentContextModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentContextModelCopyWith<CurrentContextModel> get copyWith => _$CurrentContextModelCopyWithImpl<CurrentContextModel>(this as CurrentContextModel, _$identity);

  /// Serializes this CurrentContextModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentContextModel&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentCompanyId,currentBranchId);

@override
String toString() {
  return 'CurrentContextModel(currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId)';
}


}

/// @nodoc
abstract mixin class $CurrentContextModelCopyWith<$Res>  {
  factory $CurrentContextModelCopyWith(CurrentContextModel value, $Res Function(CurrentContextModel) _then) = _$CurrentContextModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _idFromJson) String? currentCompanyId,@JsonKey(fromJson: _idFromJson) String? currentBranchId
});




}
/// @nodoc
class _$CurrentContextModelCopyWithImpl<$Res>
    implements $CurrentContextModelCopyWith<$Res> {
  _$CurrentContextModelCopyWithImpl(this._self, this._then);

  final CurrentContextModel _self;
  final $Res Function(CurrentContextModel) _then;

/// Create a copy of CurrentContextModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentCompanyId = freezed,Object? currentBranchId = freezed,}) {
  return _then(_self.copyWith(
currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentContextModel].
extension CurrentContextModelPatterns on CurrentContextModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentContextModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentContextModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentContextModel value)  $default,){
final _that = this;
switch (_that) {
case _CurrentContextModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentContextModel value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentContextModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentContextModel() when $default != null:
return $default(_that.currentCompanyId,_that.currentBranchId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId)  $default,) {final _that = this;
switch (_that) {
case _CurrentContextModel():
return $default(_that.currentCompanyId,_that.currentBranchId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId)?  $default,) {final _that = this;
switch (_that) {
case _CurrentContextModel() when $default != null:
return $default(_that.currentCompanyId,_that.currentBranchId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentContextModel implements CurrentContextModel {
  const _CurrentContextModel({@JsonKey(fromJson: _idFromJson) this.currentCompanyId, @JsonKey(fromJson: _idFromJson) this.currentBranchId});
  factory _CurrentContextModel.fromJson(Map<String, dynamic> json) => _$CurrentContextModelFromJson(json);

@override@JsonKey(fromJson: _idFromJson) final  String? currentCompanyId;
@override@JsonKey(fromJson: _idFromJson) final  String? currentBranchId;

/// Create a copy of CurrentContextModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentContextModelCopyWith<_CurrentContextModel> get copyWith => __$CurrentContextModelCopyWithImpl<_CurrentContextModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentContextModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentContextModel&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentCompanyId,currentBranchId);

@override
String toString() {
  return 'CurrentContextModel(currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId)';
}


}

/// @nodoc
abstract mixin class _$CurrentContextModelCopyWith<$Res> implements $CurrentContextModelCopyWith<$Res> {
  factory _$CurrentContextModelCopyWith(_CurrentContextModel value, $Res Function(_CurrentContextModel) _then) = __$CurrentContextModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _idFromJson) String? currentCompanyId,@JsonKey(fromJson: _idFromJson) String? currentBranchId
});




}
/// @nodoc
class __$CurrentContextModelCopyWithImpl<$Res>
    implements _$CurrentContextModelCopyWith<$Res> {
  __$CurrentContextModelCopyWithImpl(this._self, this._then);

  final _CurrentContextModel _self;
  final $Res Function(_CurrentContextModel) _then;

/// Create a copy of CurrentContextModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentCompanyId = freezed,Object? currentBranchId = freezed,}) {
  return _then(_CurrentContextModel(
currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
