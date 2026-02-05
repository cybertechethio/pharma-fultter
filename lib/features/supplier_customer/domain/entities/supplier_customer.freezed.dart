// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierCustomer {

 String get id; String get name; String get phone; String get accountCode; String get tinNumber; SupplierCustomerType get type; String get balance; bool get isActive; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of SupplierCustomer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierCustomerCopyWith<SupplierCustomer> get copyWith => _$SupplierCustomerCopyWithImpl<SupplierCustomer>(this as SupplierCustomer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountCode, accountCode) || other.accountCode == accountCode)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,accountCode,tinNumber,type,balance,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'SupplierCustomer(id: $id, name: $name, phone: $phone, accountCode: $accountCode, tinNumber: $tinNumber, type: $type, balance: $balance, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SupplierCustomerCopyWith<$Res>  {
  factory $SupplierCustomerCopyWith(SupplierCustomer value, $Res Function(SupplierCustomer) _then) = _$SupplierCustomerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String accountCode, String tinNumber, SupplierCustomerType type, String balance, bool isActive, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SupplierCustomerCopyWithImpl<$Res>
    implements $SupplierCustomerCopyWith<$Res> {
  _$SupplierCustomerCopyWithImpl(this._self, this._then);

  final SupplierCustomer _self;
  final $Res Function(SupplierCustomer) _then;

/// Create a copy of SupplierCustomer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? accountCode = null,Object? tinNumber = null,Object? type = null,Object? balance = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,accountCode: null == accountCode ? _self.accountCode : accountCode // ignore: cast_nullable_to_non_nullable
as String,tinNumber: null == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SupplierCustomerType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierCustomer].
extension SupplierCustomerPatterns on SupplierCustomer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierCustomer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierCustomer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierCustomer value)  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierCustomer value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String accountCode,  String tinNumber,  SupplierCustomerType type,  String balance,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierCustomer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String accountCode,  String tinNumber,  SupplierCustomerType type,  String balance,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomer():
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String accountCode,  String tinNumber,  SupplierCustomerType type,  String balance,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomer() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierCustomer implements SupplierCustomer {
  const _SupplierCustomer({required this.id, required this.name, required this.phone, required this.accountCode, required this.tinNumber, required this.type, required this.balance, required this.isActive, required this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String accountCode;
@override final  String tinNumber;
@override final  SupplierCustomerType type;
@override final  String balance;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of SupplierCustomer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierCustomerCopyWith<_SupplierCustomer> get copyWith => __$SupplierCustomerCopyWithImpl<_SupplierCustomer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierCustomer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountCode, accountCode) || other.accountCode == accountCode)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone,accountCode,tinNumber,type,balance,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'SupplierCustomer(id: $id, name: $name, phone: $phone, accountCode: $accountCode, tinNumber: $tinNumber, type: $type, balance: $balance, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SupplierCustomerCopyWith<$Res> implements $SupplierCustomerCopyWith<$Res> {
  factory _$SupplierCustomerCopyWith(_SupplierCustomer value, $Res Function(_SupplierCustomer) _then) = __$SupplierCustomerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String accountCode, String tinNumber, SupplierCustomerType type, String balance, bool isActive, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SupplierCustomerCopyWithImpl<$Res>
    implements _$SupplierCustomerCopyWith<$Res> {
  __$SupplierCustomerCopyWithImpl(this._self, this._then);

  final _SupplierCustomer _self;
  final $Res Function(_SupplierCustomer) _then;

/// Create a copy of SupplierCustomer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? accountCode = null,Object? tinNumber = null,Object? type = null,Object? balance = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_SupplierCustomer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,accountCode: null == accountCode ? _self.accountCode : accountCode // ignore: cast_nullable_to_non_nullable
as String,tinNumber: null == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SupplierCustomerType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
