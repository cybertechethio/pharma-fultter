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

 int get id; TransactionType get transactionType; String get transactionNumber; String get status; double get subtotal; double get totalTax; double get totalAmount; String? get notes; DateTime get createdAt; String? get creatorName; String? get supplierName; String? get customerName;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName));
}


@override
int get hashCode => Object.hash(runtimeType,id,transactionType,transactionNumber,status,subtotal,totalTax,totalAmount,notes,createdAt,creatorName,supplierName,customerName);

@override
String toString() {
  return 'Transaction(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt, creatorName: $creatorName, supplierName: $supplierName, customerName: $customerName)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 int id, TransactionType transactionType, String transactionNumber, String status, double subtotal, double totalTax, double totalAmount, String? notes, DateTime createdAt, String? creatorName, String? supplierName, String? customerName
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? createdAt = null,Object? creatorName = freezed,Object? supplierName = freezed,Object? customerName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TransactionType transactionType,  String transactionNumber,  String status,  double subtotal,  double totalTax,  double totalAmount,  String? notes,  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName);case _:
  return null;

}
}

}

/// @nodoc


class _Transaction implements Transaction {
  const _Transaction({required this.id, required this.transactionType, required this.transactionNumber, required this.status, required this.subtotal, required this.totalTax, required this.totalAmount, this.notes, required this.createdAt, this.creatorName, this.supplierName, this.customerName});
  

@override final  int id;
@override final  TransactionType transactionType;
@override final  String transactionNumber;
@override final  String status;
@override final  double subtotal;
@override final  double totalTax;
@override final  double totalAmount;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  String? creatorName;
@override final  String? supplierName;
@override final  String? customerName;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName));
}


@override
int get hashCode => Object.hash(runtimeType,id,transactionType,transactionNumber,status,subtotal,totalTax,totalAmount,notes,createdAt,creatorName,supplierName,customerName);

@override
String toString() {
  return 'Transaction(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt, creatorName: $creatorName, supplierName: $supplierName, customerName: $customerName)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 int id, TransactionType transactionType, String transactionNumber, String status, double subtotal, double totalTax, double totalAmount, String? notes, DateTime createdAt, String? creatorName, String? supplierName, String? customerName
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? createdAt = null,Object? creatorName = freezed,Object? supplierName = freezed,Object? customerName = freezed,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
