// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerSummary {

 int get totalCustomers; int get totalOrders; double get totalAmount; double get totalPaid; double get totalUnpaid; double get totalToPayCustomers; double get totalCustomersOweUs; double get netBalance;
/// Create a copy of CustomerSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSummaryCopyWith<CustomerSummary> get copyWith => _$CustomerSummaryCopyWithImpl<CustomerSummary>(this as CustomerSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSummary&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.totalToPayCustomers, totalToPayCustomers) || other.totalToPayCustomers == totalToPayCustomers)&&(identical(other.totalCustomersOweUs, totalCustomersOweUs) || other.totalCustomersOweUs == totalCustomersOweUs)&&(identical(other.netBalance, netBalance) || other.netBalance == netBalance));
}


@override
int get hashCode => Object.hash(runtimeType,totalCustomers,totalOrders,totalAmount,totalPaid,totalUnpaid,totalToPayCustomers,totalCustomersOweUs,netBalance);

@override
String toString() {
  return 'CustomerSummary(totalCustomers: $totalCustomers, totalOrders: $totalOrders, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, totalToPayCustomers: $totalToPayCustomers, totalCustomersOweUs: $totalCustomersOweUs, netBalance: $netBalance)';
}


}

/// @nodoc
abstract mixin class $CustomerSummaryCopyWith<$Res>  {
  factory $CustomerSummaryCopyWith(CustomerSummary value, $Res Function(CustomerSummary) _then) = _$CustomerSummaryCopyWithImpl;
@useResult
$Res call({
 int totalCustomers, int totalOrders, double totalAmount, double totalPaid, double totalUnpaid, double totalToPayCustomers, double totalCustomersOweUs, double netBalance
});




}
/// @nodoc
class _$CustomerSummaryCopyWithImpl<$Res>
    implements $CustomerSummaryCopyWith<$Res> {
  _$CustomerSummaryCopyWithImpl(this._self, this._then);

  final CustomerSummary _self;
  final $Res Function(CustomerSummary) _then;

/// Create a copy of CustomerSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCustomers = null,Object? totalOrders = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? totalToPayCustomers = null,Object? totalCustomersOweUs = null,Object? netBalance = null,}) {
  return _then(_self.copyWith(
totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalUnpaid: null == totalUnpaid ? _self.totalUnpaid : totalUnpaid // ignore: cast_nullable_to_non_nullable
as double,totalToPayCustomers: null == totalToPayCustomers ? _self.totalToPayCustomers : totalToPayCustomers // ignore: cast_nullable_to_non_nullable
as double,totalCustomersOweUs: null == totalCustomersOweUs ? _self.totalCustomersOweUs : totalCustomersOweUs // ignore: cast_nullable_to_non_nullable
as double,netBalance: null == netBalance ? _self.netBalance : netBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerSummary].
extension CustomerSummaryPatterns on CustomerSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSummary value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalCustomers,  int totalOrders,  double totalAmount,  double totalPaid,  double totalUnpaid,  double totalToPayCustomers,  double totalCustomersOweUs,  double netBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSummary() when $default != null:
return $default(_that.totalCustomers,_that.totalOrders,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.totalToPayCustomers,_that.totalCustomersOweUs,_that.netBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalCustomers,  int totalOrders,  double totalAmount,  double totalPaid,  double totalUnpaid,  double totalToPayCustomers,  double totalCustomersOweUs,  double netBalance)  $default,) {final _that = this;
switch (_that) {
case _CustomerSummary():
return $default(_that.totalCustomers,_that.totalOrders,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.totalToPayCustomers,_that.totalCustomersOweUs,_that.netBalance);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalCustomers,  int totalOrders,  double totalAmount,  double totalPaid,  double totalUnpaid,  double totalToPayCustomers,  double totalCustomersOweUs,  double netBalance)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSummary() when $default != null:
return $default(_that.totalCustomers,_that.totalOrders,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.totalToPayCustomers,_that.totalCustomersOweUs,_that.netBalance);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerSummary implements CustomerSummary {
  const _CustomerSummary({required this.totalCustomers, required this.totalOrders, required this.totalAmount, required this.totalPaid, required this.totalUnpaid, required this.totalToPayCustomers, required this.totalCustomersOweUs, required this.netBalance});
  

@override final  int totalCustomers;
@override final  int totalOrders;
@override final  double totalAmount;
@override final  double totalPaid;
@override final  double totalUnpaid;
@override final  double totalToPayCustomers;
@override final  double totalCustomersOweUs;
@override final  double netBalance;

/// Create a copy of CustomerSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSummaryCopyWith<_CustomerSummary> get copyWith => __$CustomerSummaryCopyWithImpl<_CustomerSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSummary&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.totalToPayCustomers, totalToPayCustomers) || other.totalToPayCustomers == totalToPayCustomers)&&(identical(other.totalCustomersOweUs, totalCustomersOweUs) || other.totalCustomersOweUs == totalCustomersOweUs)&&(identical(other.netBalance, netBalance) || other.netBalance == netBalance));
}


@override
int get hashCode => Object.hash(runtimeType,totalCustomers,totalOrders,totalAmount,totalPaid,totalUnpaid,totalToPayCustomers,totalCustomersOweUs,netBalance);

@override
String toString() {
  return 'CustomerSummary(totalCustomers: $totalCustomers, totalOrders: $totalOrders, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, totalToPayCustomers: $totalToPayCustomers, totalCustomersOweUs: $totalCustomersOweUs, netBalance: $netBalance)';
}


}

/// @nodoc
abstract mixin class _$CustomerSummaryCopyWith<$Res> implements $CustomerSummaryCopyWith<$Res> {
  factory _$CustomerSummaryCopyWith(_CustomerSummary value, $Res Function(_CustomerSummary) _then) = __$CustomerSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalCustomers, int totalOrders, double totalAmount, double totalPaid, double totalUnpaid, double totalToPayCustomers, double totalCustomersOweUs, double netBalance
});




}
/// @nodoc
class __$CustomerSummaryCopyWithImpl<$Res>
    implements _$CustomerSummaryCopyWith<$Res> {
  __$CustomerSummaryCopyWithImpl(this._self, this._then);

  final _CustomerSummary _self;
  final $Res Function(_CustomerSummary) _then;

/// Create a copy of CustomerSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCustomers = null,Object? totalOrders = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? totalToPayCustomers = null,Object? totalCustomersOweUs = null,Object? netBalance = null,}) {
  return _then(_CustomerSummary(
totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalUnpaid: null == totalUnpaid ? _self.totalUnpaid : totalUnpaid // ignore: cast_nullable_to_non_nullable
as double,totalToPayCustomers: null == totalToPayCustomers ? _self.totalToPayCustomers : totalToPayCustomers // ignore: cast_nullable_to_non_nullable
as double,totalCustomersOweUs: null == totalCustomersOweUs ? _self.totalCustomersOweUs : totalCustomersOweUs // ignore: cast_nullable_to_non_nullable
as double,netBalance: null == netBalance ? _self.netBalance : netBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
