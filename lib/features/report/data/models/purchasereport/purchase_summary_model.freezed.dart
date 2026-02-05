// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseSummaryModel {

@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalSales;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get totalQuantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalTax;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalDiscount;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get transactionCount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get averageTransactionValue;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalPaid;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalUnpaid;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get overdue;
/// Create a copy of PurchaseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseSummaryModelCopyWith<PurchaseSummaryModel> get copyWith => _$PurchaseSummaryModelCopyWithImpl<PurchaseSummaryModel>(this as PurchaseSummaryModel, _$identity);

  /// Serializes this PurchaseSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseSummaryModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalDiscount, totalDiscount) || other.totalDiscount == totalDiscount)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalQuantity,totalTax,totalDiscount,transactionCount,averageTransactionValue,totalAmount,totalPaid,totalUnpaid,overdue);

@override
String toString() {
  return 'PurchaseSummaryModel(totalSales: $totalSales, totalQuantity: $totalQuantity, totalTax: $totalTax, totalDiscount: $totalDiscount, transactionCount: $transactionCount, averageTransactionValue: $averageTransactionValue, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class $PurchaseSummaryModelCopyWith<$Res>  {
  factory $PurchaseSummaryModelCopyWith(PurchaseSummaryModel value, $Res Function(PurchaseSummaryModel) _then) = _$PurchaseSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalSales,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalQuantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalTax,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalDiscount,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int transactionCount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double averageTransactionValue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalUnpaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double overdue
});




}
/// @nodoc
class _$PurchaseSummaryModelCopyWithImpl<$Res>
    implements $PurchaseSummaryModelCopyWith<$Res> {
  _$PurchaseSummaryModelCopyWithImpl(this._self, this._then);

  final PurchaseSummaryModel _self;
  final $Res Function(PurchaseSummaryModel) _then;

/// Create a copy of PurchaseSummaryModel
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


/// Adds pattern-matching-related methods to [PurchaseSummaryModel].
extension PurchaseSummaryModelPatterns on PurchaseSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalQuantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalDiscount, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int transactionCount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageTransactionValue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double overdue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalQuantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalDiscount, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int transactionCount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageTransactionValue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double overdue)  $default,) {final _that = this;
switch (_that) {
case _PurchaseSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalQuantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalDiscount, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int transactionCount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageTransactionValue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double overdue)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseSummaryModel() when $default != null:
return $default(_that.totalSales,_that.totalQuantity,_that.totalTax,_that.totalDiscount,_that.transactionCount,_that.averageTransactionValue,_that.totalAmount,_that.totalPaid,_that.totalUnpaid,_that.overdue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseSummaryModel implements PurchaseSummaryModel {
  const _PurchaseSummaryModel({@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalSales, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.totalQuantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalDiscount, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.transactionCount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.averageTransactionValue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalPaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalUnpaid, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.overdue});
  factory _PurchaseSummaryModel.fromJson(Map<String, dynamic> json) => _$PurchaseSummaryModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalSales;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int totalQuantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalTax;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalDiscount;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int transactionCount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double averageTransactionValue;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalPaid;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalUnpaid;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double overdue;

/// Create a copy of PurchaseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseSummaryModelCopyWith<_PurchaseSummaryModel> get copyWith => __$PurchaseSummaryModelCopyWithImpl<_PurchaseSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseSummaryModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalDiscount, totalDiscount) || other.totalDiscount == totalDiscount)&&(identical(other.transactionCount, transactionCount) || other.transactionCount == transactionCount)&&(identical(other.averageTransactionValue, averageTransactionValue) || other.averageTransactionValue == averageTransactionValue)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalUnpaid, totalUnpaid) || other.totalUnpaid == totalUnpaid)&&(identical(other.overdue, overdue) || other.overdue == overdue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalQuantity,totalTax,totalDiscount,transactionCount,averageTransactionValue,totalAmount,totalPaid,totalUnpaid,overdue);

@override
String toString() {
  return 'PurchaseSummaryModel(totalSales: $totalSales, totalQuantity: $totalQuantity, totalTax: $totalTax, totalDiscount: $totalDiscount, transactionCount: $transactionCount, averageTransactionValue: $averageTransactionValue, totalAmount: $totalAmount, totalPaid: $totalPaid, totalUnpaid: $totalUnpaid, overdue: $overdue)';
}


}

/// @nodoc
abstract mixin class _$PurchaseSummaryModelCopyWith<$Res> implements $PurchaseSummaryModelCopyWith<$Res> {
  factory _$PurchaseSummaryModelCopyWith(_PurchaseSummaryModel value, $Res Function(_PurchaseSummaryModel) _then) = __$PurchaseSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalSales,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalQuantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalTax,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalDiscount,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int transactionCount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double averageTransactionValue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalUnpaid,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double overdue
});




}
/// @nodoc
class __$PurchaseSummaryModelCopyWithImpl<$Res>
    implements _$PurchaseSummaryModelCopyWith<$Res> {
  __$PurchaseSummaryModelCopyWithImpl(this._self, this._then);

  final _PurchaseSummaryModel _self;
  final $Res Function(_PurchaseSummaryModel) _then;

/// Create a copy of PurchaseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalQuantity = null,Object? totalTax = null,Object? totalDiscount = null,Object? transactionCount = null,Object? averageTransactionValue = null,Object? totalAmount = null,Object? totalPaid = null,Object? totalUnpaid = null,Object? overdue = null,}) {
  return _then(_PurchaseSummaryModel(
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
