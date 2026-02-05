// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodRequest {

 String get method;// (M) for create, (O) for update
 double? get amount;// (M) for create, (O) for update
 int? get bankId;// (O)
 String? get referenceNumber;// (O)
 String? get attachment;
/// Create a copy of PaymentMethodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodRequestCopyWith<PaymentMethodRequest> get copyWith => _$PaymentMethodRequestCopyWithImpl<PaymentMethodRequest>(this as PaymentMethodRequest, _$identity);

  /// Serializes this PaymentMethodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,amount,bankId,referenceNumber,attachment);

@override
String toString() {
  return 'PaymentMethodRequest(method: $method, amount: $amount, bankId: $bankId, referenceNumber: $referenceNumber, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodRequestCopyWith<$Res>  {
  factory $PaymentMethodRequestCopyWith(PaymentMethodRequest value, $Res Function(PaymentMethodRequest) _then) = _$PaymentMethodRequestCopyWithImpl;
@useResult
$Res call({
 String method, double? amount, int? bankId, String? referenceNumber, String? attachment
});




}
/// @nodoc
class _$PaymentMethodRequestCopyWithImpl<$Res>
    implements $PaymentMethodRequestCopyWith<$Res> {
  _$PaymentMethodRequestCopyWithImpl(this._self, this._then);

  final PaymentMethodRequest _self;
  final $Res Function(PaymentMethodRequest) _then;

/// Create a copy of PaymentMethodRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = freezed,Object? bankId = freezed,Object? referenceNumber = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodRequest].
extension PaymentMethodRequestPatterns on PaymentMethodRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  double? amount,  int? bankId,  String? referenceNumber,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodRequest() when $default != null:
return $default(_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.attachment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  double? amount,  int? bankId,  String? referenceNumber,  String? attachment)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodRequest():
return $default(_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.attachment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  double? amount,  int? bankId,  String? referenceNumber,  String? attachment)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodRequest() when $default != null:
return $default(_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.attachment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodRequest implements PaymentMethodRequest {
  const _PaymentMethodRequest({required this.method, this.amount, this.bankId, this.referenceNumber, this.attachment});
  factory _PaymentMethodRequest.fromJson(Map<String, dynamic> json) => _$PaymentMethodRequestFromJson(json);

@override final  String method;
// (M) for create, (O) for update
@override final  double? amount;
// (M) for create, (O) for update
@override final  int? bankId;
// (O)
@override final  String? referenceNumber;
// (O)
@override final  String? attachment;

/// Create a copy of PaymentMethodRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodRequestCopyWith<_PaymentMethodRequest> get copyWith => __$PaymentMethodRequestCopyWithImpl<_PaymentMethodRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodRequest&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,amount,bankId,referenceNumber,attachment);

@override
String toString() {
  return 'PaymentMethodRequest(method: $method, amount: $amount, bankId: $bankId, referenceNumber: $referenceNumber, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodRequestCopyWith<$Res> implements $PaymentMethodRequestCopyWith<$Res> {
  factory _$PaymentMethodRequestCopyWith(_PaymentMethodRequest value, $Res Function(_PaymentMethodRequest) _then) = __$PaymentMethodRequestCopyWithImpl;
@override @useResult
$Res call({
 String method, double? amount, int? bankId, String? referenceNumber, String? attachment
});




}
/// @nodoc
class __$PaymentMethodRequestCopyWithImpl<$Res>
    implements _$PaymentMethodRequestCopyWith<$Res> {
  __$PaymentMethodRequestCopyWithImpl(this._self, this._then);

  final _PaymentMethodRequest _self;
  final $Res Function(_PaymentMethodRequest) _then;

/// Create a copy of PaymentMethodRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = freezed,Object? bankId = freezed,Object? referenceNumber = freezed,Object? attachment = freezed,}) {
  return _then(_PaymentMethodRequest(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
