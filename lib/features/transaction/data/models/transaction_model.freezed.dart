// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionModel {

@JsonKey(toJson: _transactionTypeToJson) TransactionType get transactionType; int? get supplierId; int? get customerId; int? get branchId; String? get notes; List<TransactionItemModel> get items; List<TransactionPaymentModel>? get paymentMethods; List<String>? get attachments;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,branchId,notes,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(paymentMethods),const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'TransactionModel(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, branchId: $branchId, notes: $notes, items: $items, paymentMethods: $paymentMethods, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: _transactionTypeToJson) TransactionType transactionType, int? supplierId, int? customerId, int? branchId, String? notes, List<TransactionItemModel> items, List<TransactionPaymentModel>? paymentMethods, List<String>? attachments
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? branchId = freezed,Object? notes = freezed,Object? items = null,Object? paymentMethods = freezed,Object? attachments = freezed,}) {
  return _then(_self.copyWith(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,paymentMethods: freezed == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<TransactionPaymentModel>?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: _transactionTypeToJson)  TransactionType transactionType,  int? supplierId,  int? customerId,  int? branchId,  String? notes,  List<TransactionItemModel> items,  List<TransactionPaymentModel>? paymentMethods,  List<String>? attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.branchId,_that.notes,_that.items,_that.paymentMethods,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: _transactionTypeToJson)  TransactionType transactionType,  int? supplierId,  int? customerId,  int? branchId,  String? notes,  List<TransactionItemModel> items,  List<TransactionPaymentModel>? paymentMethods,  List<String>? attachments)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.branchId,_that.notes,_that.items,_that.paymentMethods,_that.attachments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: _transactionTypeToJson)  TransactionType transactionType,  int? supplierId,  int? customerId,  int? branchId,  String? notes,  List<TransactionItemModel> items,  List<TransactionPaymentModel>? paymentMethods,  List<String>? attachments)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.transactionType,_that.supplierId,_that.customerId,_that.branchId,_that.notes,_that.items,_that.paymentMethods,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
  const _TransactionModel({@JsonKey(toJson: _transactionTypeToJson) required this.transactionType, this.supplierId, this.customerId, this.branchId, this.notes, required final  List<TransactionItemModel> items, final  List<TransactionPaymentModel>? paymentMethods, final  List<String>? attachments}): _items = items,_paymentMethods = paymentMethods,_attachments = attachments;
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override@JsonKey(toJson: _transactionTypeToJson) final  TransactionType transactionType;
@override final  int? supplierId;
@override final  int? customerId;
@override final  int? branchId;
@override final  String? notes;
 final  List<TransactionItemModel> _items;
@override List<TransactionItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<TransactionPaymentModel>? _paymentMethods;
@override List<TransactionPaymentModel>? get paymentMethods {
  final value = _paymentMethods;
  if (value == null) return null;
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionType,supplierId,customerId,branchId,notes,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_paymentMethods),const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'TransactionModel(transactionType: $transactionType, supplierId: $supplierId, customerId: $customerId, branchId: $branchId, notes: $notes, items: $items, paymentMethods: $paymentMethods, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: _transactionTypeToJson) TransactionType transactionType, int? supplierId, int? customerId, int? branchId, String? notes, List<TransactionItemModel> items, List<TransactionPaymentModel>? paymentMethods, List<String>? attachments
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionType = null,Object? supplierId = freezed,Object? customerId = freezed,Object? branchId = freezed,Object? notes = freezed,Object? items = null,Object? paymentMethods = freezed,Object? attachments = freezed,}) {
  return _then(_TransactionModel(
transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel>,paymentMethods: freezed == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<TransactionPaymentModel>?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
