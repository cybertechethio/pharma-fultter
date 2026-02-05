// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_months.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualMonths {

 List<AnnualMonthData> get months;
/// Create a copy of AnnualMonths
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualMonthsCopyWith<AnnualMonths> get copyWith => _$AnnualMonthsCopyWithImpl<AnnualMonths>(this as AnnualMonths, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualMonths&&const DeepCollectionEquality().equals(other.months, months));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(months));

@override
String toString() {
  return 'AnnualMonths(months: $months)';
}


}

/// @nodoc
abstract mixin class $AnnualMonthsCopyWith<$Res>  {
  factory $AnnualMonthsCopyWith(AnnualMonths value, $Res Function(AnnualMonths) _then) = _$AnnualMonthsCopyWithImpl;
@useResult
$Res call({
 List<AnnualMonthData> months
});




}
/// @nodoc
class _$AnnualMonthsCopyWithImpl<$Res>
    implements $AnnualMonthsCopyWith<$Res> {
  _$AnnualMonthsCopyWithImpl(this._self, this._then);

  final AnnualMonths _self;
  final $Res Function(AnnualMonths) _then;

/// Create a copy of AnnualMonths
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? months = null,}) {
  return _then(_self.copyWith(
months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as List<AnnualMonthData>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnualMonths].
extension AnnualMonthsPatterns on AnnualMonths {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualMonths value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualMonths() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualMonths value)  $default,){
final _that = this;
switch (_that) {
case _AnnualMonths():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualMonths value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualMonths() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AnnualMonthData> months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualMonths() when $default != null:
return $default(_that.months);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AnnualMonthData> months)  $default,) {final _that = this;
switch (_that) {
case _AnnualMonths():
return $default(_that.months);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AnnualMonthData> months)?  $default,) {final _that = this;
switch (_that) {
case _AnnualMonths() when $default != null:
return $default(_that.months);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualMonths implements AnnualMonths {
  const _AnnualMonths({required final  List<AnnualMonthData> months}): _months = months;
  

 final  List<AnnualMonthData> _months;
@override List<AnnualMonthData> get months {
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_months);
}


/// Create a copy of AnnualMonths
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualMonthsCopyWith<_AnnualMonths> get copyWith => __$AnnualMonthsCopyWithImpl<_AnnualMonths>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualMonths&&const DeepCollectionEquality().equals(other._months, _months));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'AnnualMonths(months: $months)';
}


}

/// @nodoc
abstract mixin class _$AnnualMonthsCopyWith<$Res> implements $AnnualMonthsCopyWith<$Res> {
  factory _$AnnualMonthsCopyWith(_AnnualMonths value, $Res Function(_AnnualMonths) _then) = __$AnnualMonthsCopyWithImpl;
@override @useResult
$Res call({
 List<AnnualMonthData> months
});




}
/// @nodoc
class __$AnnualMonthsCopyWithImpl<$Res>
    implements _$AnnualMonthsCopyWith<$Res> {
  __$AnnualMonthsCopyWithImpl(this._self, this._then);

  final _AnnualMonths _self;
  final $Res Function(_AnnualMonths) _then;

/// Create a copy of AnnualMonths
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? months = null,}) {
  return _then(_AnnualMonths(
months: null == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<AnnualMonthData>,
  ));
}


}

// dart format on
