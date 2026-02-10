// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseDetail {

 String get id; DateTime get expenseDate; String get name; String get amount; String? get notes; List<String> get attachments; String? get status; DateTime get createdAt; DateTime? get updatedAt; List<ExpensePayment> get expensePayments;
/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseDetailCopyWith<ExpenseDetail> get copyWith => _$ExpenseDetailCopyWithImpl<ExpenseDetail>(this as ExpenseDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.expensePayments, expensePayments));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseDate,name,amount,notes,const DeepCollectionEquality().hash(attachments),status,createdAt,updatedAt,const DeepCollectionEquality().hash(expensePayments));

@override
String toString() {
  return 'ExpenseDetail(id: $id, expenseDate: $expenseDate, name: $name, amount: $amount, notes: $notes, attachments: $attachments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, expensePayments: $expensePayments)';
}


}

/// @nodoc
abstract mixin class $ExpenseDetailCopyWith<$Res>  {
  factory $ExpenseDetailCopyWith(ExpenseDetail value, $Res Function(ExpenseDetail) _then) = _$ExpenseDetailCopyWithImpl;
@useResult
$Res call({
 String id, DateTime expenseDate, String name, String amount, String? notes, List<String> attachments, String? status, DateTime createdAt, DateTime? updatedAt, List<ExpensePayment> expensePayments
});




}
/// @nodoc
class _$ExpenseDetailCopyWithImpl<$Res>
    implements $ExpenseDetailCopyWith<$Res> {
  _$ExpenseDetailCopyWithImpl(this._self, this._then);

  final ExpenseDetail _self;
  final $Res Function(ExpenseDetail) _then;

/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseDate = null,Object? name = null,Object? amount = null,Object? notes = freezed,Object? attachments = null,Object? status = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? expensePayments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expensePayments: null == expensePayments ? _self.expensePayments : expensePayments // ignore: cast_nullable_to_non_nullable
as List<ExpensePayment>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseDetail].
extension ExpenseDetailPatterns on ExpenseDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseDetail value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime expenseDate,  String name,  String amount,  String? notes,  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  List<ExpensePayment> expensePayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
return $default(_that.id,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.expensePayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime expenseDate,  String name,  String amount,  String? notes,  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  List<ExpensePayment> expensePayments)  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetail():
return $default(_that.id,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.expensePayments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime expenseDate,  String name,  String amount,  String? notes,  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  List<ExpensePayment> expensePayments)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetail() when $default != null:
return $default(_that.id,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.expensePayments);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseDetail implements ExpenseDetail {
  const _ExpenseDetail({required this.id, required this.expenseDate, required this.name, required this.amount, this.notes, required final  List<String> attachments, this.status, required this.createdAt, this.updatedAt, required final  List<ExpensePayment> expensePayments}): _attachments = attachments,_expensePayments = expensePayments;
  

@override final  String id;
@override final  DateTime expenseDate;
@override final  String name;
@override final  String amount;
@override final  String? notes;
 final  List<String> _attachments;
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  String? status;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
 final  List<ExpensePayment> _expensePayments;
@override List<ExpensePayment> get expensePayments {
  if (_expensePayments is EqualUnmodifiableListView) return _expensePayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expensePayments);
}


/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseDetailCopyWith<_ExpenseDetail> get copyWith => __$ExpenseDetailCopyWithImpl<_ExpenseDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._expensePayments, _expensePayments));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseDate,name,amount,notes,const DeepCollectionEquality().hash(_attachments),status,createdAt,updatedAt,const DeepCollectionEquality().hash(_expensePayments));

@override
String toString() {
  return 'ExpenseDetail(id: $id, expenseDate: $expenseDate, name: $name, amount: $amount, notes: $notes, attachments: $attachments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, expensePayments: $expensePayments)';
}


}

/// @nodoc
abstract mixin class _$ExpenseDetailCopyWith<$Res> implements $ExpenseDetailCopyWith<$Res> {
  factory _$ExpenseDetailCopyWith(_ExpenseDetail value, $Res Function(_ExpenseDetail) _then) = __$ExpenseDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime expenseDate, String name, String amount, String? notes, List<String> attachments, String? status, DateTime createdAt, DateTime? updatedAt, List<ExpensePayment> expensePayments
});




}
/// @nodoc
class __$ExpenseDetailCopyWithImpl<$Res>
    implements _$ExpenseDetailCopyWith<$Res> {
  __$ExpenseDetailCopyWithImpl(this._self, this._then);

  final _ExpenseDetail _self;
  final $Res Function(_ExpenseDetail) _then;

/// Create a copy of ExpenseDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseDate = null,Object? name = null,Object? amount = null,Object? notes = freezed,Object? attachments = null,Object? status = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? expensePayments = null,}) {
  return _then(_ExpenseDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expensePayments: null == expensePayments ? _self._expensePayments : expensePayments // ignore: cast_nullable_to_non_nullable
as List<ExpensePayment>,
  ));
}


}

