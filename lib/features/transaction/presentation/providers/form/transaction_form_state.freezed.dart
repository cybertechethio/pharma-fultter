// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionFormState {

 CreateTransRequest get request; List<String> get receiptFilePaths; Map<String, String> get paymentAttachmentFilePaths; Map<int, ItemWithBatches> get cartItems; Map<int, List<CreateTransactionBatchRequest>> get cartItemBatches; List<int> get itemIdsRequiringBatch;
/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionFormStateCopyWith<TransactionFormState> get copyWith => _$TransactionFormStateCopyWithImpl<TransactionFormState>(this as TransactionFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionFormState&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other.receiptFilePaths, receiptFilePaths)&&const DeepCollectionEquality().equals(other.paymentAttachmentFilePaths, paymentAttachmentFilePaths)&&const DeepCollectionEquality().equals(other.cartItems, cartItems)&&const DeepCollectionEquality().equals(other.cartItemBatches, cartItemBatches)&&const DeepCollectionEquality().equals(other.itemIdsRequiringBatch, itemIdsRequiringBatch));
}


@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(receiptFilePaths),const DeepCollectionEquality().hash(paymentAttachmentFilePaths),const DeepCollectionEquality().hash(cartItems),const DeepCollectionEquality().hash(cartItemBatches),const DeepCollectionEquality().hash(itemIdsRequiringBatch));

@override
String toString() {
  return 'TransactionFormState(request: $request, receiptFilePaths: $receiptFilePaths, paymentAttachmentFilePaths: $paymentAttachmentFilePaths, cartItems: $cartItems, cartItemBatches: $cartItemBatches, itemIdsRequiringBatch: $itemIdsRequiringBatch)';
}


}

/// @nodoc
abstract mixin class $TransactionFormStateCopyWith<$Res>  {
  factory $TransactionFormStateCopyWith(TransactionFormState value, $Res Function(TransactionFormState) _then) = _$TransactionFormStateCopyWithImpl;
@useResult
$Res call({
 CreateTransRequest request, List<String> receiptFilePaths, Map<String, String> paymentAttachmentFilePaths, Map<int, ItemWithBatches> cartItems, Map<int, List<CreateTransactionBatchRequest>> cartItemBatches, List<int> itemIdsRequiringBatch
});


$CreateTransRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TransactionFormStateCopyWithImpl<$Res>
    implements $TransactionFormStateCopyWith<$Res> {
  _$TransactionFormStateCopyWithImpl(this._self, this._then);

  final TransactionFormState _self;
  final $Res Function(TransactionFormState) _then;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,Object? receiptFilePaths = null,Object? paymentAttachmentFilePaths = null,Object? cartItems = null,Object? cartItemBatches = null,Object? itemIdsRequiringBatch = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateTransRequest,receiptFilePaths: null == receiptFilePaths ? _self.receiptFilePaths : receiptFilePaths // ignore: cast_nullable_to_non_nullable
as List<String>,paymentAttachmentFilePaths: null == paymentAttachmentFilePaths ? _self.paymentAttachmentFilePaths : paymentAttachmentFilePaths // ignore: cast_nullable_to_non_nullable
as Map<String, String>,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as Map<int, ItemWithBatches>,cartItemBatches: null == cartItemBatches ? _self.cartItemBatches : cartItemBatches // ignore: cast_nullable_to_non_nullable
as Map<int, List<CreateTransactionBatchRequest>>,itemIdsRequiringBatch: null == itemIdsRequiringBatch ? _self.itemIdsRequiringBatch : itemIdsRequiringBatch // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransRequestCopyWith<$Res> get request {
  
  return $CreateTransRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionFormState].
extension TransactionFormStatePatterns on TransactionFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionFormState value)  $default,){
final _that = this;
switch (_that) {
case _TransactionFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionFormState value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateTransRequest request,  List<String> receiptFilePaths,  Map<String, String> paymentAttachmentFilePaths,  Map<int, ItemWithBatches> cartItems,  Map<int, List<CreateTransactionBatchRequest>> cartItemBatches,  List<int> itemIdsRequiringBatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionFormState() when $default != null:
return $default(_that.request,_that.receiptFilePaths,_that.paymentAttachmentFilePaths,_that.cartItems,_that.cartItemBatches,_that.itemIdsRequiringBatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateTransRequest request,  List<String> receiptFilePaths,  Map<String, String> paymentAttachmentFilePaths,  Map<int, ItemWithBatches> cartItems,  Map<int, List<CreateTransactionBatchRequest>> cartItemBatches,  List<int> itemIdsRequiringBatch)  $default,) {final _that = this;
switch (_that) {
case _TransactionFormState():
return $default(_that.request,_that.receiptFilePaths,_that.paymentAttachmentFilePaths,_that.cartItems,_that.cartItemBatches,_that.itemIdsRequiringBatch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateTransRequest request,  List<String> receiptFilePaths,  Map<String, String> paymentAttachmentFilePaths,  Map<int, ItemWithBatches> cartItems,  Map<int, List<CreateTransactionBatchRequest>> cartItemBatches,  List<int> itemIdsRequiringBatch)?  $default,) {final _that = this;
switch (_that) {
case _TransactionFormState() when $default != null:
return $default(_that.request,_that.receiptFilePaths,_that.paymentAttachmentFilePaths,_that.cartItems,_that.cartItemBatches,_that.itemIdsRequiringBatch);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionFormState extends TransactionFormState {
  const _TransactionFormState({required this.request, final  List<String> receiptFilePaths = const [], final  Map<String, String> paymentAttachmentFilePaths = const {}, final  Map<int, ItemWithBatches> cartItems = const {}, final  Map<int, List<CreateTransactionBatchRequest>> cartItemBatches = const {}, final  List<int> itemIdsRequiringBatch = const []}): _receiptFilePaths = receiptFilePaths,_paymentAttachmentFilePaths = paymentAttachmentFilePaths,_cartItems = cartItems,_cartItemBatches = cartItemBatches,_itemIdsRequiringBatch = itemIdsRequiringBatch,super._();
  

@override final  CreateTransRequest request;
 final  List<String> _receiptFilePaths;
@override@JsonKey() List<String> get receiptFilePaths {
  if (_receiptFilePaths is EqualUnmodifiableListView) return _receiptFilePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receiptFilePaths);
}

 final  Map<String, String> _paymentAttachmentFilePaths;
@override@JsonKey() Map<String, String> get paymentAttachmentFilePaths {
  if (_paymentAttachmentFilePaths is EqualUnmodifiableMapView) return _paymentAttachmentFilePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentAttachmentFilePaths);
}

 final  Map<int, ItemWithBatches> _cartItems;
@override@JsonKey() Map<int, ItemWithBatches> get cartItems {
  if (_cartItems is EqualUnmodifiableMapView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cartItems);
}

 final  Map<int, List<CreateTransactionBatchRequest>> _cartItemBatches;
@override@JsonKey() Map<int, List<CreateTransactionBatchRequest>> get cartItemBatches {
  if (_cartItemBatches is EqualUnmodifiableMapView) return _cartItemBatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cartItemBatches);
}

 final  List<int> _itemIdsRequiringBatch;
@override@JsonKey() List<int> get itemIdsRequiringBatch {
  if (_itemIdsRequiringBatch is EqualUnmodifiableListView) return _itemIdsRequiringBatch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemIdsRequiringBatch);
}


/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionFormStateCopyWith<_TransactionFormState> get copyWith => __$TransactionFormStateCopyWithImpl<_TransactionFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionFormState&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other._receiptFilePaths, _receiptFilePaths)&&const DeepCollectionEquality().equals(other._paymentAttachmentFilePaths, _paymentAttachmentFilePaths)&&const DeepCollectionEquality().equals(other._cartItems, _cartItems)&&const DeepCollectionEquality().equals(other._cartItemBatches, _cartItemBatches)&&const DeepCollectionEquality().equals(other._itemIdsRequiringBatch, _itemIdsRequiringBatch));
}


