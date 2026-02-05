// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_report_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualReportDetails {

 DateTime get startDate; DateTime get endDate; List<AnnualItemData> get items; AnnualTotals get totals; double get expenses; double get netProfit;
/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualReportDetailsCopyWith<AnnualReportDetails> get copyWith => _$AnnualReportDetailsCopyWithImpl<AnnualReportDetails>(this as AnnualReportDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualReportDetails&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(items),totals,expenses,netProfit);

@override
String toString() {
  return 'AnnualReportDetails(startDate: $startDate, endDate: $endDate, items: $items, totals: $totals, expenses: $expenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualReportDetailsCopyWith<$Res>  {
  factory $AnnualReportDetailsCopyWith(AnnualReportDetails value, $Res Function(AnnualReportDetails) _then) = _$AnnualReportDetailsCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate, List<AnnualItemData> items, AnnualTotals totals, double expenses, double netProfit
});


$AnnualTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$AnnualReportDetailsCopyWithImpl<$Res>
    implements $AnnualReportDetailsCopyWith<$Res> {
  _$AnnualReportDetailsCopyWithImpl(this._self, this._then);

  final AnnualReportDetails _self;
  final $Res Function(AnnualReportDetails) _then;

/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,Object? totals = null,Object? expenses = null,Object? netProfit = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AnnualItemData>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as AnnualTotals,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualTotalsCopyWith<$Res> get totals {
  
  return $AnnualTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualReportDetails].
extension AnnualReportDetailsPatterns on AnnualReportDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualReportDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualReportDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualReportDetails value)  $default,){
final _that = this;
switch (_that) {
case _AnnualReportDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualReportDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualReportDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<AnnualItemData> items,  AnnualTotals totals,  double expenses,  double netProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualReportDetails() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items,_that.totals,_that.expenses,_that.netProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<AnnualItemData> items,  AnnualTotals totals,  double expenses,  double netProfit)  $default,) {final _that = this;
switch (_that) {
case _AnnualReportDetails():
return $default(_that.startDate,_that.endDate,_that.items,_that.totals,_that.expenses,_that.netProfit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate,  List<AnnualItemData> items,  AnnualTotals totals,  double expenses,  double netProfit)?  $default,) {final _that = this;
switch (_that) {
case _AnnualReportDetails() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items,_that.totals,_that.expenses,_that.netProfit);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualReportDetails implements AnnualReportDetails {
  const _AnnualReportDetails({required this.startDate, required this.endDate, required final  List<AnnualItemData> items, required this.totals, required this.expenses, required this.netProfit}): _items = items;
  

@override final  DateTime startDate;
@override final  DateTime endDate;
 final  List<AnnualItemData> _items;
@override List<AnnualItemData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  AnnualTotals totals;
@override final  double expenses;
@override final  double netProfit;

/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualReportDetailsCopyWith<_AnnualReportDetails> get copyWith => __$AnnualReportDetailsCopyWithImpl<_AnnualReportDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualReportDetails&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}


@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_items),totals,expenses,netProfit);

@override
String toString() {
  return 'AnnualReportDetails(startDate: $startDate, endDate: $endDate, items: $items, totals: $totals, expenses: $expenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualReportDetailsCopyWith<$Res> implements $AnnualReportDetailsCopyWith<$Res> {
  factory _$AnnualReportDetailsCopyWith(_AnnualReportDetails value, $Res Function(_AnnualReportDetails) _then) = __$AnnualReportDetailsCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate, List<AnnualItemData> items, AnnualTotals totals, double expenses, double netProfit
});


@override $AnnualTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$AnnualReportDetailsCopyWithImpl<$Res>
    implements _$AnnualReportDetailsCopyWith<$Res> {
  __$AnnualReportDetailsCopyWithImpl(this._self, this._then);

  final _AnnualReportDetails _self;
  final $Res Function(_AnnualReportDetails) _then;

/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,Object? totals = null,Object? expenses = null,Object? netProfit = null,}) {
  return _then(_AnnualReportDetails(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AnnualItemData>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as AnnualTotals,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AnnualReportDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualTotalsCopyWith<$Res> get totals {
  
  return $AnnualTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
