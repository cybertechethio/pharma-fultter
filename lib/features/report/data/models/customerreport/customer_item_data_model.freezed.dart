// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_item_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerItemDataModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get reference; String? get code;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get customerId; String get customerName; String? get customerImageUrl;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get totalOrders;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get paidAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get dueAmount;@JsonKey(fromJson: JsonTypeConverters.boolFromDynamic) bool get hasDiscrepancy;
/// Create a copy of CustomerItemDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerItemDataModelCopyWith<CustomerItemDataModel> get copyWith => _$CustomerItemDataModelCopyWithImpl<CustomerItemDataModel>(this as CustomerItemDataModel, _$identity);

  /// Serializes this CustomerItemDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerItemDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.code, code) || other.code == code)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerImageUrl, customerImageUrl) || other.customerImageUrl == customerImageUrl)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.hasDiscrepancy, hasDiscrepancy) || other.hasDiscrepancy == hasDiscrepancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,code,customerId,customerName,customerImageUrl,totalOrders,totalAmount,paidAmount,dueAmount,hasDiscrepancy);

@override
String toString() {
  return 'CustomerItemDataModel(id: $id, reference: $reference, code: $code, customerId: $customerId, customerName: $customerName, customerImageUrl: $customerImageUrl, totalOrders: $totalOrders, totalAmount: $totalAmount, paidAmount: $paidAmount, dueAmount: $dueAmount, hasDiscrepancy: $hasDiscrepancy)';
}


}

/// @nodoc
abstract mixin class $CustomerItemDataModelCopyWith<$Res>  {
  factory $CustomerItemDataModelCopyWith(CustomerItemDataModel value, $Res Function(CustomerItemDataModel) _then) = _$CustomerItemDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String reference, String? code,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int customerId, String customerName, String? customerImageUrl,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalOrders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double paidAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double dueAmount,@JsonKey(fromJson: JsonTypeConverters.boolFromDynamic) bool hasDiscrepancy
});




}
/// @nodoc
class _$CustomerItemDataModelCopyWithImpl<$Res>
    implements $CustomerItemDataModelCopyWith<$Res> {
  _$CustomerItemDataModelCopyWithImpl(this._self, this._then);

  final CustomerItemDataModel _self;
  final $Res Function(CustomerItemDataModel) _then;

/// Create a copy of CustomerItemDataModel
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


/// Adds pattern-matching-related methods to [CustomerItemDataModel].
extension CustomerItemDataModelPatterns on CustomerItemDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerItemDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerItemDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerItemDataModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerItemDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerItemDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerItemDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String reference,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customerId,  String customerName,  String? customerImageUrl, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double dueAmount, @JsonKey(fromJson: JsonTypeConverters.boolFromDynamic)  bool hasDiscrepancy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerItemDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String reference,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customerId,  String customerName,  String? customerImageUrl, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double dueAmount, @JsonKey(fromJson: JsonTypeConverters.boolFromDynamic)  bool hasDiscrepancy)  $default,) {final _that = this;
switch (_that) {
case _CustomerItemDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String reference,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customerId,  String customerName,  String? customerImageUrl, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double dueAmount, @JsonKey(fromJson: JsonTypeConverters.boolFromDynamic)  bool hasDiscrepancy)?  $default,) {final _that = this;
switch (_that) {
case _CustomerItemDataModel() when $default != null:
return $default(_that.id,_that.reference,_that.code,_that.customerId,_that.customerName,_that.customerImageUrl,_that.totalOrders,_that.totalAmount,_that.paidAmount,_that.dueAmount,_that.hasDiscrepancy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerItemDataModel implements CustomerItemDataModel {
  const _CustomerItemDataModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.reference, this.code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.customerId, required this.customerName, this.customerImageUrl, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.totalOrders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.paidAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.dueAmount, @JsonKey(fromJson: JsonTypeConverters.boolFromDynamic) required this.hasDiscrepancy});
  factory _CustomerItemDataModel.fromJson(Map<String, dynamic> json) => _$CustomerItemDataModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String reference;
@override final  String? code;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int customerId;
@override final  String customerName;
@override final  String? customerImageUrl;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int totalOrders;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double paidAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double dueAmount;
@override@JsonKey(fromJson: JsonTypeConverters.boolFromDynamic) final  bool hasDiscrepancy;

/// Create a copy of CustomerItemDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerItemDataModelCopyWith<_CustomerItemDataModel> get copyWith => __$CustomerItemDataModelCopyWithImpl<_CustomerItemDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerItemDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerItemDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.code, code) || other.code == code)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerImageUrl, customerImageUrl) || other.customerImageUrl == customerImageUrl)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.dueAmount, dueAmount) || other.dueAmount == dueAmount)&&(identical(other.hasDiscrepancy, hasDiscrepancy) || other.hasDiscrepancy == hasDiscrepancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,code,customerId,customerName,customerImageUrl,totalOrders,totalAmount,paidAmount,dueAmount,hasDiscrepancy);

@override
String toString() {
  return 'CustomerItemDataModel(id: $id, reference: $reference, code: $code, customerId: $customerId, customerName: $customerName, customerImageUrl: $customerImageUrl, totalOrders: $totalOrders, totalAmount: $totalAmount, paidAmount: $paidAmount, dueAmount: $dueAmount, hasDiscrepancy: $hasDiscrepancy)';
}


}

/// @nodoc
abstract mixin class _$CustomerItemDataModelCopyWith<$Res> implements $CustomerItemDataModelCopyWith<$Res> {
  factory _$CustomerItemDataModelCopyWith(_CustomerItemDataModel value, $Res Function(_CustomerItemDataModel) _then) = __$CustomerItemDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String reference, String? code,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int customerId, String customerName, String? customerImageUrl,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalOrders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double paidAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double dueAmount,@JsonKey(fromJson: JsonTypeConverters.boolFromDynamic) bool hasDiscrepancy
});




}
/// @nodoc
class __$CustomerItemDataModelCopyWithImpl<$Res>
    implements _$CustomerItemDataModelCopyWith<$Res> {
  __$CustomerItemDataModelCopyWithImpl(this._self, this._then);

  final _CustomerItemDataModel _self;
  final $Res Function(_CustomerItemDataModel) _then;

/// Create a copy of CustomerItemDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reference = null,Object? code = freezed,Object? customerId = null,Object? customerName = null,Object? customerImageUrl = freezed,Object? totalOrders = null,Object? totalAmount = null,Object? paidAmount = null,Object? dueAmount = null,Object? hasDiscrepancy = null,}) {
  return _then(_CustomerItemDataModel(
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
