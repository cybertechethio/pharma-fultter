// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionPayment {

 PaymentMethodType get method; double get amount; String? get referenceNumber; int? get bankId;
/// Create a copy of TransactionPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionPaymentCopyWith<TransactionPayment> get copyWith => _$TransactionPaymentCopyWithImpl<TransactionPayment>(this as TransactionPayment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount,referenceNumber,bankId);

@override
String toString() {
  return 'TransactionPayment(method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId)';
}


}

/// @nodoc
abstract mixin class $TransactionPaymentCopyWith<$Res>  {
  factory $TransactionPaymentCopyWith(TransactionPayment value, $Res Function(TransactionPayment) _then) = _$TransactionPaymentCopyWithImpl;
@useResult
$Res call({
 PaymentMethodType method, double amount, String? referenceNumber, int? bankId
});




}
/// @nodoc
class _$TransactionPaymentCopyWithImpl<$Res>
    implements $TransactionPaymentCopyWith<$Res> {
  _$TransactionPaymentCopyWithImpl(this._self, this._then);

  final TransactionPayment _self;
  final $Res Function(TransactionPayment) _then;

/// Create a copy of TransactionPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionPayment].
extension TransactionPaymentPatterns on TransactionPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionPayment value)  $default,){
final _that = this;
switch (_that) {
case _TransactionPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionPayment value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionPayment() when $default != null:
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId)  $default,) {final _that = this;
switch (_that) {
case _TransactionPayment():
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId)?  $default,) {final _that = this;
switch (_that) {
case _TransactionPayment() when $default != null:
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionPayment implements TransactionPayment {
  const _TransactionPayment({required this.method, required this.amount, this.referenceNumber, this.bankId});
  

@override final  PaymentMethodType method;
@override final  double amount;
@override final  String? referenceNumber;
@override final  int? bankId;

/// Create a copy of TransactionPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionPaymentCopyWith<_TransactionPayment> get copyWith => __$TransactionPaymentCopyWithImpl<_TransactionPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId));
}


@override
int get hashCode => Object.hash(runtimeType,method,amount,referenceNumber,bankId);

@override
String toString() {
  return 'TransactionPayment(method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId)';
}


}

/// @nodoc
abstract mixin class _$TransactionPaymentCopyWith<$Res> implements $TransactionPaymentCopyWith<$Res> {
  factory _$TransactionPaymentCopyWith(_TransactionPayment value, $Res Function(_TransactionPayment) _then) = __$TransactionPaymentCopyWithImpl;
@override @useResult
$Res call({
 PaymentMethodType method, double amount, String? referenceNumber, int? bankId
});




}
/// @nodoc
class __$TransactionPaymentCopyWithImpl<$Res>
    implements _$TransactionPaymentCopyWith<$Res> {
  __$TransactionPaymentCopyWithImpl(this._self, this._then);

  final _TransactionPayment _self;
  final $Res Function(_TransactionPayment) _then;

/// Create a copy of TransactionPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,}) {
  return _then(_TransactionPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
