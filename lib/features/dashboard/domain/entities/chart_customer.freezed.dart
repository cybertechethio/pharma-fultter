// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChartCustomer {

 double get firstTime; double get returning; double get firstTimePercentage; double get returningPercentage;
/// Create a copy of ChartCustomer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartCustomerCopyWith<ChartCustomer> get copyWith => _$ChartCustomerCopyWithImpl<ChartCustomer>(this as ChartCustomer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartCustomer&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.returning, returning) || other.returning == returning)&&(identical(other.firstTimePercentage, firstTimePercentage) || other.firstTimePercentage == firstTimePercentage)&&(identical(other.returningPercentage, returningPercentage) || other.returningPercentage == returningPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,firstTime,returning,firstTimePercentage,returningPercentage);

@override
String toString() {
  return 'ChartCustomer(firstTime: $firstTime, returning: $returning, firstTimePercentage: $firstTimePercentage, returningPercentage: $returningPercentage)';
}


}

/// @nodoc
abstract mixin class $ChartCustomerCopyWith<$Res>  {
  factory $ChartCustomerCopyWith(ChartCustomer value, $Res Function(ChartCustomer) _then) = _$ChartCustomerCopyWithImpl;
@useResult
$Res call({
 double firstTime, double returning, double firstTimePercentage, double returningPercentage
});




}
/// @nodoc
class _$ChartCustomerCopyWithImpl<$Res>
    implements $ChartCustomerCopyWith<$Res> {
  _$ChartCustomerCopyWithImpl(this._self, this._then);

  final ChartCustomer _self;
  final $Res Function(ChartCustomer) _then;

/// Create a copy of ChartCustomer
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


/// Adds pattern-matching-related methods to [ChartCustomer].
extension ChartCustomerPatterns on ChartCustomer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartCustomer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartCustomer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartCustomer value)  $default,){
final _that = this;
switch (_that) {
case _ChartCustomer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartCustomer value)?  $default,){
final _that = this;
switch (_that) {
case _ChartCustomer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double firstTime,  double returning,  double firstTimePercentage,  double returningPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartCustomer() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double firstTime,  double returning,  double firstTimePercentage,  double returningPercentage)  $default,) {final _that = this;
switch (_that) {
case _ChartCustomer():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double firstTime,  double returning,  double firstTimePercentage,  double returningPercentage)?  $default,) {final _that = this;
switch (_that) {
case _ChartCustomer() when $default != null:
return $default(_that.firstTime,_that.returning,_that.firstTimePercentage,_that.returningPercentage);case _:
  return null;

}
}

}

/// @nodoc


class _ChartCustomer implements ChartCustomer {
  const _ChartCustomer({required this.firstTime, required this.returning, required this.firstTimePercentage, required this.returningPercentage});
  

@override final  double firstTime;
@override final  double returning;
@override final  double firstTimePercentage;
@override final  double returningPercentage;

/// Create a copy of ChartCustomer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartCustomerCopyWith<_ChartCustomer> get copyWith => __$ChartCustomerCopyWithImpl<_ChartCustomer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartCustomer&&(identical(other.firstTime, firstTime) || other.firstTime == firstTime)&&(identical(other.returning, returning) || other.returning == returning)&&(identical(other.firstTimePercentage, firstTimePercentage) || other.firstTimePercentage == firstTimePercentage)&&(identical(other.returningPercentage, returningPercentage) || other.returningPercentage == returningPercentage));
}


@override
int get hashCode => Object.hash(runtimeType,firstTime,returning,firstTimePercentage,returningPercentage);

@override
String toString() {
  return 'ChartCustomer(firstTime: $firstTime, returning: $returning, firstTimePercentage: $firstTimePercentage, returningPercentage: $returningPercentage)';
}


}

/// @nodoc
abstract mixin class _$ChartCustomerCopyWith<$Res> implements $ChartCustomerCopyWith<$Res> {
  factory _$ChartCustomerCopyWith(_ChartCustomer value, $Res Function(_ChartCustomer) _then) = __$ChartCustomerCopyWithImpl;
@override @useResult
$Res call({
 double firstTime, double returning, double firstTimePercentage, double returningPercentage
});




}
/// @nodoc
class __$ChartCustomerCopyWithImpl<$Res>
    implements _$ChartCustomerCopyWith<$Res> {
  __$ChartCustomerCopyWithImpl(this._self, this._then);

  final _ChartCustomer _self;
  final $Res Function(_ChartCustomer) _then;

/// Create a copy of ChartCustomer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstTime = null,Object? returning = null,Object? firstTimePercentage = null,Object? returningPercentage = null,}) {
  return _then(_ChartCustomer(
firstTime: null == firstTime ? _self.firstTime : firstTime // ignore: cast_nullable_to_non_nullable
as double,returning: null == returning ? _self.returning : returning // ignore: cast_nullable_to_non_nullable
as double,firstTimePercentage: null == firstTimePercentage ? _self.firstTimePercentage : firstTimePercentage // ignore: cast_nullable_to_non_nullable
as double,returningPercentage: null == returningPercentage ? _self.returningPercentage : returningPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
