// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionDetail {

 Transaction get transaction; List<String> get attachments; PaymentDetail? get payment; List<TransactionItemDetail> get transactionItems;
/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDetailCopyWith<TransactionDetail> get copyWith => _$TransactionDetailCopyWithImpl<TransactionDetail>(this as TransactionDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDetail&&(identical(other.transaction, transaction) || other.transaction == transaction)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other.transactionItems, transactionItems));
}


@override
int get hashCode => Object.hash(runtimeType,transaction,const DeepCollectionEquality().hash(attachments),payment,const DeepCollectionEquality().hash(transactionItems));

@override
String toString() {
  return 'TransactionDetail(transaction: $transaction, attachments: $attachments, payment: $payment, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class $TransactionDetailCopyWith<$Res>  {
  factory $TransactionDetailCopyWith(TransactionDetail value, $Res Function(TransactionDetail) _then) = _$TransactionDetailCopyWithImpl;
@useResult
$Res call({
 Transaction transaction, List<String> attachments, PaymentDetail? payment, List<TransactionItemDetail> transactionItems
});


$TransactionCopyWith<$Res> get transaction;$PaymentDetailCopyWith<$Res>? get payment;

}
/// @nodoc
class _$TransactionDetailCopyWithImpl<$Res>
    implements $TransactionDetailCopyWith<$Res> {
  _$TransactionDetailCopyWithImpl(this._self, this._then);

  final TransactionDetail _self;
  final $Res Function(TransactionDetail) _then;

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transaction = null,Object? attachments = null,Object? payment = freezed,Object? transactionItems = null,}) {
  return _then(_self.copyWith(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentDetail?,transactionItems: null == transactionItems ? _self.transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionItemDetail>,
  ));
}
/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDetailCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionDetail].
extension TransactionDetailPatterns on TransactionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDetail value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Transaction transaction,  List<String> attachments,  PaymentDetail? payment,  List<TransactionItemDetail> transactionItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
return $default(_that.transaction,_that.attachments,_that.payment,_that.transactionItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Transaction transaction,  List<String> attachments,  PaymentDetail? payment,  List<TransactionItemDetail> transactionItems)  $default,) {final _that = this;
switch (_that) {
case _TransactionDetail():
return $default(_that.transaction,_that.attachments,_that.payment,_that.transactionItems);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Transaction transaction,  List<String> attachments,  PaymentDetail? payment,  List<TransactionItemDetail> transactionItems)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
return $default(_that.transaction,_that.attachments,_that.payment,_that.transactionItems);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionDetail implements TransactionDetail {
  const _TransactionDetail({required this.transaction, required final  List<String> attachments, this.payment, required final  List<TransactionItemDetail> transactionItems}): _attachments = attachments,_transactionItems = transactionItems;
  

@override final  Transaction transaction;
 final  List<String> _attachments;
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  PaymentDetail? payment;
 final  List<TransactionItemDetail> _transactionItems;
@override List<TransactionItemDetail> get transactionItems {
  if (_transactionItems is EqualUnmodifiableListView) return _transactionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionItems);
}


/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDetailCopyWith<_TransactionDetail> get copyWith => __$TransactionDetailCopyWithImpl<_TransactionDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDetail&&(identical(other.transaction, transaction) || other.transaction == transaction)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other._transactionItems, _transactionItems));
}


@override
int get hashCode => Object.hash(runtimeType,transaction,const DeepCollectionEquality().hash(_attachments),payment,const DeepCollectionEquality().hash(_transactionItems));

@override
String toString() {
  return 'TransactionDetail(transaction: $transaction, attachments: $attachments, payment: $payment, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class _$TransactionDetailCopyWith<$Res> implements $TransactionDetailCopyWith<$Res> {
  factory _$TransactionDetailCopyWith(_TransactionDetail value, $Res Function(_TransactionDetail) _then) = __$TransactionDetailCopyWithImpl;
@override @useResult
$Res call({
 Transaction transaction, List<String> attachments, PaymentDetail? payment, List<TransactionItemDetail> transactionItems
});


@override $TransactionCopyWith<$Res> get transaction;@override $PaymentDetailCopyWith<$Res>? get payment;

}
/// @nodoc
class __$TransactionDetailCopyWithImpl<$Res>
    implements _$TransactionDetailCopyWith<$Res> {
  __$TransactionDetailCopyWithImpl(this._self, this._then);

  final _TransactionDetail _self;
  final $Res Function(_TransactionDetail) _then;

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transaction = null,Object? attachments = null,Object? payment = freezed,Object? transactionItems = null,}) {
  return _then(_TransactionDetail(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as Transaction,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentDetail?,transactionItems: null == transactionItems ? _self._transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionItemDetail>,
  ));
}

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res> get transaction {
  
  return $TransactionCopyWith<$Res>(_self.transaction, (value) {
    return _then(_self.copyWith(transaction: value));
  });
}/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDetailCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

// dart format on
