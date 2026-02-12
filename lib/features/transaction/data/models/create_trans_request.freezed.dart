// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_trans_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransactionBatchRequest {

 String get batchNumber;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get quantity;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get costPrice;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? get unitPrice;
/// Create a copy of CreateTransactionBatchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionBatchRequestCopyWith<CreateTransactionBatchRequest> get copyWith => _$CreateTransactionBatchRequestCopyWithImpl<CreateTransactionBatchRequest>(this as CreateTransactionBatchRequest, _$identity);

  /// Serializes this CreateTransactionBatchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionBatchRequest&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice);

@override
String toString() {
  return 'CreateTransactionBatchRequest(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionBatchRequestCopyWith<$Res>  {
  factory $CreateTransactionBatchRequestCopyWith(CreateTransactionBatchRequest value, $Res Function(CreateTransactionBatchRequest) _then) = _$CreateTransactionBatchRequestCopyWithImpl;
@useResult
$Res call({
 String batchNumber,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice
});




}
/// @nodoc
class _$CreateTransactionBatchRequestCopyWithImpl<$Res>
    implements $CreateTransactionBatchRequestCopyWith<$Res> {
  _$CreateTransactionBatchRequestCopyWithImpl(this._self, this._then);

  final CreateTransactionBatchRequest _self;
  final $Res Function(CreateTransactionBatchRequest) _then;

/// Create a copy of CreateTransactionBatchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,}) {
  return _then(_self.copyWith(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionBatchRequest].
extension CreateTransactionBatchRequestPatterns on CreateTransactionBatchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionBatchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionBatchRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionBatchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String batchNumber, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String batchNumber, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest():
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String batchNumber, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable)  double? unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionBatchRequest() when $default != null:
return $default(_that.batchNumber,_that.quantity,_that.costPrice,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransactionBatchRequest implements CreateTransactionBatchRequest {
  const _CreateTransactionBatchRequest({required this.batchNumber, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.quantity, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.costPrice, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) this.unitPrice});
  factory _CreateTransactionBatchRequest.fromJson(Map<String, dynamic> json) => _$CreateTransactionBatchRequestFromJson(json);

@override final  String batchNumber;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int quantity;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? costPrice;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) final  double? unitPrice;

/// Create a copy of CreateTransactionBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionBatchRequestCopyWith<_CreateTransactionBatchRequest> get copyWith => __$CreateTransactionBatchRequestCopyWithImpl<_CreateTransactionBatchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionBatchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionBatchRequest&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,batchNumber,quantity,costPrice,unitPrice);

@override
String toString() {
  return 'CreateTransactionBatchRequest(batchNumber: $batchNumber, quantity: $quantity, costPrice: $costPrice, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionBatchRequestCopyWith<$Res> implements $CreateTransactionBatchRequestCopyWith<$Res> {
  factory _$CreateTransactionBatchRequestCopyWith(_CreateTransactionBatchRequest value, $Res Function(_CreateTransactionBatchRequest) _then) = __$CreateTransactionBatchRequestCopyWithImpl;
@override @useResult
$Res call({
 String batchNumber,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int quantity,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? costPrice,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamicNullable) double? unitPrice
});




}
/// @nodoc
class __$CreateTransactionBatchRequestCopyWithImpl<$Res>
    implements _$CreateTransactionBatchRequestCopyWith<$Res> {
  __$CreateTransactionBatchRequestCopyWithImpl(this._self, this._then);

  final _CreateTransactionBatchRequest _self;
  final $Res Function(_CreateTransactionBatchRequest) _then;

/// Create a copy of CreateTransactionBatchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batchNumber = null,Object? quantity = null,Object? costPrice = freezed,Object? unitPrice = freezed,}) {
  return _then(_CreateTransactionBatchRequest(
batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$CreateTransItemRequest {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get itemId; List<CreateTransactionBatchRequest> get batches;
/// Create a copy of CreateTransItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransItemRequestCopyWith<CreateTransItemRequest> get copyWith => _$CreateTransItemRequestCopyWithImpl<CreateTransItemRequest>(this as CreateTransItemRequest, _$identity);

  /// Serializes this CreateTransItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'CreateTransItemRequest(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $CreateTransItemRequestCopyWith<$Res>  {
  factory $CreateTransItemRequestCopyWith(CreateTransItemRequest value, $Res Function(CreateTransItemRequest) _then) = _$CreateTransItemRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int itemId, List<CreateTransactionBatchRequest> batches
});




}
/// @nodoc
class _$CreateTransItemRequestCopyWithImpl<$Res>
    implements $CreateTransItemRequestCopyWith<$Res> {
  _$CreateTransItemRequestCopyWithImpl(this._self, this._then);

  final CreateTransItemRequest _self;
  final $Res Function(CreateTransItemRequest) _then;

/// Create a copy of CreateTransItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<CreateTransactionBatchRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransItemRequest].
extension CreateTransItemRequestPatterns on CreateTransItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  List<CreateTransactionBatchRequest> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransItemRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  List<CreateTransactionBatchRequest> batches)  $default,) {final _that = this;
switch (_that) {
case _CreateTransItemRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  List<CreateTransactionBatchRequest> batches)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransItemRequest() when $default != null:
return $default(_that.itemId,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransItemRequest implements CreateTransItemRequest {
  const _CreateTransItemRequest({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.itemId, required final  List<CreateTransactionBatchRequest> batches}): _batches = batches;
  factory _CreateTransItemRequest.fromJson(Map<String, dynamic> json) => _$CreateTransItemRequestFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int itemId;
 final  List<CreateTransactionBatchRequest> _batches;
@override List<CreateTransactionBatchRequest> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of CreateTransItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransItemRequestCopyWith<_CreateTransItemRequest> get copyWith => __$CreateTransItemRequestCopyWithImpl<_CreateTransItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransItemRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'CreateTransItemRequest(itemId: $itemId, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$CreateTransItemRequestCopyWith<$Res> implements $CreateTransItemRequestCopyWith<$Res> {
  factory _$CreateTransItemRequestCopyWith(_CreateTransItemRequest value, $Res Function(_CreateTransItemRequest) _then) = __$CreateTransItemRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int itemId, List<CreateTransactionBatchRequest> batches
});




}
/// @nodoc
class __$CreateTransItemRequestCopyWithImpl<$Res>
    implements _$CreateTransItemRequestCopyWith<$Res> {
  __$CreateTransItemRequestCopyWithImpl(this._self, this._then);

  final _CreateTransItemRequest _self;
  final $Res Function(_CreateTransItemRequest) _then;

/// Create a copy of CreateTransItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? batches = null,}) {
  return _then(_CreateTransItemRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<CreateTransactionBatchRequest>,
  ));
}


}


