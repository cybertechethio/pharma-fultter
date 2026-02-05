// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransferFormState {

 CreateTransferRequest get request; Map<int, Item> get cartItems;// itemId -> Item for display
 Map<int, int> get cartQuantities;
/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferFormStateCopyWith<TransferFormState> get copyWith => _$TransferFormStateCopyWithImpl<TransferFormState>(this as TransferFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferFormState&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other.cartItems, cartItems)&&const DeepCollectionEquality().equals(other.cartQuantities, cartQuantities));
}


@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(cartItems),const DeepCollectionEquality().hash(cartQuantities));

@override
String toString() {
  return 'TransferFormState(request: $request, cartItems: $cartItems, cartQuantities: $cartQuantities)';
}


}

/// @nodoc
abstract mixin class $TransferFormStateCopyWith<$Res>  {
  factory $TransferFormStateCopyWith(TransferFormState value, $Res Function(TransferFormState) _then) = _$TransferFormStateCopyWithImpl;
@useResult
$Res call({
 CreateTransferRequest request, Map<int, Item> cartItems, Map<int, int> cartQuantities
});


$CreateTransferRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TransferFormStateCopyWithImpl<$Res>
    implements $TransferFormStateCopyWith<$Res> {
  _$TransferFormStateCopyWithImpl(this._self, this._then);

  final TransferFormState _self;
  final $Res Function(TransferFormState) _then;

/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,Object? cartItems = null,Object? cartQuantities = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateTransferRequest,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as Map<int, Item>,cartQuantities: null == cartQuantities ? _self.cartQuantities : cartQuantities // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}
/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransferRequestCopyWith<$Res> get request {
  
  return $CreateTransferRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransferFormState].
extension TransferFormStatePatterns on TransferFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferFormState value)  $default,){
final _that = this;
switch (_that) {
case _TransferFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferFormState value)?  $default,){
final _that = this;
switch (_that) {
case _TransferFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateTransferRequest request,  Map<int, Item> cartItems,  Map<int, int> cartQuantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferFormState() when $default != null:
return $default(_that.request,_that.cartItems,_that.cartQuantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateTransferRequest request,  Map<int, Item> cartItems,  Map<int, int> cartQuantities)  $default,) {final _that = this;
switch (_that) {
case _TransferFormState():
return $default(_that.request,_that.cartItems,_that.cartQuantities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateTransferRequest request,  Map<int, Item> cartItems,  Map<int, int> cartQuantities)?  $default,) {final _that = this;
switch (_that) {
case _TransferFormState() when $default != null:
return $default(_that.request,_that.cartItems,_that.cartQuantities);case _:
  return null;

}
}

}

/// @nodoc


class _TransferFormState extends TransferFormState {
  const _TransferFormState({required this.request, final  Map<int, Item> cartItems = const {}, final  Map<int, int> cartQuantities = const {}}): _cartItems = cartItems,_cartQuantities = cartQuantities,super._();
  

@override final  CreateTransferRequest request;
 final  Map<int, Item> _cartItems;
@override@JsonKey() Map<int, Item> get cartItems {
  if (_cartItems is EqualUnmodifiableMapView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cartItems);
}

// itemId -> Item for display
 final  Map<int, int> _cartQuantities;
// itemId -> Item for display
@override@JsonKey() Map<int, int> get cartQuantities {
  if (_cartQuantities is EqualUnmodifiableMapView) return _cartQuantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cartQuantities);
}


/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferFormStateCopyWith<_TransferFormState> get copyWith => __$TransferFormStateCopyWithImpl<_TransferFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferFormState&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other._cartItems, _cartItems)&&const DeepCollectionEquality().equals(other._cartQuantities, _cartQuantities));
}


@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(_cartItems),const DeepCollectionEquality().hash(_cartQuantities));

@override
String toString() {
  return 'TransferFormState(request: $request, cartItems: $cartItems, cartQuantities: $cartQuantities)';
}


}

/// @nodoc
abstract mixin class _$TransferFormStateCopyWith<$Res> implements $TransferFormStateCopyWith<$Res> {
  factory _$TransferFormStateCopyWith(_TransferFormState value, $Res Function(_TransferFormState) _then) = __$TransferFormStateCopyWithImpl;
@override @useResult
$Res call({
 CreateTransferRequest request, Map<int, Item> cartItems, Map<int, int> cartQuantities
});


@override $CreateTransferRequestCopyWith<$Res> get request;

}
/// @nodoc
class __$TransferFormStateCopyWithImpl<$Res>
    implements _$TransferFormStateCopyWith<$Res> {
  __$TransferFormStateCopyWithImpl(this._self, this._then);

  final _TransferFormState _self;
  final $Res Function(_TransferFormState) _then;

/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,Object? cartItems = null,Object? cartQuantities = null,}) {
  return _then(_TransferFormState(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateTransferRequest,cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as Map<int, Item>,cartQuantities: null == cartQuantities ? _self._cartQuantities : cartQuantities // ignore: cast_nullable_to_non_nullable
as Map<int, int>,
  ));
}

/// Create a copy of TransferFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransferRequestCopyWith<$Res> get request {
  
  return $CreateTransferRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
