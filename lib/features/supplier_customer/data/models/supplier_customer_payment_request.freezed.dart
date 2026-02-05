// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_customer_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodRequest {

 String get method;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get amount; int? get bankId; String? get referenceNumber; String? get attachment;
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
 String method,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, int? bankId, String? referenceNumber, String? attachment
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
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,Object? bankId = freezed,Object? referenceNumber = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  int? bankId,  String? referenceNumber,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  int? bankId,  String? referenceNumber,  String? attachment)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  int? bankId,  String? referenceNumber,  String? attachment)?  $default,) {final _that = this;
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
  const _PaymentMethodRequest({required this.method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.amount, this.bankId, this.referenceNumber, this.attachment});
  factory _PaymentMethodRequest.fromJson(Map<String, dynamic> json) => _$PaymentMethodRequestFromJson(json);

@override final  String method;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double amount;
@override final  int? bankId;
@override final  String? referenceNumber;
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
 String method,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, int? bankId, String? referenceNumber, String? attachment
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
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,Object? bankId = freezed,Object? referenceNumber = freezed,Object? attachment = freezed,}) {
  return _then(_PaymentMethodRequest(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SupplierCustomerPaymentRequest {

/// Required for add-balance (customer), optional for refund
 int? get customerId;/// Required for add-balance (supplier), optional for refund
 int? get supplierId; String? get notes; List<PaymentMethodRequest> get paymentMethods;
/// Create a copy of SupplierCustomerPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierCustomerPaymentRequestCopyWith<SupplierCustomerPaymentRequest> get copyWith => _$SupplierCustomerPaymentRequestCopyWithImpl<SupplierCustomerPaymentRequest>(this as SupplierCustomerPaymentRequest, _$identity);

  /// Serializes this SupplierCustomerPaymentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierCustomerPaymentRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,supplierId,notes,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'SupplierCustomerPaymentRequest(customerId: $customerId, supplierId: $supplierId, notes: $notes, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $SupplierCustomerPaymentRequestCopyWith<$Res>  {
  factory $SupplierCustomerPaymentRequestCopyWith(SupplierCustomerPaymentRequest value, $Res Function(SupplierCustomerPaymentRequest) _then) = _$SupplierCustomerPaymentRequestCopyWithImpl;
@useResult
$Res call({
 int? customerId, int? supplierId, String? notes, List<PaymentMethodRequest> paymentMethods
});




}
/// @nodoc
class _$SupplierCustomerPaymentRequestCopyWithImpl<$Res>
    implements $SupplierCustomerPaymentRequestCopyWith<$Res> {
  _$SupplierCustomerPaymentRequestCopyWithImpl(this._self, this._then);

  final SupplierCustomerPaymentRequest _self;
  final $Res Function(SupplierCustomerPaymentRequest) _then;

/// Create a copy of SupplierCustomerPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = freezed,Object? supplierId = freezed,Object? notes = freezed,Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierCustomerPaymentRequest].
extension SupplierCustomerPaymentRequestPatterns on SupplierCustomerPaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierCustomerPaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierCustomerPaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierCustomerPaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? customerId,  int? supplierId,  String? notes,  List<PaymentMethodRequest> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest() when $default != null:
return $default(_that.customerId,_that.supplierId,_that.notes,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? customerId,  int? supplierId,  String? notes,  List<PaymentMethodRequest> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest():
return $default(_that.customerId,_that.supplierId,_that.notes,_that.paymentMethods);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? customerId,  int? supplierId,  String? notes,  List<PaymentMethodRequest> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomerPaymentRequest() when $default != null:
return $default(_that.customerId,_that.supplierId,_that.notes,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierCustomerPaymentRequest implements SupplierCustomerPaymentRequest {
  const _SupplierCustomerPaymentRequest({this.customerId, this.supplierId, this.notes, required final  List<PaymentMethodRequest> paymentMethods}): _paymentMethods = paymentMethods;
  factory _SupplierCustomerPaymentRequest.fromJson(Map<String, dynamic> json) => _$SupplierCustomerPaymentRequestFromJson(json);

/// Required for add-balance (customer), optional for refund
@override final  int? customerId;
/// Required for add-balance (supplier), optional for refund
@override final  int? supplierId;
@override final  String? notes;
 final  List<PaymentMethodRequest> _paymentMethods;
@override List<PaymentMethodRequest> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of SupplierCustomerPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierCustomerPaymentRequestCopyWith<_SupplierCustomerPaymentRequest> get copyWith => __$SupplierCustomerPaymentRequestCopyWithImpl<_SupplierCustomerPaymentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierCustomerPaymentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierCustomerPaymentRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,supplierId,notes,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'SupplierCustomerPaymentRequest(customerId: $customerId, supplierId: $supplierId, notes: $notes, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$SupplierCustomerPaymentRequestCopyWith<$Res> implements $SupplierCustomerPaymentRequestCopyWith<$Res> {
  factory _$SupplierCustomerPaymentRequestCopyWith(_SupplierCustomerPaymentRequest value, $Res Function(_SupplierCustomerPaymentRequest) _then) = __$SupplierCustomerPaymentRequestCopyWithImpl;
@override @useResult
$Res call({
 int? customerId, int? supplierId, String? notes, List<PaymentMethodRequest> paymentMethods
});




}
/// @nodoc
class __$SupplierCustomerPaymentRequestCopyWithImpl<$Res>
    implements _$SupplierCustomerPaymentRequestCopyWith<$Res> {
  __$SupplierCustomerPaymentRequestCopyWithImpl(this._self, this._then);

  final _SupplierCustomerPaymentRequest _self;
  final $Res Function(_SupplierCustomerPaymentRequest) _then;

/// Create a copy of SupplierCustomerPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = freezed,Object? supplierId = freezed,Object? notes = freezed,Object? paymentMethods = null,}) {
  return _then(_SupplierCustomerPaymentRequest(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodRequest>,
  ));
}


}

// dart format on
