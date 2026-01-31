// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentContext {

 String? get currentCompanyId; String? get currentBranchId;
/// Create a copy of CurrentContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentContextCopyWith<CurrentContext> get copyWith => _$CurrentContextCopyWithImpl<CurrentContext>(this as CurrentContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentContext&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId));
}


@override
int get hashCode => Object.hash(runtimeType,currentCompanyId,currentBranchId);

@override
String toString() {
  return 'CurrentContext(currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId)';
}


}

/// @nodoc
abstract mixin class $CurrentContextCopyWith<$Res>  {
  factory $CurrentContextCopyWith(CurrentContext value, $Res Function(CurrentContext) _then) = _$CurrentContextCopyWithImpl;
@useResult
$Res call({
 String? currentCompanyId, String? currentBranchId
});




}
/// @nodoc
class _$CurrentContextCopyWithImpl<$Res>
    implements $CurrentContextCopyWith<$Res> {
  _$CurrentContextCopyWithImpl(this._self, this._then);

  final CurrentContext _self;
  final $Res Function(CurrentContext) _then;

/// Create a copy of CurrentContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentCompanyId = freezed,Object? currentBranchId = freezed,}) {
  return _then(_self.copyWith(
currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentContext].
extension CurrentContextPatterns on CurrentContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentContext value)  $default,){
final _that = this;
switch (_that) {
case _CurrentContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentContext value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? currentCompanyId,  String? currentBranchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentContext() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? currentCompanyId,  String? currentBranchId)  $default,) {final _that = this;
switch (_that) {
case _CurrentContext():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? currentCompanyId,  String? currentBranchId)?  $default,) {final _that = this;
switch (_that) {
case _CurrentContext() when $default != null:
return $default(_that.currentCompanyId,_that.currentBranchId);case _:
  return null;

}
}

}

/// @nodoc


class _CurrentContext implements CurrentContext {
  const _CurrentContext({this.currentCompanyId, this.currentBranchId});
  

@override final  String? currentCompanyId;
@override final  String? currentBranchId;

/// Create a copy of CurrentContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentContextCopyWith<_CurrentContext> get copyWith => __$CurrentContextCopyWithImpl<_CurrentContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentContext&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId));
}


@override
int get hashCode => Object.hash(runtimeType,currentCompanyId,currentBranchId);

@override
String toString() {
  return 'CurrentContext(currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId)';
}


}

/// @nodoc
abstract mixin class _$CurrentContextCopyWith<$Res> implements $CurrentContextCopyWith<$Res> {
  factory _$CurrentContextCopyWith(_CurrentContext value, $Res Function(_CurrentContext) _then) = __$CurrentContextCopyWithImpl;
@override @useResult
$Res call({
 String? currentCompanyId, String? currentBranchId
});




}
/// @nodoc
class __$CurrentContextCopyWithImpl<$Res>
    implements _$CurrentContextCopyWith<$Res> {
  __$CurrentContextCopyWithImpl(this._self, this._then);

  final _CurrentContext _self;
  final $Res Function(_CurrentContext) _then;

/// Create a copy of CurrentContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentCompanyId = freezed,Object? currentBranchId = freezed,}) {
  return _then(_CurrentContext(
currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
