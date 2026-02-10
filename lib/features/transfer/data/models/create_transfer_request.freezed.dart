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
mixin _$CreateTransferBatchRequest {

 String get batchNumber; int get quantity;
/// Create a copy of CreateTransferBatchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransferBatchRequestCopyWith<CreateTransferBatchRequest> get copyWith => _$CreateTransferBatchRequestCopyWithImpl<CreateTransferBatchRequest>(this as CreateTransferBatchRequest, _$identity);

  /// Serializes this CreateTransferBatchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransferBatchRequest&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity);

@override
String toString() {
  return 'CreateTransferBatchRequest(batchNumber: $batchNumber, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CreateTransferBatchRequestCopyWith<$Res>  {
  factory $CreateTransferBatchRequestCopyWith(CreateTransferBatchRequest value, $Res Function(CreateTransferBatchRequest) _then) = _$CreateTransferBatchRequestCopyWithImpl;
@useResult
$Res call({
 String batchNumber, int quantity
});




}
/// @nodoc
class _$CreateTransferBatchRequestCopyWithImpl<$Res>
    implements $CreateTransferBatchRequestCopyWith<$Res> {
  _$CreateTransferBatchRequestCopyWithImpl(this._self, this._then);

  final CreateTransferBatchRequest _self;
  final $Res Function(CreateTransferBatchRequest) _then;

/// Create a copy of CreateTransferBatchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransferBatchRequest].
extension CreateTransferBatchRequestPatterns on CreateTransferBatchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransferBatchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransferBatchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransferBatchRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransferBatchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransferBatchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransferBatchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransferBatchRequest() when $default != null:
return $default(_that.batchNumber,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CreateTransferBatchRequest():
return $default(_that.batchNumber,_that.quantity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransferBatchRequest() when $default != null:
return $default(_that.batchNumber,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransferBatchRequest implements CreateTransferBatchRequest {
  const _CreateTransferBatchRequest({required this.batchNumber, required this.quantity});
  factory _CreateTransferBatchRequest.fromJson(Map<String, dynamic> json) => _$CreateTransferBatchRequestFromJson(json);

@override final  String batchNumber;
@override final  int quantity;

/// Create a copy of CreateTransferBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransferBatchRequestCopyWith<_CreateTransferBatchRequest> get copyWith => __$CreateTransferBatchRequestCopyWithImpl<_CreateTransferBatchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransferBatchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransferBatchRequest&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity);

@override
String toString() {
  return 'CreateTransferBatchRequest(batchNumber: $batchNumber, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CreateTransferBatchRequestCopyWith<$Res> implements $CreateTransferBatchRequestCopyWith<$Res> {
  factory _$CreateTransferBatchRequestCopyWith(_CreateTransferBatchRequest value, $Res Function(_CreateTransferBatchRequest) _then) = __$CreateTransferBatchRequestCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber, int quantity
});




}
/// @nodoc
class __$CreateTransferBatchRequestCopyWithImpl<$Res>
    implements _$CreateTransferBatchRequestCopyWith<$Res> {
  __$CreateTransferBatchRequestCopyWithImpl(this._self, this._then);

  final _CreateTransferBatchRequest _self;
  final $Res Function(_CreateTransferBatchRequest) _then;

/// Create a copy of CreateTransferBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = null,}) {
  return _then(_CreateTransferBatchRequest(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateTransferItemRequest {

 int get itemId; List<CreateTransferBatchRequest> get batches;
/// Create a copy of CreateTransferItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransferItemRequestCopyWith<CreateTransferItemRequest> get copyWith => _$CreateTransferItemRequestCopyWithImpl<CreateTransferItemRequest>(this as CreateTransferItemRequest, _$identity);

  /// Serializes this CreateTransferItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransferItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'CreateTransferItemRequest(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $CreateTransferItemRequestCopyWith<$Res>  {
  factory $CreateTransferItemRequestCopyWith(CreateTransferItemRequest value, $Res Function(CreateTransferItemRequest) _then) = _$CreateTransferItemRequestCopyWithImpl;
@useResult
$Res call({
 int itemId, List<CreateTransferBatchRequest> batches
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
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<CreateTransferBatchRequest>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemId,  List<CreateTransferBatchRequest> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
return $default(_that.itemId,_that.batches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemId,  List<CreateTransferBatchRequest> batches)  $default,) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest():
return $default(_that.itemId,_that.batches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemId,  List<CreateTransferBatchRequest> batches)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransferItemRequest() when $default != null:
return $default(_that.itemId,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransferItemRequest implements CreateTransferItemRequest {
  const _CreateTransferItemRequest({required this.itemId, required final  List<CreateTransferBatchRequest> batches}): _batches = batches;
  factory _CreateTransferItemRequest.fromJson(Map<String, dynamic> json) => _$CreateTransferItemRequestFromJson(json);

@override final  int itemId;
 final  List<CreateTransferBatchRequest> _batches;
@override List<CreateTransferBatchRequest> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransferItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'CreateTransferItemRequest(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$CreateTransferItemRequestCopyWith<$Res> implements $CreateTransferItemRequestCopyWith<$Res> {
  factory _$CreateTransferItemRequestCopyWith(_CreateTransferItemRequest value, $Res Function(_CreateTransferItemRequest) _then) = __$CreateTransferItemRequestCopyWithImpl;
@override @useResult
$Res call({
 int itemId, List<CreateTransferBatchRequest> batches
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
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_CreateTransferItemRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<CreateTransferBatchRequest>,
  ));
}


}


/// @nodoc
mixin _$CreateTransferRequest {

 int get destinationBranchId; String? get notes; List<CreateTransferItemRequest> get items;
/// Create a copy of CreateTransferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransferRequestCopyWith<CreateTransferRequest> get copyWith => _$CreateTransferRequestCopyWithImpl<CreateTransferRequest>(this as CreateTransferRequest, _$identity);

  /// Serializes this CreateTransferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransferRequest&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,notes,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CreateTransferRequest(destinationBranchId: $destinationBranchId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class $CreateTransferRequestCopyWith<$Res>  {
  factory $CreateTransferRequestCopyWith(CreateTransferRequest value, $Res Function(CreateTransferRequest) _then) = _$CreateTransferRequestCopyWithImpl;
@useResult
$Res call({
 int destinationBranchId, String? notes, List<CreateTransferItemRequest> items
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
@pragma('vm:prefer-inline') @override $Res call({Object? destinationBranchId = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
return $default(_that.destinationBranchId,_that.notes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)  $default,) {final _that = this;
switch (_that) {
case _CreateTransferRequest():
return $default(_that.destinationBranchId,_that.notes,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int destinationBranchId,  String? notes,  List<CreateTransferItemRequest> items)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransferRequest() when $default != null:
return $default(_that.destinationBranchId,_that.notes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransferRequest implements CreateTransferRequest {
  const _CreateTransferRequest({required this.destinationBranchId, this.notes, required final  List<CreateTransferItemRequest> items}): _items = items;
  factory _CreateTransferRequest.fromJson(Map<String, dynamic> json) => _$CreateTransferRequestFromJson(json);

@override final  int destinationBranchId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransferRequest&&(identical(other.destinationBranchId, destinationBranchId) || other.destinationBranchId == destinationBranchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationBranchId,notes,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CreateTransferRequest(destinationBranchId: $destinationBranchId, notes: $notes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CreateTransferRequestCopyWith<$Res> implements $CreateTransferRequestCopyWith<$Res> {
  factory _$CreateTransferRequestCopyWith(_CreateTransferRequest value, $Res Function(_CreateTransferRequest) _then) = __$CreateTransferRequestCopyWithImpl;
@override @useResult
$Res call({
 int destinationBranchId, String? notes, List<CreateTransferItemRequest> items
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
@override @pragma('vm:prefer-inline') $Res call({Object? destinationBranchId = null,Object? notes = freezed,Object? items = null,}) {
  return _then(_CreateTransferRequest(
destinationBranchId: null == destinationBranchId ? _self.destinationBranchId : destinationBranchId // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateTransferItemRequest>,
  ));
}


}

// dart format on
