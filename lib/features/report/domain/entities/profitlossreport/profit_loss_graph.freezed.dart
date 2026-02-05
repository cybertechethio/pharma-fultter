// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossGraph {

 String get granularity; List<ProfitLossDayData>? get days; List<ProfitLossWeekData>? get weeks; List<ProfitLossMonthData>? get months;
/// Create a copy of ProfitLossGraph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossGraphCopyWith<ProfitLossGraph> get copyWith => _$ProfitLossGraphCopyWithImpl<ProfitLossGraph>(this as ProfitLossGraph, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossGraph&&(identical(other.granularity, granularity) || other.granularity == granularity)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.weeks, weeks)&&const DeepCollectionEquality().equals(other.months, months));
}


@override
int get hashCode => Object.hash(runtimeType,granularity,const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(weeks),const DeepCollectionEquality().hash(months));

@override
String toString() {
  return 'ProfitLossGraph(granularity: $granularity, days: $days, weeks: $weeks, months: $months)';
}


}

/// @nodoc
abstract mixin class $ProfitLossGraphCopyWith<$Res>  {
  factory $ProfitLossGraphCopyWith(ProfitLossGraph value, $Res Function(ProfitLossGraph) _then) = _$ProfitLossGraphCopyWithImpl;
@useResult
$Res call({
 String granularity, List<ProfitLossDayData>? days, List<ProfitLossWeekData>? weeks, List<ProfitLossMonthData>? months
});




}
/// @nodoc
class _$ProfitLossGraphCopyWithImpl<$Res>
    implements $ProfitLossGraphCopyWith<$Res> {
  _$ProfitLossGraphCopyWithImpl(this._self, this._then);

  final ProfitLossGraph _self;
  final $Res Function(ProfitLossGraph) _then;

/// Create a copy of ProfitLossGraph
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? granularity = null,Object? days = freezed,Object? weeks = freezed,Object? months = freezed,}) {
  return _then(_self.copyWith(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as String,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<ProfitLossDayData>?,weeks: freezed == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<ProfitLossWeekData>?,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as List<ProfitLossMonthData>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossGraph].
extension ProfitLossGraphPatterns on ProfitLossGraph {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossGraph value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossGraph() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossGraph value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossGraph():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossGraph value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossGraph() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String granularity,  List<ProfitLossDayData>? days,  List<ProfitLossWeekData>? weeks,  List<ProfitLossMonthData>? months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossGraph() when $default != null:
return $default(_that.granularity,_that.days,_that.weeks,_that.months);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String granularity,  List<ProfitLossDayData>? days,  List<ProfitLossWeekData>? weeks,  List<ProfitLossMonthData>? months)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossGraph():
return $default(_that.granularity,_that.days,_that.weeks,_that.months);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String granularity,  List<ProfitLossDayData>? days,  List<ProfitLossWeekData>? weeks,  List<ProfitLossMonthData>? months)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossGraph() when $default != null:
return $default(_that.granularity,_that.days,_that.weeks,_that.months);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossGraph implements ProfitLossGraph {
  const _ProfitLossGraph({required this.granularity, final  List<ProfitLossDayData>? days, final  List<ProfitLossWeekData>? weeks, final  List<ProfitLossMonthData>? months}): _days = days,_weeks = weeks,_months = months;
  

@override final  String granularity;
 final  List<ProfitLossDayData>? _days;
@override List<ProfitLossDayData>? get days {
  final value = _days;
  if (value == null) return null;
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProfitLossWeekData>? _weeks;
@override List<ProfitLossWeekData>? get weeks {
  final value = _weeks;
  if (value == null) return null;
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProfitLossMonthData>? _months;
@override List<ProfitLossMonthData>? get months {
  final value = _months;
  if (value == null) return null;
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProfitLossGraph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossGraphCopyWith<_ProfitLossGraph> get copyWith => __$ProfitLossGraphCopyWithImpl<_ProfitLossGraph>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossGraph&&(identical(other.granularity, granularity) || other.granularity == granularity)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other._weeks, _weeks)&&const DeepCollectionEquality().equals(other._months, _months));
}


@override
int get hashCode => Object.hash(runtimeType,granularity,const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(_weeks),const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'ProfitLossGraph(granularity: $granularity, days: $days, weeks: $weeks, months: $months)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossGraphCopyWith<$Res> implements $ProfitLossGraphCopyWith<$Res> {
  factory _$ProfitLossGraphCopyWith(_ProfitLossGraph value, $Res Function(_ProfitLossGraph) _then) = __$ProfitLossGraphCopyWithImpl;
@override @useResult
$Res call({
 String granularity, List<ProfitLossDayData>? days, List<ProfitLossWeekData>? weeks, List<ProfitLossMonthData>? months
});




}
/// @nodoc
class __$ProfitLossGraphCopyWithImpl<$Res>
    implements _$ProfitLossGraphCopyWith<$Res> {
  __$ProfitLossGraphCopyWithImpl(this._self, this._then);

  final _ProfitLossGraph _self;
  final $Res Function(_ProfitLossGraph) _then;

/// Create a copy of ProfitLossGraph
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? days = freezed,Object? weeks = freezed,Object? months = freezed,}) {
  return _then(_ProfitLossGraph(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as String,days: freezed == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<ProfitLossDayData>?,weeks: freezed == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<ProfitLossWeekData>?,months: freezed == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<ProfitLossMonthData>?,
  ));
}


}

// dart format on
