// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodDetailModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id;@JsonKey(fromJson: _paymentMethodFromJson) PaymentMethodType get method;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get amount; String? get attachment; String? get referenceNumber; String? get bankName;
/// Create a copy of PaymentMethodDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodDetailModelCopyWith<PaymentMethodDetailModel> get copyWith => _$PaymentMethodDetailModelCopyWithImpl<PaymentMethodDetailModel>(this as PaymentMethodDetailModel, _$identity);

  /// Serializes this PaymentMethodDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,amount,attachment,referenceNumber,bankName);

@override
String toString() {
  return 'PaymentMethodDetailModel(id: $id, method: $method, amount: $amount, attachment: $attachment, referenceNumber: $referenceNumber, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodDetailModelCopyWith<$Res>  {
  factory $PaymentMethodDetailModelCopyWith(PaymentMethodDetailModel value, $Res Function(PaymentMethodDetailModel) _then) = _$PaymentMethodDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: _paymentMethodFromJson) PaymentMethodType method,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, String? attachment, String? referenceNumber, String? bankName
});




}
/// @nodoc
class _$PaymentMethodDetailModelCopyWithImpl<$Res>
    implements $PaymentMethodDetailModelCopyWith<$Res> {
  _$PaymentMethodDetailModelCopyWithImpl(this._self, this._then);

  final PaymentMethodDetailModel _self;
  final $Res Function(PaymentMethodDetailModel) _then;

/// Create a copy of PaymentMethodDetailModel
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


/// Adds pattern-matching-related methods to [PaymentMethodDetailModel].
extension PaymentMethodDetailModelPatterns on PaymentMethodDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _paymentMethodFromJson)  PaymentMethodType method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? attachment,  String? referenceNumber,  String? bankName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodDetailModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _paymentMethodFromJson)  PaymentMethodType method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? attachment,  String? referenceNumber,  String? bankName)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDetailModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _paymentMethodFromJson)  PaymentMethodType method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? attachment,  String? referenceNumber,  String? bankName)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodDetailModel() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.attachment,_that.referenceNumber,_that.bankName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodDetailModel implements PaymentMethodDetailModel {
  const _PaymentMethodDetailModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, @JsonKey(fromJson: _paymentMethodFromJson) required this.method, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.amount, this.attachment, this.referenceNumber, this.bankName});
  factory _PaymentMethodDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodDetailModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override@JsonKey(fromJson: _paymentMethodFromJson) final  PaymentMethodType method;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double amount;
@override final  String? attachment;
@override final  String? referenceNumber;
@override final  String? bankName;

/// Create a copy of PaymentMethodDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodDetailModelCopyWith<_PaymentMethodDetailModel> get copyWith => __$PaymentMethodDetailModelCopyWithImpl<_PaymentMethodDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,amount,attachment,referenceNumber,bankName);

@override
String toString() {
  return 'PaymentMethodDetailModel(id: $id, method: $method, amount: $amount, attachment: $attachment, referenceNumber: $referenceNumber, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodDetailModelCopyWith<$Res> implements $PaymentMethodDetailModelCopyWith<$Res> {
  factory _$PaymentMethodDetailModelCopyWith(_PaymentMethodDetailModel value, $Res Function(_PaymentMethodDetailModel) _then) = __$PaymentMethodDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: _paymentMethodFromJson) PaymentMethodType method,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, String? attachment, String? referenceNumber, String? bankName
});




}
/// @nodoc
class __$PaymentMethodDetailModelCopyWithImpl<$Res>
    implements _$PaymentMethodDetailModelCopyWith<$Res> {
  __$PaymentMethodDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentMethodDetailModel _self;
  final $Res Function(_PaymentMethodDetailModel) _then;

/// Create a copy of PaymentMethodDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? attachment = freezed,Object? referenceNumber = freezed,Object? bankName = freezed,}) {
  return _then(_PaymentMethodDetailModel(
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
