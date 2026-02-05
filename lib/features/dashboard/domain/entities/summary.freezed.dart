// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Summary {

 double get totalSales; double get totalSalesReturn; double get totalPurchase; double get totalPurchaseReturn; double get profit; double get invoiceDue; double get invoiceDuePercentageChange; double get totalExpenses; double get totalExpensesPercentageChange; double get totalPaymentReturns; double get totalPaymentReturnsPercentageChange;
/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCopyWith<Summary> get copyWith => _$SummaryCopyWithImpl<Summary>(this as Summary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Summary&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalSalesReturn, totalSalesReturn) || other.totalSalesReturn == totalSalesReturn)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase)&&(identical(other.totalPurchaseReturn, totalPurchaseReturn) || other.totalPurchaseReturn == totalPurchaseReturn)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.invoiceDue, invoiceDue) || other.invoiceDue == invoiceDue)&&(identical(other.invoiceDuePercentageChange, invoiceDuePercentageChange) || other.invoiceDuePercentageChange == invoiceDuePercentageChange)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalExpensesPercentageChange, totalExpensesPercentageChange) || other.totalExpensesPercentageChange == totalExpensesPercentageChange)&&(identical(other.totalPaymentReturns, totalPaymentReturns) || other.totalPaymentReturns == totalPaymentReturns)&&(identical(other.totalPaymentReturnsPercentageChange, totalPaymentReturnsPercentageChange) || other.totalPaymentReturnsPercentageChange == totalPaymentReturnsPercentageChange));
}


@override
int get hashCode => Object.hash(runtimeType,totalSales,totalSalesReturn,totalPurchase,totalPurchaseReturn,profit,invoiceDue,invoiceDuePercentageChange,totalExpenses,totalExpensesPercentageChange,totalPaymentReturns,totalPaymentReturnsPercentageChange);

@override
String toString() {
  return 'Summary(totalSales: $totalSales, totalSalesReturn: $totalSalesReturn, totalPurchase: $totalPurchase, totalPurchaseReturn: $totalPurchaseReturn, profit: $profit, invoiceDue: $invoiceDue, invoiceDuePercentageChange: $invoiceDuePercentageChange, totalExpenses: $totalExpenses, totalExpensesPercentageChange: $totalExpensesPercentageChange, totalPaymentReturns: $totalPaymentReturns, totalPaymentReturnsPercentageChange: $totalPaymentReturnsPercentageChange)';
}


}