/// @nodoc
mixin _$ExpensePayment {

 String get id; String get expenseId; String get amount; DateTime get createdAt; List<ExpensePaymentMethod> get paymentMethods;
/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensePaymentCopyWith<ExpensePayment> get copyWith => _$ExpensePaymentCopyWithImpl<ExpensePayment>(this as ExpensePayment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensePayment&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,createdAt,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'ExpensePayment(id: $id, expenseId: $expenseId, amount: $amount, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $ExpensePaymentCopyWith<$Res>  {
  factory $ExpensePaymentCopyWith(ExpensePayment value, $Res Function(ExpensePayment) _then) = _$ExpensePaymentCopyWithImpl;
@useResult
$Res call({
 String id, String expenseId, String amount, DateTime createdAt, List<ExpensePaymentMethod> paymentMethods
});




}
/// @nodoc
class _$ExpensePaymentCopyWithImpl<$Res>
    implements $ExpensePaymentCopyWith<$Res> {
  _$ExpensePaymentCopyWithImpl(this._self, this._then);

  final ExpensePayment _self;
  final $Res Function(ExpensePayment) _then;

/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentMethod>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensePayment].
extension ExpensePaymentPatterns on ExpensePayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensePayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensePayment value)  $default,){
final _that = this;
switch (_that) {
case _ExpensePayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensePayment value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String expenseId,  String amount,  DateTime createdAt,  List<ExpensePaymentMethod> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that.id,_that.expenseId,_that.amount,_that.createdAt,_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String expenseId,  String amount,  DateTime createdAt,  List<ExpensePaymentMethod> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _ExpensePayment():
return $default(_that.id,_that.expenseId,_that.amount,_that.createdAt,_that.paymentMethods);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String expenseId,  String amount,  DateTime createdAt,  List<ExpensePaymentMethod> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _ExpensePayment() when $default != null:
return $default(_that.id,_that.expenseId,_that.amount,_that.createdAt,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc


class _ExpensePayment implements ExpensePayment {
  const _ExpensePayment({required this.id, required this.expenseId, required this.amount, required this.createdAt, required final  List<ExpensePaymentMethod> paymentMethods}): _paymentMethods = paymentMethods;
  

@override final  String id;
@override final  String expenseId;
@override final  String amount;
@override final  DateTime createdAt;
 final  List<ExpensePaymentMethod> _paymentMethods;
@override List<ExpensePaymentMethod> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensePaymentCopyWith<_ExpensePayment> get copyWith => __$ExpensePaymentCopyWithImpl<_ExpensePayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensePayment&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,createdAt,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'ExpensePayment(id: $id, expenseId: $expenseId, amount: $amount, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$ExpensePaymentCopyWith<$Res> implements $ExpensePaymentCopyWith<$Res> {
  factory _$ExpensePaymentCopyWith(_ExpensePayment value, $Res Function(_ExpensePayment) _then) = __$ExpensePaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, String expenseId, String amount, DateTime createdAt, List<ExpensePaymentMethod> paymentMethods
});




}
/// @nodoc
class __$ExpensePaymentCopyWithImpl<$Res>
    implements _$ExpensePaymentCopyWith<$Res> {
  __$ExpensePaymentCopyWithImpl(this._self, this._then);

  final _ExpensePayment _self;
  final $Res Function(_ExpensePayment) _then;

/// Create a copy of ExpensePayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_ExpensePayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentMethod>,
  ));
}


}

