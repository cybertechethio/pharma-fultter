// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartCustomerModel {

@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get firstTime;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get returning;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get firstTimePercentage;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get returningPercentage;
/// Create a copy of ChartCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartCustomerModelCopyWith<ChartCustomerModel> get copyWith => _$ChartCustomerModelCopyWithImpl<ChartCustomerModel>(this as ChartCustomerModel, _$identity);

  /// Serializes this ChartCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartCustomerModel&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.returning, returning) || other.returning == returning)&&(identical(other.firstTimePercentage, firstTimePercentage) || other.firstTimePercentage == firstTimePercentage)&&(identical(other.returningPercentage, returningPercentage) || other.returningPercentage == returningPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstTime,returning,firstTimePercentage,returningPercentage);

@override
String toString() {
  return 'ChartCustomerModel(firstTime: $firstTime, returning: $returning, firstTimePercentage: $firstTimePercentage, returningPercentage: $returningPercentage)';
}


}

/// @nodoc
abstract mixin class $ChartCustomerModelCopyWith<$Res>  {
  factory $ChartCustomerModelCopyWith(ChartCustomerModel value, $Res Function(ChartCustomerModel) _then) = _$ChartCustomerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double firstTime,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double returning,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double firstTimePercentage,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double returningPercentage
});




}
/// @nodoc
class _$ChartCustomerModelCopyWithImpl<$Res>
    implements $ChartCustomerModelCopyWith<$Res> {
  _$ChartCustomerModelCopyWithImpl(this._self, this._then);

  final ChartCustomerModel _self;
  final $Res Function(ChartCustomerModel) _then;

/// Create a copy of ChartCustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstTime = null,Object? returning = null,Object? firstTimePercentage = null,Object? returningPercentage = null,}) {
  return _then(_self.copyWith(
firstTime: null == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as double,returning: null == returning ? _self.returning : returning // ignore: cast_nullable_to_non_nullable
as double,firstTimePercentage: null == firstTimePercentage ? _self.firstTimePercentage : firstTimePercentage // ignore: cast_nullable_to_non_nullable
as double,returningPercentage: null == returningPercentage ? _self.returningPercentage : returningPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartCustomerModel].
extension ChartCustomerModelPatterns on ChartCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTime, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returning, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTimePercentage, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returningPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartCustomerModel() when $default != null:
return $default(_that.firstTime,_that.returning,_that.firstTimePercentage,_that.returningPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTime, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returning, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTimePercentage, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returningPercentage)  $default,) {final _that = this;
switch (_that) {
case _ChartCustomerModel():
return $default(_that.firstTime,_that.returning,_that.firstTimePercentage,_that.returningPercentage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTime, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returning, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double firstTimePercentage, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double returningPercentage)?  $default,) {final _that = this;
switch (_that) {
case _ChartCustomerModel() when $default != null:
return $default(_that.firstTime,_that.returning,_that.firstTimePercentage,_that.returningPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartCustomerModel implements ChartCustomerModel {
  const _ChartCustomerModel({@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.firstTime, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.returning, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.firstTimePercentage, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.returningPercentage});
  factory _ChartCustomerModel.fromJson(Map<String, dynamic> json) => _$ChartCustomerModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double firstTime;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double returning;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double firstTimePercentage;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double returningPercentage;

/// Create a copy of ChartCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartCustomerModelCopyWith<_ChartCustomerModel> get copyWith => __$ChartCustomerModelCopyWithImpl<_ChartCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartCustomerModel&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.returning, returning) || other.returning == returning)&&(identical(other.firstTimePercentage, firstTimePercentage) || other.firstTimePercentage == firstTimePercentage)&&(identical(other.returningPercentage, returningPercentage) || other.returningPercentage == returningPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstTime,returning,firstTimePercentage,returningPercentage);

@override
String toString() {
  return 'ChartCustomerModel(firstTime: $firstTime, returning: $returning, firstTimePercentage: $firstTimePercentage, returningPercentage: $returningPercentage)';
}


}

/// @nodoc
abstract mixin class _$ChartCustomerModelCopyWith<$Res> implements $ChartCustomerModelCopyWith<$Res> {
  factory _$ChartCustomerModelCopyWith(_ChartCustomerModel value, $Res Function(_ChartCustomerModel) _then) = __$ChartCustomerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double firstTime,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double returning,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double firstTimePercentage,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double returningPercentage
});




}
/// @nodoc
class __$ChartCustomerModelCopyWithImpl<$Res>
    implements _$ChartCustomerModelCopyWith<$Res> {
  __$ChartCustomerModelCopyWithImpl(this._self, this._then);

  final _ChartCustomerModel _self;
  final $Res Function(_ChartCustomerModel) _then;

/// Create a copy of ChartCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstTime = null,Object? returning = null,Object? firstTimePercentage = null,Object? returningPercentage = null,}) {
  return _then(_ChartCustomerModel(
firstTime: null == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as double,returning: null == returning ? _self.returning : returning // ignore: cast_nullable_to_non_nullable
as double,firstTimePercentage: null == firstTimePercentage ? _self.firstTimePercentage : firstTimePercentage // ignore: cast_nullable_to_non_nullable
as double,returningPercentage: null == returningPercentage ? _self.returningPercentage : returningPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
