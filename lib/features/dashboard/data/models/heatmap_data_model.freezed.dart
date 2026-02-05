// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heatmap_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeatmapDataModel {

 DateTime get date;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get value;
/// Create a copy of HeatmapDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeatmapDataModelCopyWith<HeatmapDataModel> get copyWith => _$HeatmapDataModelCopyWithImpl<HeatmapDataModel>(this as HeatmapDataModel, _$identity);

  /// Serializes this HeatmapDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeatmapDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'HeatmapDataModel(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class $HeatmapDataModelCopyWith<$Res>  {
  factory $HeatmapDataModelCopyWith(HeatmapDataModel value, $Res Function(HeatmapDataModel) _then) = _$HeatmapDataModelCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int value
});




}
/// @nodoc
class _$HeatmapDataModelCopyWithImpl<$Res>
    implements $HeatmapDataModelCopyWith<$Res> {
  _$HeatmapDataModelCopyWithImpl(this._self, this._then);

  final HeatmapDataModel _self;
  final $Res Function(HeatmapDataModel) _then;

/// Create a copy of HeatmapDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HeatmapDataModel].
extension HeatmapDataModelPatterns on HeatmapDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeatmapDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeatmapDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeatmapDataModel value)  $default,){
final _that = this;
switch (_that) {
case _HeatmapDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeatmapDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _HeatmapDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeatmapDataModel() when $default != null:
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int value)  $default,) {final _that = this;
switch (_that) {
case _HeatmapDataModel():
return $default(_that.date,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int value)?  $default,) {final _that = this;
switch (_that) {
case _HeatmapDataModel() when $default != null:
return $default(_that.date,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeatmapDataModel implements HeatmapDataModel {
  const _HeatmapDataModel({required this.date, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.value});
  factory _HeatmapDataModel.fromJson(Map<String, dynamic> json) => _$HeatmapDataModelFromJson(json);

@override final  DateTime date;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int value;

/// Create a copy of HeatmapDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeatmapDataModelCopyWith<_HeatmapDataModel> get copyWith => __$HeatmapDataModelCopyWithImpl<_HeatmapDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeatmapDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeatmapDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'HeatmapDataModel(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class _$HeatmapDataModelCopyWith<$Res> implements $HeatmapDataModelCopyWith<$Res> {
  factory _$HeatmapDataModelCopyWith(_HeatmapDataModel value, $Res Function(_HeatmapDataModel) _then) = __$HeatmapDataModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int value
});




}
/// @nodoc
class __$HeatmapDataModelCopyWithImpl<$Res>
    implements _$HeatmapDataModelCopyWith<$Res> {
  __$HeatmapDataModelCopyWithImpl(this._self, this._then);

  final _HeatmapDataModel _self;
  final $Res Function(_HeatmapDataModel) _then;

/// Create a copy of HeatmapDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = null,}) {
  return _then(_HeatmapDataModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
