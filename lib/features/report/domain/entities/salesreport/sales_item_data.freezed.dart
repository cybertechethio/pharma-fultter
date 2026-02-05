// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesItemData {

 int get id; String get transactionNumber; DateTime get date; int? get customerId; String? get customerName; int get itemId; String get itemName; String? get itemCode; String? get sku; String? get category; String? get brand; String? get imageUrl; int get quantity; double get unitPrice; double? get costPrice; double get subtotal; double get taxAmount; double get totalAmount; String? get paymentMethod; int get branchId; String get branchName; int get instockQty;
/// Create a copy of SalesItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesItemDataCopyWith<SalesItemData> get copyWith => _$SalesItemDataCopyWithImpl<SalesItemData>(this as SalesItemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.instockQty, instockQty) || other.instockQty == instockQty));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,transactionNumber,date,customerId,customerName,itemId,itemName,itemCode,sku,category,brand,imageUrl,quantity,unitPrice,costPrice,subtotal,taxAmount,totalAmount,paymentMethod,branchId,branchName,instockQty]);

@override
String toString() {
  return 'SalesItemData(id: $id, transactionNumber: $transactionNumber, date: $date, customerId: $customerId, customerName: $customerName, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, sku: $sku, category: $category, brand: $brand, imageUrl: $imageUrl, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, subtotal: $subtotal, taxAmount: $taxAmount, totalAmount: $totalAmount, paymentMethod: $paymentMethod, branchId: $branchId, branchName: $branchName, instockQty: $instockQty)';
}


}

/// @nodoc
abstract mixin class $SalesItemDataCopyWith<$Res>  {
  factory $SalesItemDataCopyWith(SalesItemData value, $Res Function(SalesItemData) _then) = _$SalesItemDataCopyWithImpl;
@useResult
$Res call({
 int id, String transactionNumber, DateTime date, int? customerId, String? customerName, int itemId, String itemName, String? itemCode, String? sku, String? category, String? brand, String? imageUrl, int quantity, double unitPrice, double? costPrice, double subtotal, double taxAmount, double totalAmount, String? paymentMethod, int branchId, String branchName, int instockQty
});




}
/// @nodoc
class _$SalesItemDataCopyWithImpl<$Res>
    implements $SalesItemDataCopyWith<$Res> {
  _$SalesItemDataCopyWithImpl(this._self, this._then);

  final SalesItemData _self;
  final $Res Function(SalesItemData) _then;

/// Create a copy of SalesItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionNumber = null,Object? date = null,Object? customerId = freezed,Object? customerName = freezed,Object? itemId = null,Object? itemName = null,Object? itemCode = freezed,Object? sku = freezed,Object? category = freezed,Object? brand = freezed,Object? imageUrl = freezed,Object? quantity = null,Object? unitPrice = null,Object? costPrice = freezed,Object? subtotal = null,Object? taxAmount = null,Object? totalAmount = null,Object? paymentMethod = freezed,Object? branchId = null,Object? branchName = null,Object? instockQty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,instockQty: null == instockQty ? _self.instockQty : instockQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesItemData].
extension SalesItemDataPatterns on SalesItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesItemData value)  $default,){
final _that = this;
switch (_that) {
case _SalesItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesItemData value)?  $default,){
final _that = this;
switch (_that) {
case _SalesItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String transactionNumber,  DateTime date,  int? customerId,  String? customerName,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int quantity,  double unitPrice,  double? costPrice,  double subtotal,  double taxAmount,  double totalAmount,  String? paymentMethod,  int branchId,  String branchName,  int instockQty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesItemData() when $default != null:
return $default(_that.id,_that.transactionNumber,_that.date,_that.customerId,_that.customerName,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.quantity,_that.unitPrice,_that.costPrice,_that.subtotal,_that.taxAmount,_that.totalAmount,_that.paymentMethod,_that.branchId,_that.branchName,_that.instockQty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String transactionNumber,  DateTime date,  int? customerId,  String? customerName,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int quantity,  double unitPrice,  double? costPrice,  double subtotal,  double taxAmount,  double totalAmount,  String? paymentMethod,  int branchId,  String branchName,  int instockQty)  $default,) {final _that = this;
switch (_that) {
case _SalesItemData():
return $default(_that.id,_that.transactionNumber,_that.date,_that.customerId,_that.customerName,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.quantity,_that.unitPrice,_that.costPrice,_that.subtotal,_that.taxAmount,_that.totalAmount,_that.paymentMethod,_that.branchId,_that.branchName,_that.instockQty);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String transactionNumber,  DateTime date,  int? customerId,  String? customerName,  int itemId,  String itemName,  String? itemCode,  String? sku,  String? category,  String? brand,  String? imageUrl,  int quantity,  double unitPrice,  double? costPrice,  double subtotal,  double taxAmount,  double totalAmount,  String? paymentMethod,  int branchId,  String branchName,  int instockQty)?  $default,) {final _that = this;
switch (_that) {
case _SalesItemData() when $default != null:
return $default(_that.id,_that.transactionNumber,_that.date,_that.customerId,_that.customerName,_that.itemId,_that.itemName,_that.itemCode,_that.sku,_that.category,_that.brand,_that.imageUrl,_that.quantity,_that.unitPrice,_that.costPrice,_that.subtotal,_that.taxAmount,_that.totalAmount,_that.paymentMethod,_that.branchId,_that.branchName,_that.instockQty);case _:
  return null;

}
}

}

