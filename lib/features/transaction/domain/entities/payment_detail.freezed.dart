// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentDetail {

 int get id; double get totalAmount; double get paidAmount; PaymentType get paymentType; DateTime get createdAt; List<PaymentMethodDetail> get paymentMethods;
/// Create a copy of PaymentDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailCopyWith<PaymentDetail> get copyWith => _$PaymentDetailCopyWithImpl<PaymentDetail>(this as PaymentDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,id,totalAmount,paidAmount,paymentType,createdAt,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'PaymentDetail(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, paymentType: $paymentType, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $PaymentDetailCopyWith<$Res>  {
  factory $PaymentDetailCopyWith(PaymentDetail value, $Res Function(PaymentDetail) _then) = _$PaymentDetailCopyWithImpl;
@useResult
$Res call({
 int id, double totalAmount, double paidAmount, PaymentType paymentType, DateTime createdAt, List<PaymentMethodDetail> paymentMethods
});




}
/// @nodoc
class _$PaymentDetailCopyWithImpl<$Res>
    implements $PaymentDetailCopyWith<$Res> {
  _$PaymentDetailCopyWithImpl(this._self, this._then);

  final PaymentDetail _self;
  final $Res Function(PaymentDetail) _then;

/// Create a copy of PaymentDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalAmount = null,Object? paidAmount = null,Object? paymentType = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDetail].
extension PaymentDetailPatterns on PaymentDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetail value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double totalAmount,  double paidAmount,  PaymentType paymentType,  DateTime createdAt,  List<PaymentMethodDetail> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetail() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double totalAmount,  double paidAmount,  PaymentType paymentType,  DateTime createdAt,  List<PaymentMethodDetail> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetail():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double totalAmount,  double paidAmount,  PaymentType paymentType,  DateTime createdAt,  List<PaymentMethodDetail> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetail() when $default != null:
return $default(_that.id,_that.totalAmount,_that.paidAmount,_that.paymentType,_that.createdAt,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentDetail implements PaymentDetail {
  const _PaymentDetail({required this.id, required this.totalAmount, required this.paidAmount, required this.paymentType, required this.createdAt, required final  List<PaymentMethodDetail> paymentMethods}): _paymentMethods = paymentMethods;
  

@override final  int id;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  PaymentType paymentType;
@override final  DateTime createdAt;
 final  List<PaymentMethodDetail> _paymentMethods;
@override List<PaymentMethodDetail> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of PaymentDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailCopyWith<_PaymentDetail> get copyWith => __$PaymentDetailCopyWithImpl<_PaymentDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,id,totalAmount,paidAmount,paymentType,createdAt,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'PaymentDetail(id: $id, totalAmount: $totalAmount, paidAmount: $paidAmount, paymentType: $paymentType, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailCopyWith<$Res> implements $PaymentDetailCopyWith<$Res> {
  factory _$PaymentDetailCopyWith(_PaymentDetail value, $Res Function(_PaymentDetail) _then) = __$PaymentDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, double totalAmount, double paidAmount, PaymentType paymentType, DateTime createdAt, List<PaymentMethodDetail> paymentMethods
});




}
/// @nodoc
class __$PaymentDetailCopyWithImpl<$Res>
    implements _$PaymentDetailCopyWith<$Res> {
  __$PaymentDetailCopyWithImpl(this._self, this._then);

  final _PaymentDetail _self;
  final $Res Function(_PaymentDetail) _then;

/// Create a copy of PaymentDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalAmount = null,Object? paidAmount = null,Object? paymentType = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_PaymentDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDetail>,
  ));
}


}

// dart format on
