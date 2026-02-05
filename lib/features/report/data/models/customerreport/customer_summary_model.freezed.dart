// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerSummaryModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get totalCustomers;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get totalOrders;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalPaid;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalUnpaid;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalToPayCustomers;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalCustomersOweUs;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get netBalance;
/// Create a copy of CustomerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSummaryModelCopyWith<CustomerSummaryModel> get copyWith => _$CustomerSummaryModelCopyWithImpl<CustomerSummaryModel>(this as CustomerSummaryModel, _$identity);

  /// Serializes this CustomerSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSummaryModel&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.totalToPayCustomers, totalToPayCustomers) || other.totalToPayCustomers == totalToPayCustomers)&&(identical(other.totalCustomersOweUs, totalCustomersOweUs) || other.totalCustomersOweUs == totalCustomersOweUs)&&(identical(other.netBalance, netBalance) || other.netBalance == netBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCustomers,totalOrders,totalAmount,totalPaid,totalUnpaid,totalToPayCustomers,totalCustomersOweUs,netBalance);

@override
String toString() {
  return 'CustomerSummaryModel(totalCustomers: $totalCustomers, totalOrders: $totalOrders, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, totalToPayCustomers: $totalToPayCustomers, totalCustomersOweUs: $totalCustomersOweUs, netBalance: $netBalance)';
}


}

/// @nodoc
abstract mixin class $CustomerSummaryModelCopyWith<$Res>  {
  factory $CustomerSummaryModelCopyWith(CustomerSummaryModel value, $Res Function(CustomerSummaryModel) _then) = _$CustomerSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalCustomers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalOrders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalUnpaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalToPayCustomers,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalCustomersOweUs,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double netBalance
});




}
/// @nodoc
class _$CustomerSummaryModelCopyWithImpl<$Res>
    implements $CustomerSummaryModelCopyWith<$Res> {
  _$CustomerSummaryModelCopyWithImpl(this._self, this._then);

  final CustomerSummaryModel _self;
  final $Res Function(CustomerSummaryModel) _then;

/// Create a copy of CustomerSummaryModel
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


/// Adds pattern-matching-related methods to [CustomerSummaryModel].
extension CustomerSummaryModelPatterns on CustomerSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalCustomers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalToPayCustomers, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalCustomersOweUs, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalCustomers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalToPayCustomers, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalCustomersOweUs, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netBalance)  $default,) {final _that = this;
switch (_that) {
case _CustomerSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalCustomers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalToPayCustomers, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalCustomersOweUs, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double netBalance)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSummaryModel() when $default != null:
return $default(_that.totalCustomers,_that.totalOrders,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.totalToPayCustomers,_that.totalCustomersOweUs,_that.netBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSummaryModel implements CustomerSummaryModel {
  const _CustomerSummaryModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.totalCustomers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalToPayCustomers, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalCustomersOweUs, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.netBalance});
  factory _CustomerSummaryModel.fromJson(Map<String, dynamic> json) => _$CustomerSummaryModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int totalCustomers;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int totalOrders;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalPaid;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalUnpaid;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalToPayCustomers;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalCustomersOweUs;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double netBalance;

/// Create a copy of CustomerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSummaryModelCopyWith<_CustomerSummaryModel> get copyWith => __$CustomerSummaryModelCopyWithImpl<_CustomerSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSummaryModel&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.totalToPayCustomers, totalToPayCustomers) || other.totalToPayCustomers == totalToPayCustomers)&&(identical(other.totalCustomersOweUs, totalCustomersOweUs) || other.totalCustomersOweUs == totalCustomersOweUs)&&(identical(other.netBalance, netBalance) || other.netBalance == netBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCustomers,totalOrders,totalAmount,totalPaid,totalUnpaid,totalToPayCustomers,totalCustomersOweUs,netBalance);

@override
String toString() {
  return 'CustomerSummaryModel(totalCustomers: $totalCustomers, totalOrders: $totalOrders, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, totalToPayCustomers: $totalToPayCustomers, totalCustomersOweUs: $totalCustomersOweUs, netBalance: $netBalance)';
}


}

/// @nodoc
abstract mixin class _$CustomerSummaryModelCopyWith<$Res> implements $CustomerSummaryModelCopyWith<$Res> {
  factory _$CustomerSummaryModelCopyWith(_CustomerSummaryModel value, $Res Function(_CustomerSummaryModel) _then) = __$CustomerSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalCustomers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalOrders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalUnpaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalToPayCustomers,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalCustomersOweUs,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double netBalance
});




}
/// @nodoc
class __$CustomerSummaryModelCopyWithImpl<$Res>
    implements _$CustomerSummaryModelCopyWith<$Res> {
  __$CustomerSummaryModelCopyWithImpl(this._self, this._then);

  final _CustomerSummaryModel _self;
  final $Res Function(_CustomerSummaryModel) _then;

/// Create a copy of CustomerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCustomers = null,Object? totalOrders = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? totalToPayCustomers = null,Object? totalCustomersOweUs = null,Object? netBalance = null,}) {
  return _then(_CustomerSummaryModel(
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
