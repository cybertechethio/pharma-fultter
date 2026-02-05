// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_item_types_breakdown_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualItemTypesBreakdownModel {

 AnnualItemTypeDataModel get direct; AnnualItemTypeDataModel get processed;
/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownModelCopyWith<AnnualItemTypesBreakdownModel> get copyWith => _$AnnualItemTypesBreakdownModelCopyWithImpl<AnnualItemTypesBreakdownModel>(this as AnnualItemTypesBreakdownModel, _$identity);

  /// Serializes this AnnualItemTypesBreakdownModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualItemTypesBreakdownModel&&(identical(other.direct, direct) || other.direct == direct)&&(identical(other.processed, processed) || other.processed == processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,direct,processed);

@override
String toString() {
  return 'AnnualItemTypesBreakdownModel(direct: $direct, processed: $processed)';
}


}

/// @nodoc
abstract mixin class $AnnualItemTypesBreakdownModelCopyWith<$Res>  {
  factory $AnnualItemTypesBreakdownModelCopyWith(AnnualItemTypesBreakdownModel value, $Res Function(AnnualItemTypesBreakdownModel) _then) = _$AnnualItemTypesBreakdownModelCopyWithImpl;
@useResult
$Res call({
 AnnualItemTypeDataModel direct, AnnualItemTypeDataModel processed
});


$AnnualItemTypeDataModelCopyWith<$Res> get direct;$AnnualItemTypeDataModelCopyWith<$Res> get processed;

}
/// @nodoc
class _$AnnualItemTypesBreakdownModelCopyWithImpl<$Res>
    implements $AnnualItemTypesBreakdownModelCopyWith<$Res> {
  _$AnnualItemTypesBreakdownModelCopyWithImpl(this._self, this._then);

  final AnnualItemTypesBreakdownModel _self;
  final $Res Function(AnnualItemTypesBreakdownModel) _then;

/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? direct = null,Object? processed = null,}) {
  return _then(_self.copyWith(
direct: null == direct ? _self.direct : direct // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeDataModel,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeDataModel,
  ));
}
/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataModelCopyWith<$Res> get direct {
  
  return $AnnualItemTypeDataModelCopyWith<$Res>(_self.direct, (value) {
    return _then(_self.copyWith(direct: value));
  });
}/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataModelCopyWith<$Res> get processed {
  
  return $AnnualItemTypeDataModelCopyWith<$Res>(_self.processed, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualItemTypesBreakdownModel].
extension AnnualItemTypesBreakdownModelPatterns on AnnualItemTypesBreakdownModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualItemTypesBreakdownModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualItemTypesBreakdownModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualItemTypesBreakdownModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualItemTypeDataModel direct,  AnnualItemTypeDataModel processed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualItemTypeDataModel direct,  AnnualItemTypeDataModel processed)  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualItemTypeDataModel direct,  AnnualItemTypeDataModel processed)?  $default,) {final _that = this;
switch (_that) {
case _AnnualItemTypesBreakdownModel() when $default != null:
return $default(_that.direct,_that.processed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualItemTypesBreakdownModel implements AnnualItemTypesBreakdownModel {
  const _AnnualItemTypesBreakdownModel({required this.direct, required this.processed});
  factory _AnnualItemTypesBreakdownModel.fromJson(Map<String, dynamic> json) => _$AnnualItemTypesBreakdownModelFromJson(json);

@override final  AnnualItemTypeDataModel direct;
@override final  AnnualItemTypeDataModel processed;

/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualItemTypesBreakdownModelCopyWith<_AnnualItemTypesBreakdownModel> get copyWith => __$AnnualItemTypesBreakdownModelCopyWithImpl<_AnnualItemTypesBreakdownModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualItemTypesBreakdownModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualItemTypesBreakdownModel&&(identical(other.direct, direct) || other.direct == direct)&&(identical(other.processed, processed) || other.processed == processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,direct,processed);

@override
String toString() {
  return 'AnnualItemTypesBreakdownModel(direct: $direct, processed: $processed)';
}


}

/// @nodoc
abstract mixin class _$AnnualItemTypesBreakdownModelCopyWith<$Res> implements $AnnualItemTypesBreakdownModelCopyWith<$Res> {
  factory _$AnnualItemTypesBreakdownModelCopyWith(_AnnualItemTypesBreakdownModel value, $Res Function(_AnnualItemTypesBreakdownModel) _then) = __$AnnualItemTypesBreakdownModelCopyWithImpl;
@override @useResult
$Res call({
 AnnualItemTypeDataModel direct, AnnualItemTypeDataModel processed
});


@override $AnnualItemTypeDataModelCopyWith<$Res> get direct;@override $AnnualItemTypeDataModelCopyWith<$Res> get processed;

}
/// @nodoc
class __$AnnualItemTypesBreakdownModelCopyWithImpl<$Res>
    implements _$AnnualItemTypesBreakdownModelCopyWith<$Res> {
  __$AnnualItemTypesBreakdownModelCopyWithImpl(this._self, this._then);

  final _AnnualItemTypesBreakdownModel _self;
  final $Res Function(_AnnualItemTypesBreakdownModel) _then;

/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? direct = null,Object? processed = null,}) {
  return _then(_AnnualItemTypesBreakdownModel(
direct: null == direct ? _self.direct : direct // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeDataModel,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as AnnualItemTypeDataModel,
  ));
}

/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataModelCopyWith<$Res> get direct {
  
  return $AnnualItemTypeDataModelCopyWith<$Res>(_self.direct, (value) {
    return _then(_self.copyWith(direct: value));
  });
}/// Create a copy of AnnualItemTypesBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypeDataModelCopyWith<$Res> get processed {
  
  return $AnnualItemTypeDataModelCopyWith<$Res>(_self.processed, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}

// dart format on