@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(_receiptFilePaths),const DeepCollectionEquality().hash(_paymentAttachmentFilePaths),const DeepCollectionEquality().hash(_cartItems),const DeepCollectionEquality().hash(_cartItemBatches),const DeepCollectionEquality().hash(_itemIdsRequiringBatch));

@override
String toString() {
  return 'TransactionFormState(request: $request, receiptFilePaths: $receiptFilePaths, paymentAttachmentFilePaths: $paymentAttachmentFilePaths, cartItems: $cartItems, cartItemBatches: $cartItemBatches, itemIdsRequiringBatch: $itemIdsRequiringBatch)';
}


}

/// @nodoc
abstract mixin class _$TransactionFormStateCopyWith<$Res> implements $TransactionFormStateCopyWith<$Res> {
  factory _$TransactionFormStateCopyWith(_TransactionFormState value, $Res Function(_TransactionFormState) _then) = __$TransactionFormStateCopyWithImpl;
@override @useResult
$Res call({
 CreateTransRequest request, List<String> receiptFilePaths, Map<String, String> paymentAttachmentFilePaths, Map<int, ItemWithBatches> cartItems, Map<int, List<CreateTransactionBatchRequest>> cartItemBatches, List<int> itemIdsRequiringBatch
});


@override $CreateTransRequestCopyWith<$Res> get request;

}
/// @nodoc
class __$TransactionFormStateCopyWithImpl<$Res>
    implements _$TransactionFormStateCopyWith<$Res> {
  __$TransactionFormStateCopyWithImpl(this._self, this._then);

  final _TransactionFormState _self;
  final $Res Function(_TransactionFormState) _then;

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,Object? receiptFilePaths = null,Object? paymentAttachmentFilePaths = null,Object? cartItems = null,Object? cartItemBatches = null,Object? itemIdsRequiringBatch = null,}) {
  return _then(_TransactionFormState(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateTransRequest,receiptFilePaths: null == receiptFilePaths ? _self._receiptFilePaths : receiptFilePaths // ignore: cast_nullable_to_non_nullable
as List<String>,paymentAttachmentFilePaths: null == paymentAttachmentFilePaths ? _self._paymentAttachmentFilePaths : paymentAttachmentFilePaths // ignore: cast_nullable_to_non_nullable
as Map<String, String>,cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as Map<int, ItemWithBatches>,cartItemBatches: null == cartItemBatches ? _self._cartItemBatches : cartItemBatches // ignore: cast_nullable_to_non_nullable
as Map<int, List<CreateTransactionBatchRequest>>,itemIdsRequiringBatch: null == itemIdsRequiringBatch ? _self._itemIdsRequiringBatch : itemIdsRequiringBatch // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of TransactionFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransRequestCopyWith<$Res> get request {
  
  return $CreateTransRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
