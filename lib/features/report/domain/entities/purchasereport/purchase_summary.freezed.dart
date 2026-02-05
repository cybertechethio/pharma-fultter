// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseSummary {

 double get totalSales; int get totalQuantity; double get totalTax; double get totalDiscount; int get transactionCount; double get averageTransactionValue; double get totalAmount; double get totalPaid; double get totalUnpaid; double get overdue;
/// Create a copy of PurchaseSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseSummaryCopyWith<PurchaseSummary> get copyWith => _$PurchaseSummaryCopyWithImpl<PurchaseSummary>(this as PurchaseSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseSummary&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalDiscount, totalDiscount) || other.totalDiscount == totalDiscount)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}


@override
int get hashCode => Object.hash(runtimeType,totalSales,totalQuantity,totalTax,totalDiscount,transactionCount,averageTransactionValue,totalAmount,totalPaid,totalUnpaid,overdue);

@override
String toString() {
  return 'PurchaseSummary(totalSales: $totalSales, totalQuantity: $totalQuantity, totalTax: $totalTax, totalDiscount: $totalDiscount, transactionCount: $transactionCount, averageTransactionValue: $averageTransactionValue, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class $PurchaseSummaryCopyWith<$Res>  {
  factory $PurchaseSummaryCopyWith(PurchaseSummary value, $Res Function(PurchaseSummary) _then) = _$PurchaseSummaryCopyWithImpl;
@useResult
$Res call({
 double totalSales, int totalQuantity, double totalTax, double totalDiscount, int transactionCount, double averageTransactionValue, double totalAmount, double totalPaid, double totalUnpaid, double overdue
});




}
/// @nodoc
class _$PurchaseSummaryCopyWithImpl<$Res>
    implements $PurchaseSummaryCopyWith<$Res> {
  _$PurchaseSummaryCopyWithImpl(this._self, this._then);

  final PurchaseSummary _self;
  final $Res Function(PurchaseSummary) _then;

/// Create a copy of PurchaseSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSales = null,Object? totalQuantity = null,Object? totalTax = null,Object? totalDiscount = null,Object? transactionCount = null,Object? averageTransactionValue = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? overdue = null,}) {
  return _then(_self.copyWith(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalDiscount: null == totalDiscount ? _self.totalDiscount : totalDiscount // ignore: cast_nullable_to_non_nullable
as double,transactionCount: null == transactionCount ? _self.transactionCount : transactionCount // ignore: cast_nullable_to_non_nullable
as int,averageTransactionValue: null == averageTransactionValue ? _self.averageTransactionValue : averageTransactionValue // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalUnpaid: null == totalUnpaid ? _self.totalUnpaid : totalUnpaid // ignore: cast_nullable_to_non_nullable
as double,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseSummary].
extension PurchaseSummaryPatterns on PurchaseSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseSummary value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSales,  int totalQuantity,  double totalTax,  double totalDiscount,  int transactionCount,  double averageTransactionValue,  double totalAmount,  double totalPaid,  double totalUnpaid,  double overdue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseSummary() when $default != null:
return $default(_that.totalSales,_that.totalQuantity,_that.totalTax,_that.totalDiscount,_that.transactionCount,_that.averageTransactionValue,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.overdue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSales,  int totalQuantity,  double totalTax,  double totalDiscount,  int transactionCount,  double averageTransactionValue,  double totalAmount,  double totalPaid,  double totalUnpaid,  double overdue)  $default,) {final _that = this;
switch (_that) {
case _PurchaseSummary():
return $default(_that.totalSales,_that.totalQuantity,_that.totalTax,_that.totalDiscount,_that.transactionCount,_that.averageTransactionValue,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.overdue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSales,  int totalQuantity,  double totalTax,  double totalDiscount,  int transactionCount,  double averageTransactionValue,  double totalAmount,  double totalPaid,  double totalUnpaid,  double overdue)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseSummary() when $default != null:
return $default(_that.totalSales,_that.totalQuantity,_that.totalTax,_that.totalDiscount,_that.transactionCount,_that.averageTransactionValue,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.overdue);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseSummary implements PurchaseSummary {
  const _PurchaseSummary({required this.totalSales, required this.totalQuantity, required this.totalTax, required this.totalDiscount, required this.transactionCount, required this.averageTransactionValue, required this.totalAmount, required this.totalPaid, required this.totalUnpaid, required this.overdue});
  

@override final  double totalSales;
@override final  int totalQuantity;
@override final  double totalTax;
@override final  double totalDiscount;
@override final  int transactionCount;
@override final  double averageTransactionValue;
@override final  double totalAmount;
@override final  double totalPaid;
@override final  double totalUnpaid;
@override final  double overdue;

/// Create a copy of PurchaseSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseSummaryCopyWith<_PurchaseSummary> get copyWith => __$PurchaseSummaryCopyWithImpl<_PurchaseSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseSummary&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalDiscount, totalDiscount) || other.totalDiscount == totalDiscount)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}


@override
int get hashCode => Object.hash(runtimeType,totalSales,totalQuantity,totalTax,totalDiscount,transactionCount,averageTransactionValue,totalAmount,totalPaid,totalUnpaid,overdue);

@override
String toString() {
  return 'PurchaseSummary(totalSales: $totalSales, totalQuantity: $totalQuantity, totalTax: $totalTax, totalDiscount: $totalDiscount, transactionCount: $transactionCount, averageTransactionValue: $averageTransactionValue, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class _$PurchaseSummaryCopyWith<$Res> implements $PurchaseSummaryCopyWith<$Res> {
  factory _$PurchaseSummaryCopyWith(_PurchaseSummary value, $Res Function(_PurchaseSummary) _then) = __$PurchaseSummaryCopyWithImpl;
@override @useResult
$Res call({
 double totalSales, int totalQuantity, double totalTax, double totalDiscount, int transactionCount, double averageTransactionValue, double totalAmount, double totalPaid, double totalUnpaid, double overdue
});




}
/// @nodoc
class __$PurchaseSummaryCopyWithImpl<$Res>
    implements _$PurchaseSummaryCopyWith<$Res> {
  __$PurchaseSummaryCopyWithImpl(this._self, this._then);

  final _PurchaseSummary _self;
  final $Res Function(_PurchaseSummary) _then;

/// Create a copy of PurchaseSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalQuantity = null,Object? totalTax = null,Object? totalDiscount = null,Object? transactionCount = null,Object? averageTransactionValue = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? overdue = null,}) {
  return _then(_PurchaseSummary(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalDiscount: null == totalDiscount ? _self.totalDiscount : totalDiscount // ignore: cast_nullable_to_non_nullable
as double,transactionCount: null == transactionCount ? _self.transactionCount : transactionCount // ignore: cast_nullable_to_non_nullable
as int,averageTransactionValue: null == averageTransactionValue ? _self.averageTransactionValue : averageTransactionValue // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalUnpaid: null == totalUnpaid ? _self.totalUnpaid : totalUnpaid // ignore: cast_nullable_to_non_nullable
as double,overdue: null == overdue ? _self.overdue : overdue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
