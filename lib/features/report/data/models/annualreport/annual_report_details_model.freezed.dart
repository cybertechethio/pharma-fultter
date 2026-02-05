// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_report_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualReportDetailsModel {

 DateTime get startDate; DateTime get endDate; List<AnnualItemDataModel> get items; AnnualTotalsModel get totals;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get expenses;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get netProfit;
/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualReportDetailsModelCopyWith<AnnualReportDetailsModel> get copyWith => _$AnnualReportDetailsModelCopyWithImpl<AnnualReportDetailsModel>(this as AnnualReportDetailsModel, _$identity);

  /// Serializes this AnnualReportDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualReportDetailsModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(items),totals,expenses,netProfit);

@override
String toString() {
  return 'AnnualReportDetailsModel(startDate: $startDate, endDate: $endDate, items: $items, totals: $totals, expenses: $expenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualReportDetailsModelCopyWith<$Res>  {
  factory $AnnualReportDetailsModelCopyWith(AnnualReportDetailsModel value, $Res Function(AnnualReportDetailsModel) _then) = _$AnnualReportDetailsModelCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate, List<AnnualItemDataModel> items, AnnualTotalsModel totals,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double expenses,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double netProfit
});


$AnnualTotalsModelCopyWith<$Res> get totals;

}
/// @nodoc
class _$AnnualReportDetailsModelCopyWithImpl<$Res>
    implements $AnnualReportDetailsModelCopyWith<$Res> {
  _$AnnualReportDetailsModelCopyWithImpl(this._self, this._then);

  final AnnualReportDetailsModel _self;
  final $Res Function(AnnualReportDetailsModel) _then;

/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,Object? totals = null,Object? expenses = null,Object? netProfit = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AnnualItemDataModel>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as AnnualTotalsModel,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualTotalsModelCopyWith<$Res> get totals {
  
  return $AnnualTotalsModelCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualReportDetailsModel].
extension AnnualReportDetailsModelPatterns on AnnualReportDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualReportDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualReportDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualReportDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualReportDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualReportDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualReportDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<AnnualItemDataModel> items,  AnnualTotalsModel totals, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualReportDetailsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<AnnualItemDataModel> items,  AnnualTotalsModel totals, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netProfit)  $default,) {final _that = this;
switch (_that) {
case _AnnualReportDetailsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate,  List<AnnualItemDataModel> items,  AnnualTotalsModel totals, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netProfit)?  $default,) {final _that = this;
switch (_that) {
case _AnnualReportDetailsModel() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items,_that.totals,_that.expenses,_that.netProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualReportDetailsModel implements AnnualReportDetailsModel {
  const _AnnualReportDetailsModel({required this.startDate, required this.endDate, required final  List<AnnualItemDataModel> items, required this.totals, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.expenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.netProfit}): _items = items;
  factory _AnnualReportDetailsModel.fromJson(Map<String, dynamic> json) => _$AnnualReportDetailsModelFromJson(json);

@override final  DateTime startDate;
@override final  DateTime endDate;
 final  List<AnnualItemDataModel> _items;
@override List<AnnualItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  AnnualTotalsModel totals;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double expenses;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double netProfit;

/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualReportDetailsModelCopyWith<_AnnualReportDetailsModel> get copyWith => __$AnnualReportDetailsModelCopyWithImpl<_AnnualReportDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualReportDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualReportDetailsModel&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_items),totals,expenses,netProfit);

@override
String toString() {
  return 'AnnualReportDetailsModel(startDate: $startDate, endDate: $endDate, items: $items, totals: $totals, expenses: $expenses, netProfit: $netProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualReportDetailsModelCopyWith<$Res> implements $AnnualReportDetailsModelCopyWith<$Res> {
  factory _$AnnualReportDetailsModelCopyWith(_AnnualReportDetailsModel value, $Res Function(_AnnualReportDetailsModel) _then) = __$AnnualReportDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate, List<AnnualItemDataModel> items, AnnualTotalsModel totals,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double expenses,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double netProfit
});


@override $AnnualTotalsModelCopyWith<$Res> get totals;

}
/// @nodoc
class __$AnnualReportDetailsModelCopyWithImpl<$Res>
    implements _$AnnualReportDetailsModelCopyWith<$Res> {
  __$AnnualReportDetailsModelCopyWithImpl(this._self, this._then);

  final _AnnualReportDetailsModel _self;
  final $Res Function(_AnnualReportDetailsModel) _then;

/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,Object? totals = null,Object? expenses = null,Object? netProfit = null,}) {
  return _then(_AnnualReportDetailsModel(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AnnualItemDataModel>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as AnnualTotalsModel,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,netProfit: null == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AnnualReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualTotalsModelCopyWith<$Res> get totals {
  
  return $AnnualTotalsModelCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