/// @nodoc
abstract mixin class $SummaryCopyWith<$Res>  {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) _then) = _$SummaryCopyWithImpl;
@useResult
$Res call({
 double totalSales, double totalSalesReturn, double totalPurchase, double totalPurchaseReturn, double profit, double invoiceDue, double invoiceDuePercentageChange, double totalExpenses, double totalExpensesPercentageChange, double totalPaymentReturns, double totalPaymentReturnsPercentageChange
});




}
/// @nodoc
class _$SummaryCopyWithImpl<$Res>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._self, this._then);

  final Summary _self;
  final $Res Function(Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSales = null,Object? totalSalesReturn = null,Object? totalPurchase = null,Object? totalPurchaseReturn = null,Object? profit = null,Object? invoiceDue = null,Object? invoiceDuePercentageChange = null,Object? totalExpenses = null,Object? totalExpensesPercentageChange = null,Object? totalPaymentReturns = null,Object? totalPaymentReturnsPercentageChange = null,}) {
  return _then(_self.copyWith(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalSalesReturn: null == totalSalesReturn ? _self.totalSalesReturn : totalSalesReturn // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,totalPurchaseReturn: null == totalPurchaseReturn ? _self.totalPurchaseReturn : totalPurchaseReturn // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,invoiceDue: null == invoiceDue ? _self.invoiceDue : invoiceDue // ignore: cast_nullable_to_non_nullable
as double,invoiceDuePercentageChange: null == invoiceDuePercentageChange ? _self.invoiceDuePercentageChange : invoiceDuePercentageChange // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalExpensesPercentageChange: null == totalExpensesPercentageChange ? _self.totalExpensesPercentageChange : totalExpensesPercentageChange // ignore: cast_nullable_to_non_nullable
as double,totalPaymentReturns: null == totalPaymentReturns ? _self.totalPaymentReturns : totalPaymentReturns // ignore: cast_nullable_to_non_nullable
as double,totalPaymentReturnsPercentageChange: null == totalPaymentReturnsPercentageChange ? _self.totalPaymentReturnsPercentageChange : totalPaymentReturnsPercentageChange // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Summary].
extension SummaryPatterns on Summary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Summary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Summary value)  $default,){
final _that = this;
switch (_that) {
case _Summary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Summary value)?  $default,){
final _that = this;
switch (_that) {
case _Summary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSales,  double totalSalesReturn,  double totalPurchase,  double totalPurchaseReturn,  double profit,  double invoiceDue,  double invoiceDuePercentageChange,  double totalExpenses,  double totalExpensesPercentageChange,  double totalPaymentReturns,  double totalPaymentReturnsPercentageChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.totalSales,_that.totalSalesReturn,_that.totalPurchase,_that.totalPurchaseReturn,_that.profit,_that.invoiceDue,_that.invoiceDuePercentageChange,_that.totalExpenses,_that.totalExpensesPercentageChange,_that.totalPaymentReturns,_that.totalPaymentReturnsPercentageChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSales,  double totalSalesReturn,  double totalPurchase,  double totalPurchaseReturn,  double profit,  double invoiceDue,  double invoiceDuePercentageChange,  double totalExpenses,  double totalExpensesPercentageChange,  double totalPaymentReturns,  double totalPaymentReturnsPercentageChange)  $default,) {final _that = this;
switch (_that) {
case _Summary():
return $default(_that.totalSales,_that.totalSalesReturn,_that.totalPurchase,_that.totalPurchaseReturn,_that.profit,_that.invoiceDue,_that.invoiceDuePercentageChange,_that.totalExpenses,_that.totalExpensesPercentageChange,_that.totalPaymentReturns,_that.totalPaymentReturnsPercentageChange);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSales,  double totalSalesReturn,  double totalPurchase,  double totalPurchaseReturn,  double profit,  double invoiceDue,  double invoiceDuePercentageChange,  double totalExpenses,  double totalExpensesPercentageChange,  double totalPaymentReturns,  double totalPaymentReturnsPercentageChange)?  $default,) {final _that = this;
switch (_that) {
case _Summary() when $default != null:
return $default(_that.totalSales,_that.totalSalesReturn,_that.totalPurchase,_that.totalPurchaseReturn,_that.profit,_that.invoiceDue,_that.invoiceDuePercentageChange,_that.totalExpenses,_that.totalExpensesPercentageChange,_that.totalPaymentReturns,_that.totalPaymentReturnsPercentageChange);case _:
  return null;

}
}

}

/// @nodoc


class _Summary implements Summary {
  const _Summary({required this.totalSales, required this.totalSalesReturn, required this.totalPurchase, required this.totalPurchaseReturn, required this.profit, required this.invoiceDue, required this.invoiceDuePercentageChange, required this.totalExpenses, required this.totalExpensesPercentageChange, required this.totalPaymentReturns, required this.totalPaymentReturnsPercentageChange});
  

@override final  double totalSales;
@override final  double totalSalesReturn;
@override final  double totalPurchase;
@override final  double totalPurchaseReturn;
@override final  double profit;
@override final  double invoiceDue;
@override final  double invoiceDuePercentageChange;
@override final  double totalExpenses;
@override final  double totalExpensesPercentageChange;
@override final  double totalPaymentReturns;
@override final  double totalPaymentReturnsPercentageChange;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryCopyWith<_Summary> get copyWith => __$SummaryCopyWithImpl<_Summary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Summary&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalSalesReturn, totalSalesReturn) || other.totalSalesReturn == totalSalesReturn)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase)&&(identical(other.totalPurchaseReturn, totalPurchaseReturn) || other.totalPurchaseReturn == totalPurchaseReturn)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.invoiceDue, invoiceDue) || other.invoiceDue == invoiceDue)&&(identical(other.invoiceDuePercentageChange, invoiceDuePercentageChange) || other.invoiceDuePercentageChange == invoiceDuePercentageChange)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalExpensesPercentageChange, totalExpensesPercentageChange) || other.totalExpensesPercentageChange == totalExpensesPercentageChange)&&(identical(other.totalPaymentReturns, totalPaymentReturns) || other.totalPaymentReturns == totalPaymentReturns)&&(identical(other.totalPaymentReturnsPercentageChange, totalPaymentReturnsPercentageChange) || other.totalPaymentReturnsPercentageChange == totalPaymentReturnsPercentageChange));
}


