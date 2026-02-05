// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_graph_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossGraphModel {

 String get granularity; List<ProfitLossDayDataModel>? get days; List<ProfitLossWeekDataModel>? get weeks; List<ProfitLossMonthDataModel>? get months;
/// Create a copy of ProfitLossGraphModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossGraphModelCopyWith<ProfitLossGraphModel> get copyWith => _$ProfitLossGraphModelCopyWithImpl<ProfitLossGraphModel>(this as ProfitLossGraphModel, _$identity);

  /// Serializes this ProfitLossGraphModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossGraphModel&&(identical(other.granularity, granularity) || other.granularity == granularity)&&const DeepCollectionEquality().equals(other.days, days)&&const DeepCollectionEquality().equals(other.weeks, weeks)&&const DeepCollectionEquality().equals(other.months, months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,const DeepCollectionEquality().hash(days),const DeepCollectionEquality().hash(weeks),const DeepCollectionEquality().hash(months));

@override
String toString() {
  return 'ProfitLossGraphModel(granularity: $granularity, days: $days, weeks: $weeks, months: $months)';
}


}

/// @nodoc
abstract mixin class $ProfitLossGraphModelCopyWith<$Res>  {
  factory $ProfitLossGraphModelCopyWith(ProfitLossGraphModel value, $Res Function(ProfitLossGraphModel) _then) = _$ProfitLossGraphModelCopyWithImpl;
@useResult
$Res call({
 String granularity, List<ProfitLossDayDataModel>? days, List<ProfitLossWeekDataModel>? weeks, List<ProfitLossMonthDataModel>? months
});




}
/// @nodoc
class _$ProfitLossGraphModelCopyWithImpl<$Res>
    implements $ProfitLossGraphModelCopyWith<$Res> {
  _$ProfitLossGraphModelCopyWithImpl(this._self, this._then);

  final ProfitLossGraphModel _self;
  final $Res Function(ProfitLossGraphModel) _then;

/// Create a copy of ProfitLossGraphModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? granularity = null,Object? days = freezed,Object? weeks = freezed,Object? months = freezed,}) {
  return _then(_self.copyWith(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as String,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<ProfitLossDayDataModel>?,weeks: freezed == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<ProfitLossWeekDataModel>?,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as List<ProfitLossMonthDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossGraphModel].
extension ProfitLossGraphModelPatterns on ProfitLossGraphModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossGraphModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossGraphModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossGraphModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossGraphModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossGraphModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossGraphModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String granularity,  List<ProfitLossDayDataModel>? days,  List<ProfitLossWeekDataModel>? weeks,  List<ProfitLossMonthDataModel>? months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossGraphModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String granularity,  List<ProfitLossDayDataModel>? days,  List<ProfitLossWeekDataModel>? weeks,  List<ProfitLossMonthDataModel>? months)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossGraphModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String granularity,  List<ProfitLossDayDataModel>? days,  List<ProfitLossWeekDataModel>? weeks,  List<ProfitLossMonthDataModel>? months)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossGraphModel() when $default != null:
return $default(_that.granularity,_that.days,_that.weeks,_that.months);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossGraphModel implements ProfitLossGraphModel {
  const _ProfitLossGraphModel({required this.granularity, final  List<ProfitLossDayDataModel>? days, final  List<ProfitLossWeekDataModel>? weeks, final  List<ProfitLossMonthDataModel>? months}): _days = days,_weeks = weeks,_months = months;
  factory _ProfitLossGraphModel.fromJson(Map<String, dynamic> json) => _$ProfitLossGraphModelFromJson(json);

@override final  String granularity;
 final  List<ProfitLossDayDataModel>? _days;
@override List<ProfitLossDayDataModel>? get days {
  final value = _days;
  if (value == null) return null;
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProfitLossWeekDataModel>? _weeks;
@override List<ProfitLossWeekDataModel>? get weeks {
  final value = _weeks;
  if (value == null) return null;
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProfitLossMonthDataModel>? _months;
@override List<ProfitLossMonthDataModel>? get months {
  final value = _months;
  if (value == null) return null;
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProfitLossGraphModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossGraphModelCopyWith<_ProfitLossGraphModel> get copyWith => __$ProfitLossGraphModelCopyWithImpl<_ProfitLossGraphModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossGraphModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossGraphModel&&(identical(other.granularity, granularity) || other.granularity == granularity)&&const DeepCollectionEquality().equals(other._days, _days)&&const DeepCollectionEquality().equals(other._weeks, _weeks)&&const DeepCollectionEquality().equals(other._months, _months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,const DeepCollectionEquality().hash(_days),const DeepCollectionEquality().hash(_weeks),const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'ProfitLossGraphModel(granularity: $granularity, days: $days, weeks: $weeks, months: $months)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossGraphModelCopyWith<$Res> implements $ProfitLossGraphModelCopyWith<$Res> {
  factory _$ProfitLossGraphModelCopyWith(_ProfitLossGraphModel value, $Res Function(_ProfitLossGraphModel) _then) = __$ProfitLossGraphModelCopyWithImpl;
@override @useResult
$Res call({
 String granularity, List<ProfitLossDayDataModel>? days, List<ProfitLossWeekDataModel>? weeks, List<ProfitLossMonthDataModel>? months
});




}
/// @nodoc
class __$ProfitLossGraphModelCopyWithImpl<$Res>
    implements _$ProfitLossGraphModelCopyWith<$Res> {
  __$ProfitLossGraphModelCopyWithImpl(this._self, this._then);

  final _ProfitLossGraphModel _self;
  final $Res Function(_ProfitLossGraphModel) _then;

/// Create a copy of ProfitLossGraphModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? days = freezed,Object? weeks = freezed,Object? months = freezed,}) {
  return _then(_ProfitLossGraphModel(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as String,days: freezed == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<ProfitLossDayDataModel>?,weeks: freezed == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<ProfitLossWeekDataModel>?,months: freezed == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<ProfitLossMonthDataModel>?,
  ));
}


}

// dart format on
