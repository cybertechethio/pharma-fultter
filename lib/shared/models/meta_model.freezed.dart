// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaModel {

 String? get requestId; String get timestamp;
/// Create a copy of MetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaModelCopyWith<MetaModel> get copyWith => _$MetaModelCopyWithImpl<MetaModel>(this as MetaModel, _$identity);

  /// Serializes this MetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,timestamp);

@override
String toString() {
  return 'MetaModel(requestId: $requestId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $MetaModelCopyWith<$Res>  {
  factory $MetaModelCopyWith(MetaModel value, $Res Function(MetaModel) _then) = _$MetaModelCopyWithImpl;
@useResult
$Res call({
 String? requestId, String timestamp
});




}
/// @nodoc
class _$MetaModelCopyWithImpl<$Res>
    implements $MetaModelCopyWith<$Res> {
  _$MetaModelCopyWithImpl(this._self, this._then);

  final MetaModel _self;
  final $Res Function(MetaModel) _then;

/// Create a copy of MetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,Object? timestamp = null,}) {
  return _then(_self.copyWith(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaModel].
extension MetaModelPatterns on MetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaModel value)  $default,){
final _that = this;
switch (_that) {
case _MetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? requestId,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaModel() when $default != null:
return $default(_that.requestId,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? requestId,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _MetaModel():
return $default(_that.requestId,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? requestId,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _MetaModel() when $default != null:
return $default(_that.requestId,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaModel implements MetaModel {
  const _MetaModel({this.requestId, required this.timestamp});
  factory _MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);

@override final  String? requestId;
@override final  String timestamp;

/// Create a copy of MetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaModelCopyWith<_MetaModel> get copyWith => __$MetaModelCopyWithImpl<_MetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,timestamp);

@override
String toString() {
  return 'MetaModel(requestId: $requestId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$MetaModelCopyWith<$Res> implements $MetaModelCopyWith<$Res> {
  factory _$MetaModelCopyWith(_MetaModel value, $Res Function(_MetaModel) _then) = __$MetaModelCopyWithImpl;
@override @useResult
$Res call({
 String? requestId, String timestamp
});




}
/// @nodoc
class __$MetaModelCopyWithImpl<$Res>
    implements _$MetaModelCopyWith<$Res> {
  __$MetaModelCopyWithImpl(this._self, this._then);

  final _MetaModel _self;
  final $Res Function(_MetaModel) _then;

/// Create a copy of MetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,Object? timestamp = null,}) {
  return _then(_MetaModel(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
