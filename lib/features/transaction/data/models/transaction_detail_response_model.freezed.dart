// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionDetailResponseModel {

// All fields from TransactionResponseModel
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id;@JsonKey(fromJson: _transactionTypeFromJson) TransactionType get transactionType; String get transactionNumber; String get status;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get subtotal;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalTax;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount; String? get notes;@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime get createdAt; String? get creatorName; String? get supplierName; String? get customerName;// Additional detail fields
 List<String> get attachments; PaymentDetailModel? get payment; List<TransactionItemDetailModel> get transactionItems;
/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDetailResponseModelCopyWith<TransactionDetailResponseModel> get copyWith => _$TransactionDetailResponseModelCopyWithImpl<TransactionDetailResponseModel>(this as TransactionDetailResponseModel, _$identity);

  /// Serializes this TransactionDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDetailResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other.transactionItems, transactionItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionType,transactionNumber,status,subtotal,totalTax,totalAmount,notes,createdAt,creatorName,supplierName,customerName,const DeepCollectionEquality().hash(attachments),payment,const DeepCollectionEquality().hash(transactionItems));

@override
String toString() {
  return 'TransactionDetailResponseModel(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt, creatorName: $creatorName, supplierName: $supplierName, customerName: $customerName, attachments: $attachments, payment: $payment, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class $TransactionDetailResponseModelCopyWith<$Res>  {
  factory $TransactionDetailResponseModelCopyWith(TransactionDetailResponseModel value, $Res Function(TransactionDetailResponseModel) _then) = _$TransactionDetailResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: _transactionTypeFromJson) TransactionType transactionType, String transactionNumber, String status,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double subtotal,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalTax,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount, String? notes,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt, String? creatorName, String? supplierName, String? customerName, List<String> attachments, PaymentDetailModel? payment, List<TransactionItemDetailModel> transactionItems
});


$PaymentDetailModelCopyWith<$Res>? get payment;

}
/// @nodoc
class _$TransactionDetailResponseModelCopyWithImpl<$Res>
    implements $TransactionDetailResponseModelCopyWith<$Res> {
  _$TransactionDetailResponseModelCopyWithImpl(this._self, this._then);

  final TransactionDetailResponseModel _self;
  final $Res Function(TransactionDetailResponseModel) _then;

/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? createdAt = null,Object? creatorName = freezed,Object? supplierName = freezed,Object? customerName = freezed,Object? attachments = null,Object? payment = freezed,Object? transactionItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentDetailModel?,transactionItems: null == transactionItems ? _self.transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionItemDetailModel>,
  ));
}
/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDetailModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionDetailResponseModel].
extension TransactionDetailResponseModelPatterns on TransactionDetailResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDetailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDetailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDetailResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDetailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _transactionTypeFromJson)  TransactionType transactionType,  String transactionNumber,  String status, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double subtotal, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount,  String? notes, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName,  List<String> attachments,  PaymentDetailModel? payment,  List<TransactionItemDetailModel> transactionItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDetailResponseModel() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName,_that.attachments,_that.payment,_that.transactionItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _transactionTypeFromJson)  TransactionType transactionType,  String transactionNumber,  String status, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double subtotal, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount,  String? notes, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName,  List<String> attachments,  PaymentDetailModel? payment,  List<TransactionItemDetailModel> transactionItems)  $default,) {final _that = this;
switch (_that) {
case _TransactionDetailResponseModel():
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName,_that.attachments,_that.payment,_that.transactionItems);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: _transactionTypeFromJson)  TransactionType transactionType,  String transactionNumber,  String status, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double subtotal, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount,  String? notes, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt,  String? creatorName,  String? supplierName,  String? customerName,  List<String> attachments,  PaymentDetailModel? payment,  List<TransactionItemDetailModel> transactionItems)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDetailResponseModel() when $default != null:
return $default(_that.id,_that.transactionType,_that.transactionNumber,_that.status,_that.subtotal,_that.totalTax,_that.totalAmount,_that.notes,_that.createdAt,_that.creatorName,_that.supplierName,_that.customerName,_that.attachments,_that.payment,_that.transactionItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDetailResponseModel implements TransactionDetailResponseModel {
  const _TransactionDetailResponseModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, @JsonKey(fromJson: _transactionTypeFromJson) required this.transactionType, required this.transactionNumber, required this.status, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.subtotal, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalTax, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, this.notes, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) required this.createdAt, this.creatorName, this.supplierName, this.customerName, required final  List<String> attachments, this.payment, required final  List<TransactionItemDetailModel> transactionItems}): _attachments = attachments,_transactionItems = transactionItems;
  factory _TransactionDetailResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionDetailResponseModelFromJson(json);

