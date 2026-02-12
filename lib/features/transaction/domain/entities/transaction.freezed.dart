// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Transaction {

 int get id; TransactionType get transactionType; String get transactionNumber; String get status; int? get supplierId; int? get customerId; String? get supplierName; String? get customerName; double get subtotal; double get totalTax; double get totalAmount; String? get notes; List<String> get attachments; DateTime get createdAt; DateTime get updatedAt; int? get createdBy; int? get updatedBy; String? get creatorName; String? get updatorName; List<TransItem> get items; Payment? get payment; Payment? get refund;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updatorName, updatorName) || other.updatorName == updatorName)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.refund, refund) || other.refund == refund));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,transactionType,transactionNumber,status,supplierId,customerId,supplierName,customerName,subtotal,totalTax,totalAmount,notes,const DeepCollectionEquality().hash(attachments),createdAt,updatedAt,createdBy,updatedBy,creatorName,updatorName,const DeepCollectionEquality().hash(items),payment,refund]);

@override
String toString() {
  return 'Transaction(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, supplierId: $supplierId, customerId: $customerId, supplierName: $supplierName, customerName: $customerName, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updatorName: $updatorName, items: $items, payment: $payment, refund: $refund)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 int id, TransactionType transactionType, String transactionNumber, String status, int? supplierId, int? customerId, String? supplierName, String? customerName, double subtotal, double totalTax, double totalAmount, String? notes, List<String> attachments, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updatorName, List<TransItem> items, Payment? payment, Payment? refund
});


$PaymentCopyWith<$Res>? get payment;$PaymentCopyWith<$Res>? get refund;

}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? supplierId = freezed,Object? customerId = freezed,Object? supplierName = freezed,Object? customerName = freezed,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? attachments = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updatorName = freezed,Object? items = null,Object? payment = freezed,Object? refund = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updatorName: freezed == updatorName ? _self.updatorName : updatorName // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransItem>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as Payment?,
  ));
}
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}
}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  int? supplierId,  int? customerId,  String? supplierName,  String? customerName,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  List<String> attachments,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransItem> items,  Payment? payment,  Payment? refund)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.supplierId,_that.customerId,_that.supplierName,_that.customerName,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.attachments,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.items,_that.payment,_that.refund);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  int? supplierId,  int? customerId,  String? supplierName,  String? customerName,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  List<String> attachments,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransItem> items,  Payment? payment,  Payment? refund)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.supplierId,_that.customerId,_that.supplierName,_that.customerName,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.attachments,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.items,_that.payment,_that.refund);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  int? supplierId,  int? customerId,  String? supplierName,  String? customerName,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  List<String> attachments,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? creatorName,  String? updatorName,  List<TransItem> items,  Payment? payment,  Payment? refund)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.supplierId,_that.customerId,_that.supplierName,_that.customerName,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.attachments,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.creatorName,_that.updatorName,_that.items,_that.payment,_that.refund);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction implements Transaction {
  const _Transaction({required this.id, required this.transactionType, required this.transactionNumber, required this.status, this.supplierId, this.customerId, this.supplierName, this.customerName, required this.subtotal, required this.totalTax, required this.totalAmount, this.notes, final  List<String> attachments = const [], required this.createdAt, required this.updatedAt, this.createdBy, this.updatedBy, this.creatorName, this.updatorName, final  List<TransItem> items = const [], this.payment, this.refund}): _attachments = attachments,_items = items;
  

@override final  int id;
@override final  TransactionType transactionType;
@override final  String transactionNumber;
@override final  String status;
@override final  int? supplierId;
@override final  int? customerId;
@override final  String? supplierName;
@override final  String? customerName;
@override final  double subtotal;
@override final  double totalTax;
@override final  double totalAmount;
@override final  String? notes;
 final  List<String> _attachments;
@override@JsonKey() List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
@override final  String? creatorName;
@override final  String? updatorName;
 final  List<TransItem> _items;
@override@JsonKey() List<TransItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Payment? payment;
@override final  Payment? refund;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.updatorName, updatorName) || other.updatorName == updatorName)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.refund, refund) || other.refund == refund));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,transactionType,transactionNumber,status,supplierId,customerId,supplierName,customerName,subtotal,totalTax,totalAmount,notes,const DeepCollectionEquality().hash(_attachments),createdAt,updatedAt,createdBy,updatedBy,creatorName,updatorName,const DeepCollectionEquality().hash(_items),payment,refund]);

@override
String toString() {
  return 'Transaction(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, supplierId: $supplierId, customerId: $customerId, supplierName: $supplierName, customerName: $customerName, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, creatorName: $creatorName, updatorName: $updatorName, items: $items, payment: $payment, refund: $refund)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 int id, TransactionType transactionType, String transactionNumber, String status, int? supplierId, int? customerId, String? supplierName, String? customerName, double subtotal, double totalTax, double totalAmount, String? notes, List<String> attachments, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? creatorName, String? updatorName, List<TransItem> items, Payment? payment, Payment? refund
});


@override $PaymentCopyWith<$Res>? get payment;@override $PaymentCopyWith<$Res>? get refund;

}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? supplierId = freezed,Object? customerId = freezed,Object? supplierName = freezed,Object? customerName = freezed,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? attachments = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? creatorName = freezed,Object? updatorName = freezed,Object? items = null,Object? payment = freezed,Object? refund = freezed,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,updatorName: freezed == updatorName ? _self.updatorName : updatorName // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransItem>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment?,refund: freezed == refund ? _self.refund : refund // ignore: cast_nullable_to_non_nullable
as Payment?,
  ));
}

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res>? get refund {
    if (_self.refund == null) {
    return null;
  }

  return $PaymentCopyWith<$Res>(_self.refund!, (value) {
    return _then(_self.copyWith(refund: value));
  });
}
}

// dart format on
