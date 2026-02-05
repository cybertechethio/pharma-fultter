// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_item_types_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualItemTypesBreakdown {

 AnnualItemTypeData get direct; AnnualItemTypeData get processed;
/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownCopyWith<AnnualItemTypesBreakdown> get copyWith => _$AnnualItemTypesBreakdownCopyWithImpl<AnnualItemTypesBreakdown>(this as AnnualItemTypesBreakdown, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualItemTypesBreakdown&&(identical(other.direct, direct) || other.direct == direct)&&(identical(other.processed, processed) || other.processed == processed));
}


@override
int get hashCode => Object.hash(runtimeType,direct,processed);

@override
String toString() {
  return 'AnnualItemTypesBreakdown(direct: $direct, processed: $processed)';
}


}

/// @nodoc
abstract mixin class $AnnualItemTypesBreakdownCopyWith<$Res>  {
  factory $AnnualItemTypesBreakdownCopyWith(AnnualItemTypesBreakdown value, $Res Function(AnnualItemTypesBreakdown) _then) = _$AnnualItemTypesBreakdownCopyWithImpl;
@useResult
$Res call({
 AnnualItemTypeData direct, AnnualItemTypeData processed
});


$AnnualItemTypeDataCopyWith<$Res> get direct;$AnnualItemTypeDataCopyWith<$Res> get processed;

}
/// @nodoc
class _$AnnualItemTypesBreakdownCopyWithImpl<$Res>
    implements $AnnualItemTypesBreakdownCopyWith<$Res> {
  _$AnnualItemTypesBreakdownCopyWithImpl(this._self, this._then);

  final AnnualItemTypesBreakdown _self;
  final $Res Function(AnnualItemTypesBreakdown) _then;

/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? direct = null,Object? processed = null,}) {
  return _then(_self.copyWith(
direct: null == direct ? _self.direct : direct // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeData,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeData,
  ));
}
/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataCopyWith<$Res> get direct {
  
  return $AnnualItemTypeDataCopyWith<$Res>(_self.direct, (value) {
    return _then(_self.copyWith(direct: value));
  });
}/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataCopyWith<$Res> get processed {
  
  return $AnnualItemTypeDataCopyWith<$Res>(_self.processed, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualItemTypesBreakdown].
extension AnnualItemTypesBreakdownPatterns on AnnualItemTypesBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualItemTypesBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualItemTypesBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualItemTypesBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualItemTypeData direct,  AnnualItemTypeData processed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown() when $default != null:
return $default(_that.direct,_that.processed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualItemTypeData direct,  AnnualItemTypeData processed)  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown():
return $default(_that.direct,_that.processed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualItemTypeData direct,  AnnualItemTypeData processed)?  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdown() when $default != null:
return $default(_that.direct,_that.processed);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualItemTypesBreakdown implements AnnualItemTypesBreakdown {
  const _AnnualItemTypesBreakdown({required this.direct, required this.processed});
  

@override final  AnnualItemTypeData direct;
@override final  AnnualItemTypeData processed;

/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualItemTypesBreakdownCopyWith<_AnnualItemTypesBreakdown> get copyWith => __$AnnualItemTypesBreakdownCopyWithImpl<_AnnualItemTypesBreakdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualItemTypesBreakdown&&(identical(other.direct, direct) || other.direct == direct)&&(identical(other.processed, processed) || other.processed == processed));
}


@override
int get hashCode => Object.hash(runtimeType,direct,processed);

@override
String toString() {
  return 'AnnualItemTypesBreakdown(direct: $direct, processed: $processed)';
}


}

/// @nodoc
abstract mixin class _$AnnualItemTypesBreakdownCopyWith<$Res> implements $AnnualItemTypesBreakdownCopyWith<$Res> {
  factory _$AnnualItemTypesBreakdownCopyWith(_AnnualItemTypesBreakdown value, $Res Function(_AnnualItemTypesBreakdown) _then) = __$AnnualItemTypesBreakdownCopyWithImpl;
@override @useResult
$Res call({
 AnnualItemTypeData direct, AnnualItemTypeData processed
});


@override $AnnualItemTypeDataCopyWith<$Res> get direct;@override $AnnualItemTypeDataCopyWith<$Res> get processed;

}
/// @nodoc
class __$AnnualItemTypesBreakdownCopyWithImpl<$Res>
    implements _$AnnualItemTypesBreakdownCopyWith<$Res> {
  __$AnnualItemTypesBreakdownCopyWithImpl(this._self, this._then);

  final _AnnualItemTypesBreakdown _self;
  final $Res Function(_AnnualItemTypesBreakdown) _then;

/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? direct = null,Object? processed = null,}) {
  return _then(_AnnualItemTypesBreakdown(
direct: null == direct ? _self.direct : direct // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeData,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeData,
  ));
}

/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataCopyWith<$Res> get direct {
  
  return $AnnualItemTypeDataCopyWith<$Res>(_self.direct, (value) {
    return _then(_self.copyWith(direct: value));
  });
}/// Create a copy of AnnualItemTypesBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataCopyWith<$Res> get processed {
  
  return $AnnualItemTypeDataCopyWith<$Res>(_self.processed, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}

// dart format on