// All fields from TransactionResponseModel
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override@JsonKey(fromJson: _transactionTypeFromJson) final  TransactionType transactionType;
@override final  String transactionNumber;
@override final  String status;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double subtotal;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalTax;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override final  String? notes;
@override@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) final  DateTime createdAt;
@override final  String? creatorName;
@override final  String? supplierName;
@override final  String? customerName;
// Additional detail fields
 final  List<String> _attachments;
// Additional detail fields
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  PaymentDetailModel? payment;
 final  List<TransactionItemDetailModel> _transactionItems;
@override List<TransactionItemDetailModel> get transactionItems {
  if (_transactionItems is EqualUnmodifiableListView) return _transactionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionItems);
}


/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDetailResponseModelCopyWith<_TransactionDetailResponseModel> get copyWith => __$TransactionDetailResponseModelCopyWithImpl<_TransactionDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDetailResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionNumber, transactionNumber) || other.transactionNumber == transactionNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.payment, payment) || other.payment == payment)&&const DeepCollectionEquality().equals(other._transactionItems, _transactionItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionType,transactionNumber,status,subtotal,totalTax,totalAmount,notes,createdAt,creatorName,supplierName,customerName,const DeepCollectionEquality().hash(_attachments),payment,const DeepCollectionEquality().hash(_transactionItems));

@override
String toString() {
  return 'TransactionDetailResponseModel(id: $id, transactionType: $transactionType, transactionNumber: $transactionNumber, status: $status, subtotal: $subtotal, totalTax: $totalTax, totalAmount: $totalAmount, notes: $notes, createdAt: $createdAt, creatorName: $creatorName, supplierName: $supplierName, customerName: $customerName, attachments: $attachments, payment: $payment, transactionItems: $transactionItems)';
}


}

/// @nodoc
abstract mixin class _$TransactionDetailResponseModelCopyWith<$Res> implements $TransactionDetailResponseModelCopyWith<$Res> {
  factory _$TransactionDetailResponseModelCopyWith(_TransactionDetailResponseModel value, $Res Function(_TransactionDetailResponseModel) _then) = __$TransactionDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: _transactionTypeFromJson) TransactionType transactionType, String transactionNumber, String status,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double subtotal,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalTax,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount, String? notes,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt, String? creatorName, String? supplierName, String? customerName, List<String> attachments, PaymentDetailModel? payment, List<TransactionItemDetailModel> transactionItems
});


@override $PaymentDetailModelCopyWith<$Res>? get payment;

}
/// @nodoc
class __$TransactionDetailResponseModelCopyWithImpl<$Res>
    implements _$TransactionDetailResponseModelCopyWith<$Res> {
  __$TransactionDetailResponseModelCopyWithImpl(this._self, this._then);

  final _TransactionDetailResponseModel _self;
  final $Res Function(_TransactionDetailResponseModel) _then;

/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionType = null,Object? transactionNumber = null,Object? status = null,Object? subtotal = null,Object? totalTax = null,Object? totalAmount = null,Object? notes = freezed,Object? createdAt = null,Object? creatorName = freezed,Object? supplierName = freezed,Object? customerName = freezed,Object? attachments = null,Object? payment = freezed,Object? transactionItems = null,}) {
  return _then(_TransactionDetailResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TransactionType,transactionNumber: null == transactionNumber ? _self.transactionNumber : transactionNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentDetailModel?,transactionItems: null == transactionItems ? _self._transactionItems : transactionItems // ignore: cast_nullable_to_non_nullable
as List<TransactionItemDetailModel>,
  ));
}

/// Create a copy of TransactionDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentDetailModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

// dart format on
