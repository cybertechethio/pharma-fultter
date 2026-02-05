// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_report_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfitLossReportDetails {

 DateTime get date; List<ProfitLossItemData> get items; ProfitLossTotals get totals;
/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsCopyWith<ProfitLossReportDetails> get copyWith => _$ProfitLossReportDetailsCopyWithImpl<ProfitLossReportDetails>(this as ProfitLossReportDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossReportDetails&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(items),totals);

@override
String toString() {
  return 'ProfitLossReportDetails(date: $date, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class $ProfitLossReportDetailsCopyWith<$Res>  {
  factory $ProfitLossReportDetailsCopyWith(ProfitLossReportDetails value, $Res Function(ProfitLossReportDetails) _then) = _$ProfitLossReportDetailsCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<ProfitLossItemData> items, ProfitLossTotals totals
});


$ProfitLossTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$ProfitLossReportDetailsCopyWithImpl<$Res>
    implements $ProfitLossReportDetailsCopyWith<$Res> {
  _$ProfitLossReportDetailsCopyWithImpl(this._self, this._then);

  final ProfitLossReportDetails _self;
  final $Res Function(ProfitLossReportDetails) _then;

/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? items = null,Object? totals = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLossItemData>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as ProfitLossTotals,
  ));
}
/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossTotalsCopyWith<$Res> get totals {
  
  return $ProfitLossTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitLossReportDetails].
extension ProfitLossReportDetailsPatterns on ProfitLossReportDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossReportDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossReportDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossReportDetails value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossReportDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<ProfitLossItemData> items,  ProfitLossTotals totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossReportDetails() when $default != null:
return $default(_that.date,_that.items,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<ProfitLossItemData> items,  ProfitLossTotals totals)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportDetails():
return $default(_that.date,_that.items,_that.totals);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<ProfitLossItemData> items,  ProfitLossTotals totals)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportDetails() when $default != null:
return $default(_that.date,_that.items,_that.totals);case _:
  return null;

}
}

}

/// @nodoc


class _ProfitLossReportDetails implements ProfitLossReportDetails {
  const _ProfitLossReportDetails({required this.date, required final  List<ProfitLossItemData> items, required this.totals}): _items = items;
  

@override final  DateTime date;
 final  List<ProfitLossItemData> _items;
@override List<ProfitLossItemData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ProfitLossTotals totals;

/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossReportDetailsCopyWith<_ProfitLossReportDetails> get copyWith => __$ProfitLossReportDetailsCopyWithImpl<_ProfitLossReportDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossReportDetails&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_items),totals);

@override
String toString() {
  return 'ProfitLossReportDetails(date: $date, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossReportDetailsCopyWith<$Res> implements $ProfitLossReportDetailsCopyWith<$Res> {
  factory _$ProfitLossReportDetailsCopyWith(_ProfitLossReportDetails value, $Res Function(_ProfitLossReportDetails) _then) = __$ProfitLossReportDetailsCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<ProfitLossItemData> items, ProfitLossTotals totals
});


@override $ProfitLossTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$ProfitLossReportDetailsCopyWithImpl<$Res>
    implements _$ProfitLossReportDetailsCopyWith<$Res> {
  __$ProfitLossReportDetailsCopyWithImpl(this._self, this._then);

  final _ProfitLossReportDetails _self;
  final $Res Function(_ProfitLossReportDetails) _then;

/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? items = null,Object? totals = null,}) {
  return _then(_ProfitLossReportDetails(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLossItemData>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as ProfitLossTotals,
  ));
}

/// Create a copy of ProfitLossReportDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossTotalsCopyWith<$Res> get totals {
  
  return $ProfitLossTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