/// @nodoc
mixin _$ExpensePaymentMethod {

 String get id; String get method; String get amount; int? get bankId; String? get referenceNumber; DateTime get createdAt; String? get bankName; String? get attachment;
/// Create a copy of ExpensePaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensePaymentMethodCopyWith<ExpensePaymentMethod> get copyWith => _$ExpensePaymentMethodCopyWithImpl<ExpensePaymentMethod>(this as ExpensePaymentMethod, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensePaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}


@override
int get hashCode => Object.hash(runtimeType,id,method,amount,bankId,referenceNumber,createdAt,bankName,attachment);

@override
String toString() {
  return 'ExpensePaymentMethod(id: $id, method: $method, amount: $amount, bankId: $bankId, referenceNumber: $referenceNumber, createdAt: $createdAt, bankName: $bankName, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class $ExpensePaymentMethodCopyWith<$Res>  {
  factory $ExpensePaymentMethodCopyWith(ExpensePaymentMethod value, $Res Function(ExpensePaymentMethod) _then) = _$ExpensePaymentMethodCopyWithImpl;
@useResult
$Res call({
 String id, String method, String amount, int? bankId, String? referenceNumber, DateTime createdAt, String? bankName, String? attachment
});




}
/// @nodoc
class _$ExpensePaymentMethodCopyWithImpl<$Res>
    implements $ExpensePaymentMethodCopyWith<$Res> {
  _$ExpensePaymentMethodCopyWithImpl(this._self, this._then);

  final ExpensePaymentMethod _self;
  final $Res Function(ExpensePaymentMethod) _then;

/// Create a copy of ExpensePaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? bankId = freezed,Object? referenceNumber = freezed,Object? createdAt = null,Object? bankName = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensePaymentMethod].
extension ExpensePaymentMethodPatterns on ExpensePaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensePaymentMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensePaymentMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensePaymentMethod value)  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensePaymentMethod value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String method,  String amount,  int? bankId,  String? referenceNumber,  DateTime createdAt,  String? bankName,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensePaymentMethod() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.createdAt,_that.bankName,_that.attachment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String method,  String amount,  int? bankId,  String? referenceNumber,  DateTime createdAt,  String? bankName,  String? attachment)  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentMethod():
return $default(_that.id,_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.createdAt,_that.bankName,_that.attachment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String method,  String amount,  int? bankId,  String? referenceNumber,  DateTime createdAt,  String? bankName,  String? attachment)?  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentMethod() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.bankId,_that.referenceNumber,_that.createdAt,_that.bankName,_that.attachment);case _:
  return null;

}
}

}

/// @nodoc


class _ExpensePaymentMethod implements ExpensePaymentMethod {
  const _ExpensePaymentMethod({required this.id, required this.method, required this.amount, this.bankId, this.referenceNumber, required this.createdAt, this.bankName, this.attachment});
  

@override final  String id;
@override final  String method;
@override final  String amount;
@override final  int? bankId;
@override final  String? referenceNumber;
@override final  DateTime createdAt;
@override final  String? bankName;
@override final  String? attachment;

/// Create a copy of ExpensePaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensePaymentMethodCopyWith<_ExpensePaymentMethod> get copyWith => __$ExpensePaymentMethodCopyWithImpl<_ExpensePaymentMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensePaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}


@override
int get hashCode => Object.hash(runtimeType,id,method,amount,bankId,referenceNumber,createdAt,bankName,attachment);

@override
String toString() {
  return 'ExpensePaymentMethod(id: $id, method: $method, amount: $amount, bankId: $bankId, referenceNumber: $referenceNumber, createdAt: $createdAt, bankName: $bankName, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class _$ExpensePaymentMethodCopyWith<$Res> implements $ExpensePaymentMethodCopyWith<$Res> {
  factory _$ExpensePaymentMethodCopyWith(_ExpensePaymentMethod value, $Res Function(_ExpensePaymentMethod) _then) = __$ExpensePaymentMethodCopyWithImpl;
@override @useResult
$Res call({
 String id, String method, String amount, int? bankId, String? referenceNumber, DateTime createdAt, String? bankName, String? attachment
});




}
/// @nodoc
class __$ExpensePaymentMethodCopyWithImpl<$Res>
    implements _$ExpensePaymentMethodCopyWith<$Res> {
  __$ExpensePaymentMethodCopyWithImpl(this._self, this._then);

  final _ExpensePaymentMethod _self;
  final $Res Function(_ExpensePaymentMethod) _then;

/// Create a copy of ExpensePaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? bankId = freezed,Object? referenceNumber = freezed,Object? createdAt = null,Object? bankName = freezed,Object? attachment = freezed,}) {
  return _then(_ExpensePaymentMethod(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
