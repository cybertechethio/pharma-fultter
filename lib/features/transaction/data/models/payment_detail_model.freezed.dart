// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentDetailModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get paidAmount;@JsonKey(fromJson: _paymentTypeFromJson) PaymentType get paymentType;@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime get createdAt; List<PaymentMethodDetailModel> get paymentMethods;
/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<PaymentDetailModel> get copyWith => _$PaymentDetailModelCopyWithImpl<PaymentDetailModel>(this as PaymentDetailModel, _$identity);

  /// Serializes this PaymentDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalAmount,paidAmount,paymentType,createdAt,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'PaymentDetailModel(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, paymentType: $paymentType, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailModelCopyWith<$Res>  {
  factory $PaymentDetailModelCopyWith(PaymentDetailModel value, $Res Function(PaymentDetailModel) _then) = _$PaymentDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double paidAmount,@JsonKey(fromJson: _paymentTypeFromJson) PaymentType paymentType,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt, List<PaymentMethodDetailModel> paymentMethods
});




}
/// @nodoc
class _$PaymentDetailModelCopyWithImpl<$Res>
    implements $PaymentDetailModelCopyWith<$Res> {
  _$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final PaymentDetailModel _self;
  final $Res Function(PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalAmount = null,Object? paidAmount = null,Object? paymentType = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetailModel].
extension PaymentDetailModelPatterns on PaymentDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: _paymentTypeFromJson)  PaymentType paymentType, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  List<PaymentMethodDetailModel> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.id,_that.totalAmount,_that.paidAmount,_that.paymentType,_that.createdAt,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: _paymentTypeFromJson)  PaymentType paymentType, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  List<PaymentMethodDetailModel> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel():
return $default(_that.id,_that.totalAmount,_that.paidAmount,_that.paymentType,_that.createdAt,_that.paymentMethods);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double paidAmount, @JsonKey(fromJson: _paymentTypeFromJson)  PaymentType paymentType, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  List<PaymentMethodDetailModel> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetailModel() when $default != null:
return $default(_that.id,_that.totalAmount,_that.paidAmount,_that.paymentType,_that.createdAt,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentDetailModel implements PaymentDetailModel {
  const _PaymentDetailModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.paidAmount, @JsonKey(fromJson: _paymentTypeFromJson) required this.paymentType, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) required this.createdAt, required final  List<PaymentMethodDetailModel> paymentMethods}): _paymentMethods = paymentMethods;
  factory _PaymentDetailModel.fromJson(Map<String, dynamic> json) => _$PaymentDetailModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double paidAmount;
@override@JsonKey(fromJson: _paymentTypeFromJson) final  PaymentType paymentType;
@override@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) final  DateTime createdAt;
 final  List<PaymentMethodDetailModel> _paymentMethods;
@override List<PaymentMethodDetailModel> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailModelCopyWith<_PaymentDetailModel> get copyWith => __$PaymentDetailModelCopyWithImpl<_PaymentDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalAmount,paidAmount,paymentType,createdAt,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'PaymentDetailModel(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, paymentType: $paymentType, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailModelCopyWith<$Res> implements $PaymentDetailModelCopyWith<$Res> {
  factory _$PaymentDetailModelCopyWith(_PaymentDetailModel value, $Res Function(_PaymentDetailModel) _then) = __$PaymentDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double paidAmount,@JsonKey(fromJson: _paymentTypeFromJson) PaymentType paymentType,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt, List<PaymentMethodDetailModel> paymentMethods
});




}
/// @nodoc
class __$PaymentDetailModelCopyWithImpl<$Res>
    implements _$PaymentDetailModelCopyWith<$Res> {
  __$PaymentDetailModelCopyWithImpl(this._self, this._then);

  final _PaymentDetailModel _self;
  final $Res Function(_PaymentDetailModel) _then;

/// Create a copy of PaymentDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalAmount = null,Object? paidAmount = null,Object? paymentType = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_PaymentDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDetailModel>,
  ));
}


}

// dart format on
