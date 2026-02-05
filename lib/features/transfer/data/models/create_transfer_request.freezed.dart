// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransferItemRequest {

 int get itemId;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity;
/// Create a copy of CreateTransferItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransferItemRequestCopyWith<CreateTransferItemRequest> get copyWith => _$CreateTransferItemRequestCopyWithImpl<CreateTransferItemRequest>(this as CreateTransferItemRequest, _$identity);

  /// Serializes this CreateTransferItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransferItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,quantity);

@override
String toString() {
  return 'CreateTransferItemRequest(itemId: $itemId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CreateTransferItemRequestCopyWith<$Res>  {
  factory $CreateTransferItemRequestCopyWith(CreateTransferItemRequest value, $Res Function(CreateTransferItemRequest) _then) = _$CreateTransferItemRequestCopyWithImpl;
@useResult
$Res call({
 int itemId,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity
});




}
/// @nodoc
class _$CreateTransferItemRequestCopyWithImpl<$Res>
    implements $CreateTransferItemRequestCopyWith<$Res> {
  _$CreateTransferItemRequestCopyWithImpl(this._self, this._then);

  final CreateTransferItemRequest _self;
  final $Res Function(CreateTransferItemRequest) _then;

/// Create a copy of CreateTransferItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransferItemRequest].
extension CreateTransferItemRequestPatterns on CreateTransferItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransferItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransferItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransferItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransferItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
return $default(_that.itemId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity)  $default,) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest():
return $default(_that.itemId,_that.quantity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
return $default(_that.itemId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransferItemRequest implements CreateTransferItemRequest {
  const _CreateTransferItemRequest({required this.itemId, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity});
  factory _CreateTransferItemRequest.fromJson(Map<String, dynamic> json) => _$CreateTransferItemRequestFromJson(json);

@override final  int itemId;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;

/// Create a copy of CreateTransferItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransferItemRequestCopyWith<_CreateTransferItemRequest> get copyWith => __$CreateTransferItemRequestCopyWithImpl<_CreateTransferItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransferItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransferItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,quantity);

@override
String toString() {
  return 'CreateTransferItemRequest(itemId: $itemId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CreateTransferItemRequestCopyWith<$Res> implements $CreateTransferItemRequestCopyWith<$Res> {
  factory _$CreateTransferItemRequestCopyWith(_CreateTransferItemRequest value, $Res Function(_CreateTransferItemRequest) _then) = __$CreateTransferItemRequestCopyWithImpl;
@override @useResult
$Res call({
 int itemId,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity
});




}
/// @nodoc
class __$CreateTransferItemRequestCopyWithImpl<$Res>
    implements _$CreateTransferItemRequestCopyWith<$Res> {
  __$CreateTransferItemRequestCopyWithImpl(this._self, this._then);

  final _CreateTransferItemRequest _self;
  final $Res Function(_CreateTransferItemRequest) _then;

/// Create a copy of CreateTransferItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? quantity = null,}) {
  return _then(_CreateTransferItemRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CreateTransferRequest {

 TransferType get transferType; int? get destinationBranchId; String? get notes; List<CreateTransferItemRequest> get items;
/// Create a copy of CreateTransferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransferRequestCopyWith<CreateTransferRequest> get copyWith => _$CreateTransferRequestCopyWithImpl<CreateTransferRequest>(this as CreateTransferRequest, _$identity);

  /// Serializes this CreateTransferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransferRequest&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transferType,destinationBranchId,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreateTransferRequest(transferType: $transferType, destinationBranchId: $destinationBranchId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreateTransferRequestCopyWith<$Res>  {
  factory $CreateTransferRequestCopyWith(CreateTransferRequest value, $Res Function(CreateTransferRequest) _then) = _$CreateTransferRequestCopyWithImpl;
@useResult
$Res call({
 TransferType transferType, int? destinationBranchId, String? notes, List<CreateTransferItemRequest> items
});




}
/// @nodoc
class _$CreateTransferRequestCopyWithImpl<$Res>
    implements $CreateTransferRequestCopyWith<$Res> {
  _$CreateTransferRequestCopyWithImpl(this._self, this._then);

  final CreateTransferRequest _self;
  final $Res Function(CreateTransferRequest) _then;

/// Create a copy of CreateTransferRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transferType = null,Object? destinationBranchId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as TransferType,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CreateTransferItemRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransferRequest].
extension CreateTransferRequestPatterns on CreateTransferRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransferRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransferRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransferRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransferRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransferType transferType,  int? destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
return $default(_that.transferType,_that.destinationBranchId,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransferType transferType,  int? destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)  $default,) {final _that = this;
switch (_that) {
case _CreateTransferRequest():
return $default(_that.transferType,_that.destinationBranchId,_that.notes,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransferType transferType,  int? destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
return $default(_that.transferType,_that.destinationBranchId,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransferRequest implements CreateTransferRequest {
  const _CreateTransferRequest({required this.transferType, this.destinationBranchId, this.notes, required final  List<CreateTransferItemRequest> items}): _items = items;
  factory _CreateTransferRequest.fromJson(Map<String, dynamic> json) => _$CreateTransferRequestFromJson(json);

@override final  TransferType transferType;
@override final  int? destinationBranchId;
@override final  String? notes;
 final  List<CreateTransferItemRequest> _items;
@override List<CreateTransferItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CreateTransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransferRequestCopyWith<_CreateTransferRequest> get copyWith => __$CreateTransferRequestCopyWithImpl<_CreateTransferRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransferRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransferRequest&&(identical(other.transferType, transferType) || other.transferType == transferType)&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transferType,destinationBranchId,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreateTransferRequest(transferType: $transferType, destinationBranchId: $destinationBranchId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreateTransferRequestCopyWith<$Res> implements $CreateTransferRequestCopyWith<$Res> {
  factory _$CreateTransferRequestCopyWith(_CreateTransferRequest value, $Res Function(_CreateTransferRequest) _then) = __$CreateTransferRequestCopyWithImpl;
@override @useResult
$Res call({
 TransferType transferType, int? destinationBranchId, String? notes, List<CreateTransferItemRequest> items
});




}
/// @nodoc
class __$CreateTransferRequestCopyWithImpl<$Res>
    implements _$CreateTransferRequestCopyWith<$Res> {
  __$CreateTransferRequestCopyWithImpl(this._self, this._then);

  final _CreateTransferRequest _self;
  final $Res Function(_CreateTransferRequest) _then;

/// Create a copy of CreateTransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transferType = null,Object? destinationBranchId = freezed,Object? notes = freezed,Object? items = null,}) {
  return _then(_CreateTransferRequest(
transferType: null == transferType ? _self.transferType : transferType // ignore: cast_nullable_to_non_nullable
as TransferType,destinationBranchId: freezed == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateTransferItemRequest>,
  ));
}


}

// dart format on