@override
int get hashCode => Object.hash(runtimeType,totalSales,totalSalesReturn,totalPurchase,totalPurchaseReturn,profit,invoiceDue,invoiceDuePercentageChange,totalExpenses,totalExpensesPercentageChange,totalPaymentReturns,totalPaymentReturnsPercentageChange);

@override
String toString() {
  return 'Summary(totalSales: $totalSales, totalSalesReturn: $totalSalesReturn, totalPurchase: $totalPurchase, totalPurchaseReturn: $totalPurchaseReturn, profit: $profit, invoiceDue: $invoiceDue, invoiceDuePercentageChange: $invoiceDuePercentageChange, totalExpenses: $totalExpenses, totalExpensesPercentageChange: $totalExpensesPercentageChange, totalPaymentReturns: $totalPaymentReturns, totalPaymentReturnsPercentageChange: $totalPaymentReturnsPercentageChange)';
}


}

/// @nodoc
abstract mixin class _$SummaryCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$SummaryCopyWith(_Summary value, $Res Function(_Summary) _then) = __$SummaryCopyWithImpl;
@override @useResult
$Res call({
 double totalSales, double totalSalesReturn, double totalPurchase, double totalPurchaseReturn, double profit, double invoiceDue, double invoiceDuePercentageChange, double totalExpenses, double totalExpensesPercentageChange, double totalPaymentReturns, double totalPaymentReturnsPercentageChange
});




}
/// @nodoc
class __$SummaryCopyWithImpl<$Res>
    implements _$SummaryCopyWith<$Res> {
  __$SummaryCopyWithImpl(this._self, this._then);

  final _Summary _self;
  final $Res Function(_Summary) _then;

/// Create a copy of Summary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalSalesReturn = null,Object? totalPurchase = null,Object? totalPurchaseReturn = null,Object? profit = null,Object? invoiceDue = null,Object? invoiceDuePercentageChange = null,Object? totalExpenses = null,Object? totalExpensesPercentageChange = null,Object? totalPaymentReturns = null,Object? totalPaymentReturnsPercentageChange = null,}) {
  return _then(_Summary(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalSalesReturn: null == totalSalesReturn ? _self.totalSalesReturn : totalSalesReturn // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,totalPurchaseReturn: null == totalPurchaseReturn ? _self.totalPurchaseReturn : totalPurchaseReturn // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,invoiceDue: null == invoiceDue ? _self.invoiceDue : invoiceDue // ignore: cast_nullable_to_non_nullable
as double,invoiceDuePercentageChange: null == invoiceDuePercentageChange ? _self.invoiceDuePercentageChange : invoiceDuePercentageChange // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,totalExpensesPercentageChange: null == totalExpensesPercentageChange ? _self.totalExpensesPercentageChange : totalExpensesPercentageChange // ignore: cast_nullable_to_non_nullable
as double,totalPaymentReturns: null == totalPaymentReturns ? _self.totalPaymentReturns : totalPaymentReturns // ignore: cast_nullable_to_non_nullable
as double,totalPaymentReturnsPercentageChange: null == totalPaymentReturnsPercentageChange ? _self.totalPaymentReturnsPercentageChange : totalPaymentReturnsPercentageChange // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
