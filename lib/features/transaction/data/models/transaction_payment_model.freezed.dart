// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionPaymentModel {

@JsonKey(toJson: _paymentMethodToJson) PaymentMethodType get method; double get amount; String? get referenceNumber; int? get bankId; String? get attachment;
/// Create a copy of TransactionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionPaymentModelCopyWith<TransactionPaymentModel> get copyWith => _$TransactionPaymentModelCopyWithImpl<TransactionPaymentModel>(this as TransactionPaymentModel, _$identity);

  /// Serializes this TransactionPaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionPaymentModel&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,amount,referenceNumber,bankId,attachment);

@override
String toString() {
  return 'TransactionPaymentModel(method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class $TransactionPaymentModelCopyWith<$Res>  {
  factory $TransactionPaymentModelCopyWith(TransactionPaymentModel value, $Res Function(TransactionPaymentModel) _then) = _$TransactionPaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: _paymentMethodToJson) PaymentMethodType method, double amount, String? referenceNumber, int? bankId, String? attachment
});




}
/// @nodoc
class _$TransactionPaymentModelCopyWithImpl<$Res>
    implements $TransactionPaymentModelCopyWith<$Res> {
  _$TransactionPaymentModelCopyWithImpl(this._self, this._then);

  final TransactionPaymentModel _self;
  final $Res Function(TransactionPaymentModel) _then;

/// Create a copy of TransactionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionPaymentModel].
extension TransactionPaymentModelPatterns on TransactionPaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionPaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionPaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionPaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionPaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionPaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionPaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: _paymentMethodToJson)  PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionPaymentModel() when $default != null:
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.attachment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: _paymentMethodToJson)  PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId,  String? attachment)  $default,) {final _that = this;
switch (_that) {
case _TransactionPaymentModel():
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.attachment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: _paymentMethodToJson)  PaymentMethodType method,  double amount,  String? referenceNumber,  int? bankId,  String? attachment)?  $default,) {final _that = this;
switch (_that) {
case _TransactionPaymentModel() when $default != null:
return $default(_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.attachment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionPaymentModel implements TransactionPaymentModel {
  const _TransactionPaymentModel({@JsonKey(toJson: _paymentMethodToJson) required this.method, required this.amount, this.referenceNumber, this.bankId, this.attachment});
  factory _TransactionPaymentModel.fromJson(Map<String, dynamic> json) => _$TransactionPaymentModelFromJson(json);

@override@JsonKey(toJson: _paymentMethodToJson) final  PaymentMethodType method;
@override final  double amount;
@override final  String? referenceNumber;
@override final  int? bankId;
@override final  String? attachment;

/// Create a copy of TransactionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionPaymentModelCopyWith<_TransactionPaymentModel> get copyWith => __$TransactionPaymentModelCopyWithImpl<_TransactionPaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionPaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionPaymentModel&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,amount,referenceNumber,bankId,attachment);

@override
String toString() {
  return 'TransactionPaymentModel(method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class _$TransactionPaymentModelCopyWith<$Res> implements $TransactionPaymentModelCopyWith<$Res> {
  factory _$TransactionPaymentModelCopyWith(_TransactionPaymentModel value, $Res Function(_TransactionPaymentModel) _then) = __$TransactionPaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: _paymentMethodToJson) PaymentMethodType method, double amount, String? referenceNumber, int? bankId, String? attachment
});




}
/// @nodoc
class __$TransactionPaymentModelCopyWithImpl<$Res>
    implements _$TransactionPaymentModelCopyWith<$Res> {
  __$TransactionPaymentModelCopyWithImpl(this._self, this._then);

  final _TransactionPaymentModel _self;
  final $Res Function(_TransactionPaymentModel) _then;

/// Create a copy of TransactionPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,Object? attachment = freezed,}) {
  return _then(_TransactionPaymentModel(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
