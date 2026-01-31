// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentMethodDetail {

 int get id; PaymentMethodType get method; double get amount; String? get attachment; String? get referenceNumber; String? get bankName;
/// Create a copy of PaymentMethodDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodDetailCopyWith<PaymentMethodDetail> get copyWith => _$PaymentMethodDetailCopyWithImpl<PaymentMethodDetail>(this as PaymentMethodDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}


@override
int get hashCode => Object.hash(runtimeType,id,method,amount,attachment,referenceNumber,bankName);

@override
String toString() {
  return 'PaymentMethodDetail(id: $id, method: $method, amount: $amount, attachment: $attachment, referenceNumber: $referenceNumber, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodDetailCopyWith<$Res>  {
  factory $PaymentMethodDetailCopyWith(PaymentMethodDetail value, $Res Function(PaymentMethodDetail) _then) = _$PaymentMethodDetailCopyWithImpl;
@useResult
$Res call({
 int id, PaymentMethodType method, double amount, String? attachment, String? referenceNumber, String? bankName
});




}
/// @nodoc
class _$PaymentMethodDetailCopyWithImpl<$Res>
    implements $PaymentMethodDetailCopyWith<$Res> {
  _$PaymentMethodDetailCopyWithImpl(this._self, this._then);

  final PaymentMethodDetail _self;
  final $Res Function(PaymentMethodDetail) _then;

/// Create a copy of PaymentMethodDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? attachment = freezed,Object? referenceNumber = freezed,Object? bankName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodDetail].
extension PaymentMethodDetailPatterns on PaymentMethodDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodDetail value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  PaymentMethodType method,  double amount,  String? attachment,  String? referenceNumber,  String? bankName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodDetail() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.attachment,_that.referenceNumber,_that.bankName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  PaymentMethodType method,  double amount,  String? attachment,  String? referenceNumber,  String? bankName)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDetail():
return $default(_that.id,_that.method,_that.amount,_that.attachment,_that.referenceNumber,_that.bankName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  PaymentMethodType method,  double amount,  String? attachment,  String? referenceNumber,  String? bankName)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDetail() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.attachment,_that.referenceNumber,_that.bankName);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentMethodDetail implements PaymentMethodDetail {
  const _PaymentMethodDetail({required this.id, required this.method, required this.amount, this.attachment, this.referenceNumber, this.bankName});
  

@override final  int id;
@override final  PaymentMethodType method;
@override final  double amount;
@override final  String? attachment;
@override final  String? referenceNumber;
@override final  String? bankName;

/// Create a copy of PaymentMethodDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodDetailCopyWith<_PaymentMethodDetail> get copyWith => __$PaymentMethodDetailCopyWithImpl<_PaymentMethodDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}


@override
int get hashCode => Object.hash(runtimeType,id,method,amount,attachment,referenceNumber,bankName);

@override
String toString() {
  return 'PaymentMethodDetail(id: $id, method: $method, amount: $amount, attachment: $attachment, referenceNumber: $referenceNumber, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodDetailCopyWith<$Res> implements $PaymentMethodDetailCopyWith<$Res> {
  factory _$PaymentMethodDetailCopyWith(_PaymentMethodDetail value, $Res Function(_PaymentMethodDetail) _then) = __$PaymentMethodDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, PaymentMethodType method, double amount, String? attachment, String? referenceNumber, String? bankName
});




}
/// @nodoc
class __$PaymentMethodDetailCopyWithImpl<$Res>
    implements _$PaymentMethodDetailCopyWith<$Res> {
  __$PaymentMethodDetailCopyWithImpl(this._self, this._then);

  final _PaymentMethodDetail _self;
  final $Res Function(_PaymentMethodDetail) _then;

/// Create a copy of PaymentMethodDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? attachment = freezed,Object? referenceNumber = freezed,Object? bankName = freezed,}) {
  return _then(_PaymentMethodDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