/// @nodoc


class _SalesItemData implements SalesItemData {
  const _SalesItemData({required this.id, required this.transactionNumber, required this.date, required this.customerId, required this.customerName, required this.itemId, required this.itemName, this.itemCode, this.sku, this.category, this.brand, this.imageUrl, required this.quantity, required this.unitPrice, this.costPrice, required this.subtotal, required this.taxAmount, required this.totalAmount, this.paymentMethod, required this.branchId, required this.branchName, required this.instockQty});
  

@override final  int id;
@override final  String transactionNumber;
@override final  DateTime date;
@override final  int? customerId;
@override final  String? customerName;
@override final  int itemId;
@override final  String itemName;
@override final  String? itemCode;
@override final  String? sku;
@override final  String? category;
@override final  String? brand;
@override final  String? imageUrl;
@override final  int quantity;
@override final  double unitPrice;
@override final  double? costPrice;
@override final  double subtotal;
@override final  double taxAmount;
@override final  double totalAmount;
@override final  String? paymentMethod;
@override final  int branchId;
@override final  String branchName;
@override final  int instockQty;

/// Create a copy of SalesItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesItemDataCopyWith<_SalesItemData> get copyWith => __$SalesItemDataCopyWithImpl<_SalesItemData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.instockQty, instockQty) || other.instockQty == instockQty));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,transactionNumber,date,customerId,customerName,itemId,itemName,itemCode,sku,category,brand,imageUrl,quantity,unitPrice,costPrice,subtotal,taxAmount,totalAmount,paymentMethod,branchId,branchName,instockQty]);

@override
String toString() {
  return 'SalesItemData(id: $id, transactionNumber: $transactionNumber, date: $date, customerId: $customerId, customerName: $customerName, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, sku: $sku, category: $category, brand: $brand, imageUrl: $imageUrl, quantity: $quantity, unitPrice: $unitPrice, costPrice: $costPrice, subtotal: $subtotal, taxAmount: $taxAmount, totalAmount: $totalAmount, paymentMethod: $paymentMethod, branchId: $branchId, branchName: $branchName, instockQty: $instockQty)';
}


}

/// @nodoc
abstract mixin class _$SalesItemDataCopyWith<$Res> implements $SalesItemDataCopyWith<$Res> {
  factory _$SalesItemDataCopyWith(_SalesItemData value, $Res Function(_SalesItemData) _then) = __$SalesItemDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String transactionNumber, DateTime date, int? customerId, String? customerName, int itemId, String itemName, String? itemCode, String? sku, String? category, String? brand, String? imageUrl, int quantity, double unitPrice, double? costPrice, double subtotal, double taxAmount, double totalAmount, String? paymentMethod, int branchId, String branchName, int instockQty
});




}
/// @nodoc
class __$SalesItemDataCopyWithImpl<$Res>
    implements _$SalesItemDataCopyWith<$Res> {
  __$SalesItemDataCopyWithImpl(this._self, this._then);

  final _SalesItemData _self;
  final $Res Function(_SalesItemData) _then;

/// Create a copy of SalesItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionNumber = null,Object? date = null,Object? customerId = freezed,Object? customerName = freezed,Object? itemId = null,Object? itemName = null,Object? itemCode = freezed,Object? sku = freezed,Object? category = freezed,Object? brand = freezed,Object? imageUrl = freezed,Object? quantity = null,Object? unitPrice = null,Object? costPrice = freezed,Object? subtotal = null,Object? taxAmount = null,Object? totalAmount = null,Object? paymentMethod = freezed,Object? branchId = null,Object? branchName = null,Object? instockQty = null,}) {
  return _then(_SalesItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: freezed == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,instockQty: null == instockQty ? _self.instockQty : instockQty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
