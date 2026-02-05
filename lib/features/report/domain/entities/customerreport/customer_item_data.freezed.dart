// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerItemData {

 int get id; String get reference; String? get code; int get customerId; String get customerName; String? get customerImageUrl; int get totalOrders; double get totalAmount; double get paidAmount; double get dueAmount; bool get hasDiscrepancy;
/// Create a copy of CustomerItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerItemDataCopyWith<CustomerItemData> get copyWith => _$CustomerItemDataCopyWithImpl<CustomerItemData>(this as CustomerItemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.code, code) || other.code == code)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerImageUrl, customerImageUrl) || other.customerImageUrl == customerImageUrl)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.hasDiscrepancy, hasDiscrepancy) || other.hasDiscrepancy == hasDiscrepancy));
}


@override
int get hashCode => Object.hash(runtimeType,id,reference,code,customerId,customerName,customerImageUrl,totalOrders,totalAmount,paidAmount,dueAmount,hasDiscrepancy);

@override
String toString() {
  return 'CustomerItemData(id: $id, reference: $reference, code: $code, customerId: $customerId, customerName: $customerName, customerImageUrl: $customerImageUrl, totalOrders: $totalOrders, totalAmount: $totalAmount, paidAmount: $paidAmount, dueAmount: $dueAmount, hasDiscrepancy: $hasDiscrepancy)';
}


}

/// @nodoc
abstract mixin class $CustomerItemDataCopyWith<$Res>  {
  factory $CustomerItemDataCopyWith(CustomerItemData value, $Res Function(CustomerItemData) _then) = _$CustomerItemDataCopyWithImpl;
@useResult
$Res call({
 int id, String reference, String? code, int customerId, String customerName, String? customerImageUrl, int totalOrders, double totalAmount, double paidAmount, double dueAmount, bool hasDiscrepancy
});




}
/// @nodoc
class _$CustomerItemDataCopyWithImpl<$Res>
    implements $CustomerItemDataCopyWith<$Res> {
  _$CustomerItemDataCopyWithImpl(this._self, this._then);

  final CustomerItemData _self;
  final $Res Function(CustomerItemData) _then;

/// Create a copy of CustomerItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reference = null,Object? code = freezed,Object? customerId = null,Object? customerName = null,Object? customerImageUrl = freezed,Object? totalOrders = null,Object? totalAmount = null,Object? paidAmount = null,Object? dueAmount = null,Object? hasDiscrepancy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerImageUrl: freezed == customerImageUrl ? _self.customerImageUrl : customerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,hasDiscrepancy: null == hasDiscrepancy ? _self.hasDiscrepancy : hasDiscrepancy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerItemData].
extension CustomerItemDataPatterns on CustomerItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerItemData value)  $default,){
final _that = this;
switch (_that) {
case _CustomerItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerItemData value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String reference,  String? code,  int customerId,  String customerName,  String? customerImageUrl,  int totalOrders,  double totalAmount,  double paidAmount,  double dueAmount,  bool hasDiscrepancy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerItemData() when $default != null:
return $default(_that.id,_that.reference,_that.code,_that.customerId,_that.customerName,_that.customerImageUrl,_that.totalOrders,_that.totalAmount,_that.paidAmount,_that.dueAmount,_that.hasDiscrepancy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String reference,  String? code,  int customerId,  String customerName,  String? customerImageUrl,  int totalOrders,  double totalAmount,  double paidAmount,  double dueAmount,  bool hasDiscrepancy)  $default,) {final _that = this;
switch (_that) {
case _CustomerItemData():
return $default(_that.id,_that.reference,_that.code,_that.customerId,_that.customerName,_that.customerImageUrl,_that.totalOrders,_that.totalAmount,_that.paidAmount,_that.dueAmount,_that.hasDiscrepancy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String reference,  String? code,  int customerId,  String customerName,  String? customerImageUrl,  int totalOrders,  double totalAmount,  double paidAmount,  double dueAmount,  bool hasDiscrepancy)?  $default,) {final _that = this;
switch (_that) {
case _CustomerItemData() when $default != null:
return $default(_that.id,_that.reference,_that.code,_that.customerId,_that.customerName,_that.customerImageUrl,_that.totalOrders,_that.totalAmount,_that.paidAmount,_that.dueAmount,_that.hasDiscrepancy);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerItemData implements CustomerItemData {
  const _CustomerItemData({required this.id, required this.reference, this.code, required this.customerId, required this.customerName, this.customerImageUrl, required this.totalOrders, required this.totalAmount, required this.paidAmount, required this.dueAmount, required this.hasDiscrepancy});
  

@override final  int id;
@override final  String reference;
@override final  String? code;
@override final  int customerId;
@override final  String customerName;
@override final  String? customerImageUrl;
@override final  int totalOrders;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double dueAmount;
@override final  bool hasDiscrepancy;

/// Create a copy of CustomerItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerItemDataCopyWith<_CustomerItemData> get copyWith => __$CustomerItemDataCopyWithImpl<_CustomerItemData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.code, code) || other.code == code)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerImageUrl, customerImageUrl) || other.customerImageUrl == customerImageUrl)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.hasDiscrepancy, hasDiscrepancy) || other.hasDiscrepancy == hasDiscrepancy));
}


@override
int get hashCode => Object.hash(runtimeType,id,reference,code,customerId,customerName,customerImageUrl,totalOrders,totalAmount,paidAmount,dueAmount,hasDiscrepancy);

@override
String toString() {
  return 'CustomerItemData(id: $id, reference: $reference, code: $code, customerId: $customerId, customerName: $customerName, customerImageUrl: $customerImageUrl, totalOrders: $totalOrders, totalAmount: $totalAmount, paidAmount: $paidAmount, dueAmount: $dueAmount, hasDiscrepancy: $hasDiscrepancy)';
}


}

/// @nodoc
abstract mixin class _$CustomerItemDataCopyWith<$Res> implements $CustomerItemDataCopyWith<$Res> {
  factory _$CustomerItemDataCopyWith(_CustomerItemData value, $Res Function(_CustomerItemData) _then) = __$CustomerItemDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String reference, String? code, int customerId, String customerName, String? customerImageUrl, int totalOrders, double totalAmount, double paidAmount, double dueAmount, bool hasDiscrepancy
});




}
/// @nodoc
class __$CustomerItemDataCopyWithImpl<$Res>
    implements _$CustomerItemDataCopyWith<$Res> {
  __$CustomerItemDataCopyWithImpl(this._self, this._then);

  final _CustomerItemData _self;
  final $Res Function(_CustomerItemData) _then;

/// Create a copy of CustomerItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? code = freezed,Object? customerId = null,Object? customerName = null,Object? customerImageUrl = freezed,Object? totalOrders = null,Object? totalAmount = null,Object? paidAmount = null,Object? dueAmount = null,Object? hasDiscrepancy = null,}) {
  return _then(_CustomerItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerImageUrl: freezed == customerImageUrl ? _self.customerImageUrl : customerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,dueAmount: null == dueAmount ? _self.dueAmount : dueAmount // ignore: cast_nullable_to_non_nullable
as double,hasDiscrepancy: null == hasDiscrepancy ? _self.hasDiscrepancy : hasDiscrepancy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
