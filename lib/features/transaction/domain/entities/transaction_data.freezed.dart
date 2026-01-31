// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionData {

 TransactionType get transactionType; int? get supplierId; int? get customerId; String? get notes; List<TransactionItem> get items; List<TransactionPayment>? get paymentMethods;
/// Create a copy of TransactionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDataCopyWith<TransactionData> get copyWith => _$TransactionDataCopyWithImpl<TransactionData>(this as TransactionData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionData&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,notes,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'TransactionData(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, notes: $notes, items: $items, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $TransactionDataCopyWith<$Res>  {
  factory $TransactionDataCopyWith(TransactionData value, $Res Function(TransactionData) _then) = _$TransactionDataCopyWithImpl;
@useResult
$Res call({
 TransactionType transactionType, int? supplierId, int? customerId, String? notes, List<TransactionItem> items, List<TransactionPayment>? paymentMethods
});




}
/// @nodoc
class _$TransactionDataCopyWithImpl<$Res>
    implements $TransactionDataCopyWith<$Res> {
  _$TransactionDataCopyWithImpl(this._self, this._then);

  final TransactionData _self;
  final $Res Function(TransactionData) _then;

/// Create a copy of TransactionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? notes = freezed,Object? items = null,Object? paymentMethods = freezed,}) {
  return _then(_self.copyWith(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItem>,paymentMethods: freezed == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<TransactionPayment>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionData].
extension TransactionDataPatterns on TransactionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionData value)  $default,){
final _that = this;
switch (_that) {
case _TransactionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionData value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionType transactionType,  int? supplierId,  int? customerId,  String? notes,  List<TransactionItem> items,  List<TransactionPayment>? paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionData() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.items,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionType transactionType,  int? supplierId,  int? customerId,  String? notes,  List<TransactionItem> items,  List<TransactionPayment>? paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _TransactionData():
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.items,_that.paymentMethods);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionType transactionType,  int? supplierId,  int? customerId,  String? notes,  List<TransactionItem> items,  List<TransactionPayment>? paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _TransactionData() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.items,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionData implements TransactionData {
  const _TransactionData({required this.transactionType, this.supplierId, this.customerId, this.notes, required final  List<TransactionItem> items, final  List<TransactionPayment>? paymentMethods}): _items = items,_paymentMethods = paymentMethods;
  

@override final  TransactionType transactionType;
@override final  int? supplierId;
@override final  int? customerId;
@override final  String? notes;
 final  List<TransactionItem> _items;
@override List<TransactionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<TransactionPayment>? _paymentMethods;
@override List<TransactionPayment>? get paymentMethods {
  final value = _paymentMethods;
  if (value == null) return null;
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDataCopyWith<_TransactionData> get copyWith => __$TransactionDataCopyWithImpl<_TransactionData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionData&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,notes,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'TransactionData(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, notes: $notes, items: $items, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$TransactionDataCopyWith<$Res> implements $TransactionDataCopyWith<$Res> {
  factory _$TransactionDataCopyWith(_TransactionData value, $Res Function(_TransactionData) _then) = __$TransactionDataCopyWithImpl;
@override @useResult
$Res call({
 TransactionType transactionType, int? supplierId, int? customerId, String? notes, List<TransactionItem> items, List<TransactionPayment>? paymentMethods
});




}
/// @nodoc
class __$TransactionDataCopyWithImpl<$Res>
    implements _$TransactionDataCopyWith<$Res> {
  __$TransactionDataCopyWithImpl(this._self, this._then);

  final _TransactionData _self;
  final $Res Function(_TransactionData) _then;

/// Create a copy of TransactionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? notes = freezed,Object? items = null,Object? paymentMethods = freezed,}) {
  return _then(_TransactionData(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItem>,paymentMethods: freezed == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<TransactionPayment>?,
  ));
}


}

// dart format on