/// @nodoc
mixin _$CreateTransRequest {

 TransactionType get transactionType;@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? get supplierId;@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? get customerId; String? get notes; List<String> get attachments; List<CreateTransItemRequest> get items; List<PaymentMethodModel>? get paymentMethods;
/// Create a copy of CreateTransRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransRequestCopyWith<CreateTransRequest> get copyWith => _$CreateTransRequestCopyWithImpl<CreateTransRequest>(this as CreateTransRequest, _$identity);

  /// Serializes this CreateTransRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransRequest&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,notes,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'CreateTransRequest(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, notes: $notes, attachments: $attachments, items: $items, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $CreateTransRequestCopyWith<$Res>  {
  factory $CreateTransRequestCopyWith(CreateTransRequest value, $Res Function(CreateTransRequest) _then) = _$CreateTransRequestCopyWithImpl;
@useResult
$Res call({
 TransactionType transactionType,@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? supplierId,@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? customerId, String? notes, List<String> attachments, List<CreateTransItemRequest> items, List<PaymentMethodModel>? paymentMethods
});




}
/// @nodoc
class _$CreateTransRequestCopyWithImpl<$Res>
    implements $CreateTransRequestCopyWith<$Res> {
  _$CreateTransRequestCopyWithImpl(this._self, this._then);

  final CreateTransRequest _self;
  final $Res Function(CreateTransRequest) _then;

/// Create a copy of CreateTransRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? notes = freezed,Object? attachments = null,Object? items = null,Object? paymentMethods = freezed,}) {
  return _then(_self.copyWith(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CreateTransItemRequest>,paymentMethods: freezed == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransRequest].
extension CreateTransRequestPatterns on CreateTransRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransactionType transactionType, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? supplierId, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? customerId,  String? notes,  List<String> attachments,  List<CreateTransItemRequest> items,  List<PaymentMethodModel>? paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransRequest() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.attachments,_that.items,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransactionType transactionType, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? supplierId, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? customerId,  String? notes,  List<String> attachments,  List<CreateTransItemRequest> items,  List<PaymentMethodModel>? paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _CreateTransRequest():
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.attachments,_that.items,_that.paymentMethods);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransactionType transactionType, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? supplierId, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable)  int? customerId,  String? notes,  List<String> attachments,  List<CreateTransItemRequest> items,  List<PaymentMethodModel>? paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransRequest() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.notes,_that.attachments,_that.items,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransRequest implements CreateTransRequest {
  const _CreateTransRequest({required this.transactionType, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) this.supplierId, @JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) this.customerId, this.notes, final  List<String> attachments = const [], required final  List<CreateTransItemRequest> items, final  List<PaymentMethodModel>? paymentMethods}): _attachments = attachments,_items = items,_paymentMethods = paymentMethods;
  factory _CreateTransRequest.fromJson(Map<String, dynamic> json) => _$CreateTransRequestFromJson(json);

@override final  TransactionType transactionType;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) final  int? supplierId;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) final  int? customerId;
@override final  String? notes;
 final  List<String> _attachments;
@override@JsonKey() List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  List<CreateTransItemRequest> _items;
@override List<CreateTransItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<PaymentMethodModel>? _paymentMethods;
@override List<PaymentMethodModel>? get paymentMethods {
  final value = _paymentMethods;
  if (value == null) return null;
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateTransRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransRequestCopyWith<_CreateTransRequest> get copyWith => __$CreateTransRequestCopyWithImpl<_CreateTransRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransRequest&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,notes,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'CreateTransRequest(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, notes: $notes, attachments: $attachments, items: $items, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$CreateTransRequestCopyWith<$Res> implements $CreateTransRequestCopyWith<$Res> {
  factory _$CreateTransRequestCopyWith(_CreateTransRequest value, $Res Function(_CreateTransRequest) _then) = __$CreateTransRequestCopyWithImpl;
@override @useResult
$Res call({
 TransactionType transactionType,@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? supplierId,@JsonKey(fromJson: JsonTypeConverters.intFromDynamicNullable) int? customerId, String? notes, List<String> attachments, List<CreateTransItemRequest> items, List<PaymentMethodModel>? paymentMethods
});




}
/// @nodoc
class __$CreateTransRequestCopyWithImpl<$Res>
    implements _$CreateTransRequestCopyWith<$Res> {
  __$CreateTransRequestCopyWithImpl(this._self, this._then);

  final _CreateTransRequest _self;
  final $Res Function(_CreateTransRequest) _then;

/// Create a copy of CreateTransRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? notes = freezed,Object? attachments = null,Object? items = null,Object? paymentMethods = freezed,}) {
  return _then(_CreateTransRequest(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CreateTransItemRequest>,paymentMethods: freezed == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodModel>?,
  ));
}


}

// dart format on
