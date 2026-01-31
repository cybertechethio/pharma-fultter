// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseDetailModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; int? get categoryId; DateTime get expenseDate; String get name;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get amount; String? get notes;@JsonKey(defaultValue: <String>[]) List<String> get attachments; String? get status; DateTime get createdAt; DateTime? get updatedAt; String? get catName;@JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[]) List<ExpensePaymentModel> get expensePayments;
/// Create a copy of ExpenseDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseDetailModelCopyWith<ExpenseDetailModel> get copyWith => _$ExpenseDetailModelCopyWithImpl<ExpenseDetailModel>(this as ExpenseDetailModel, _$identity);

  /// Serializes this ExpenseDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.catName, catName) || other.catName == catName)&&const DeepCollectionEquality().equals(other.expensePayments, expensePayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,expenseDate,name,amount,notes,const DeepCollectionEquality().hash(attachments),status,createdAt,updatedAt,catName,const DeepCollectionEquality().hash(expensePayments));

@override
String toString() {
  return 'ExpenseDetailModel(id: $id, categoryId: $categoryId, expenseDate: $expenseDate, name: $name, amount: $amount, notes: $notes, attachments: $attachments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, catName: $catName, expensePayments: $expensePayments)';
}


}

/// @nodoc
abstract mixin class $ExpenseDetailModelCopyWith<$Res>  {
  factory $ExpenseDetailModelCopyWith(ExpenseDetailModel value, $Res Function(ExpenseDetailModel) _then) = _$ExpenseDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, int? categoryId, DateTime expenseDate, String name,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, String? notes,@JsonKey(defaultValue: <String>[]) List<String> attachments, String? status, DateTime createdAt, DateTime? updatedAt, String? catName,@JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[]) List<ExpensePaymentModel> expensePayments
});




}
/// @nodoc
class _$ExpenseDetailModelCopyWithImpl<$Res>
    implements $ExpenseDetailModelCopyWith<$Res> {
  _$ExpenseDetailModelCopyWithImpl(this._self, this._then);

  final ExpenseDetailModel _self;
  final $Res Function(ExpenseDetailModel) _then;

/// Create a copy of ExpenseDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = freezed,Object? expenseDate = null,Object? name = null,Object? amount = null,Object? notes = freezed,Object? attachments = null,Object? status = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? catName = freezed,Object? expensePayments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,catName: freezed == catName ? _self.catName : catName // ignore: cast_nullable_to_non_nullable
as String?,expensePayments: null == expensePayments ? _self.expensePayments : expensePayments // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseDetailModel].
extension ExpenseDetailModelPatterns on ExpenseDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int? categoryId,  DateTime expenseDate,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? notes, @JsonKey(defaultValue: <String>[])  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  String? catName, @JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[])  List<ExpensePaymentModel> expensePayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseDetailModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.catName,_that.expensePayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int? categoryId,  DateTime expenseDate,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? notes, @JsonKey(defaultValue: <String>[])  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  String? catName, @JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[])  List<ExpensePaymentModel> expensePayments)  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetailModel():
return $default(_that.id,_that.categoryId,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.catName,_that.expensePayments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  int? categoryId,  DateTime expenseDate,  String name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? notes, @JsonKey(defaultValue: <String>[])  List<String> attachments,  String? status,  DateTime createdAt,  DateTime? updatedAt,  String? catName, @JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[])  List<ExpensePaymentModel> expensePayments)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseDetailModel() when $default != null:
return $default(_that.id,_that.categoryId,_that.expenseDate,_that.name,_that.amount,_that.notes,_that.attachments,_that.status,_that.createdAt,_that.updatedAt,_that.catName,_that.expensePayments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseDetailModel implements ExpenseDetailModel {
  const _ExpenseDetailModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, this.categoryId, required this.expenseDate, required this.name, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.amount, this.notes, @JsonKey(defaultValue: <String>[]) required final  List<String> attachments, this.status, required this.createdAt, this.updatedAt, this.catName, @JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[]) required final  List<ExpensePaymentModel> expensePayments}): _attachments = attachments,_expensePayments = expensePayments;
  factory _ExpenseDetailModel.fromJson(Map<String, dynamic> json) => _$ExpenseDetailModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  int? categoryId;
@override final  DateTime expenseDate;
@override final  String name;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String amount;
@override final  String? notes;
 final  List<String> _attachments;
@override@JsonKey(defaultValue: <String>[]) List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  String? status;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  String? catName;
 final  List<ExpensePaymentModel> _expensePayments;
@override@JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[]) List<ExpensePaymentModel> get expensePayments {
  if (_expensePayments is EqualUnmodifiableListView) return _expensePayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expensePayments);
}


/// Create a copy of ExpenseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseDetailModelCopyWith<_ExpenseDetailModel> get copyWith => __$ExpenseDetailModelCopyWithImpl<_ExpenseDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.catName, catName) || other.catName == catName)&&const DeepCollectionEquality().equals(other._expensePayments, _expensePayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,expenseDate,name,amount,notes,const DeepCollectionEquality().hash(_attachments),status,createdAt,updatedAt,catName,const DeepCollectionEquality().hash(_expensePayments));

@override
String toString() {
  return 'ExpenseDetailModel(id: $id, categoryId: $categoryId, expenseDate: $expenseDate, name: $name, amount: $amount, notes: $notes, attachments: $attachments, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, catName: $catName, expensePayments: $expensePayments)';
}


}

/// @nodoc
abstract mixin class _$ExpenseDetailModelCopyWith<$Res> implements $ExpenseDetailModelCopyWith<$Res> {
  factory _$ExpenseDetailModelCopyWith(_ExpenseDetailModel value, $Res Function(_ExpenseDetailModel) _then) = __$ExpenseDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, int? categoryId, DateTime expenseDate, String name,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, String? notes,@JsonKey(defaultValue: <String>[]) List<String> attachments, String? status, DateTime createdAt, DateTime? updatedAt, String? catName,@JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[]) List<ExpensePaymentModel> expensePayments
});




}
/// @nodoc
class __$ExpenseDetailModelCopyWithImpl<$Res>
    implements _$ExpenseDetailModelCopyWith<$Res> {
  __$ExpenseDetailModelCopyWithImpl(this._self, this._then);

  final _ExpenseDetailModel _self;
  final $Res Function(_ExpenseDetailModel) _then;

/// Create a copy of ExpenseDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = freezed,Object? expenseDate = null,Object? name = null,Object? amount = null,Object? notes = freezed,Object? attachments = null,Object? status = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? catName = freezed,Object? expensePayments = null,}) {
  return _then(_ExpenseDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,catName: freezed == catName ? _self.catName : catName // ignore: cast_nullable_to_non_nullable
as String?,expensePayments: null == expensePayments ? _self._expensePayments : expensePayments // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentModel>,
  ));
}


}


/// @nodoc
mixin _$ExpensePaymentModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get expenseId;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get amount; DateTime get createdAt;@JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[]) List<ExpensePaymentMethodModel> get paymentMethods;
/// Create a copy of ExpensePaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensePaymentModelCopyWith<ExpensePaymentModel> get copyWith => _$ExpensePaymentModelCopyWithImpl<ExpensePaymentModel>(this as ExpensePaymentModel, _$identity);

  /// Serializes this ExpensePaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensePaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,createdAt,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'ExpensePaymentModel(id: $id, expenseId: $expenseId, amount: $amount, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $ExpensePaymentModelCopyWith<$Res>  {
  factory $ExpensePaymentModelCopyWith(ExpensePaymentModel value, $Res Function(ExpensePaymentModel) _then) = _$ExpensePaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String expenseId,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, DateTime createdAt,@JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[]) List<ExpensePaymentMethodModel> paymentMethods
});




}
/// @nodoc
class _$ExpensePaymentModelCopyWithImpl<$Res>
    implements $ExpensePaymentModelCopyWith<$Res> {
  _$ExpensePaymentModelCopyWithImpl(this._self, this._then);

  final ExpensePaymentModel _self;
  final $Res Function(ExpensePaymentModel) _then;

/// Create a copy of ExpensePaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentMethodModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensePaymentModel].
extension ExpensePaymentModelPatterns on ExpensePaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensePaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensePaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensePaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensePaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String expenseId, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  DateTime createdAt, @JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[])  List<ExpensePaymentMethodModel> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensePaymentModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String expenseId, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  DateTime createdAt, @JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[])  List<ExpensePaymentMethodModel> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String expenseId, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  DateTime createdAt, @JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[])  List<ExpensePaymentMethodModel> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentModel() when $default != null:
return $default(_that.id,_that.expenseId,_that.amount,_that.createdAt,_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensePaymentModel implements ExpensePaymentModel {
  const _ExpensePaymentModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.expenseId, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.amount, required this.createdAt, @JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[]) required final  List<ExpensePaymentMethodModel> paymentMethods}): _paymentMethods = paymentMethods;
  factory _ExpensePaymentModel.fromJson(Map<String, dynamic> json) => _$ExpensePaymentModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String expenseId;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String amount;
@override final  DateTime createdAt;
 final  List<ExpensePaymentMethodModel> _paymentMethods;
@override@JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[]) List<ExpensePaymentMethodModel> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of ExpensePaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensePaymentModelCopyWith<_ExpensePaymentModel> get copyWith => __$ExpensePaymentModelCopyWithImpl<_ExpensePaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensePaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensePaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,createdAt,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'ExpensePaymentModel(id: $id, expenseId: $expenseId, amount: $amount, createdAt: $createdAt, paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$ExpensePaymentModelCopyWith<$Res> implements $ExpensePaymentModelCopyWith<$Res> {
  factory _$ExpensePaymentModelCopyWith(_ExpensePaymentModel value, $Res Function(_ExpensePaymentModel) _then) = __$ExpensePaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String expenseId,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, DateTime createdAt,@JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[]) List<ExpensePaymentMethodModel> paymentMethods
});




}
/// @nodoc
class __$ExpensePaymentModelCopyWithImpl<$Res>
    implements _$ExpensePaymentModelCopyWith<$Res> {
  __$ExpensePaymentModelCopyWithImpl(this._self, this._then);

  final _ExpensePaymentModel _self;
  final $Res Function(_ExpensePaymentModel) _then;

/// Create a copy of ExpensePaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? createdAt = null,Object? paymentMethods = null,}) {
  return _then(_ExpensePaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<ExpensePaymentMethodModel>,
  ));
}


}


/// @nodoc
mixin _$ExpensePaymentMethodModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; String get method;@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get amount; String? get referenceNumber; int? get bankId; DateTime get createdAt;@JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) String? get bankName;
/// Create a copy of ExpensePaymentMethodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensePaymentMethodModelCopyWith<ExpensePaymentMethodModel> get copyWith => _$ExpensePaymentMethodModelCopyWithImpl<ExpensePaymentMethodModel>(this as ExpensePaymentMethodModel, _$identity);

  /// Serializes this ExpensePaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensePaymentMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,amount,referenceNumber,bankId,createdAt,bankName);

@override
String toString() {
  return 'ExpensePaymentMethodModel(id: $id, method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId, createdAt: $createdAt, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class $ExpensePaymentMethodModelCopyWith<$Res>  {
  factory $ExpensePaymentMethodModelCopyWith(ExpensePaymentMethodModel value, $Res Function(ExpensePaymentMethodModel) _then) = _$ExpensePaymentMethodModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String method,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, String? referenceNumber, int? bankId, DateTime createdAt,@JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) String? bankName
});




}
/// @nodoc
class _$ExpensePaymentMethodModelCopyWithImpl<$Res>
    implements $ExpensePaymentMethodModelCopyWith<$Res> {
  _$ExpensePaymentMethodModelCopyWithImpl(this._self, this._then);

  final ExpensePaymentMethodModel _self;
  final $Res Function(ExpensePaymentMethodModel) _then;

/// Create a copy of ExpensePaymentMethodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,Object? createdAt = null,Object? bankName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensePaymentMethodModel].
extension ExpensePaymentMethodModelPatterns on ExpensePaymentMethodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensePaymentMethodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensePaymentMethodModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensePaymentMethodModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String method, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? referenceNumber,  int? bankId,  DateTime createdAt, @JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic)  String? bankName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.createdAt,_that.bankName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String method, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? referenceNumber,  int? bankId,  DateTime createdAt, @JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic)  String? bankName)  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel():
return $default(_that.id,_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.createdAt,_that.bankName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String method, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String amount,  String? referenceNumber,  int? bankId,  DateTime createdAt, @JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic)  String? bankName)?  $default,) {final _that = this;
switch (_that) {
case _ExpensePaymentMethodModel() when $default != null:
return $default(_that.id,_that.method,_that.amount,_that.referenceNumber,_that.bankId,_that.createdAt,_that.bankName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensePaymentMethodModel implements ExpensePaymentMethodModel {
  const _ExpensePaymentMethodModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, required this.method, @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.amount, this.referenceNumber, this.bankId, required this.createdAt, @JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) this.bankName});
  factory _ExpensePaymentMethodModel.fromJson(Map<String, dynamic> json) => _$ExpensePaymentMethodModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  String method;
@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String amount;
@override final  String? referenceNumber;
@override final  int? bankId;
@override final  DateTime createdAt;
@override@JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) final  String? bankName;

/// Create a copy of ExpensePaymentMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensePaymentMethodModelCopyWith<_ExpensePaymentMethodModel> get copyWith => __$ExpensePaymentMethodModelCopyWithImpl<_ExpensePaymentMethodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensePaymentMethodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensePaymentMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.bankId, bankId) || other.bankId == bankId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bankName, bankName) || other.bankName == bankName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,amount,referenceNumber,bankId,createdAt,bankName);

@override
String toString() {
  return 'ExpensePaymentMethodModel(id: $id, method: $method, amount: $amount, referenceNumber: $referenceNumber, bankId: $bankId, createdAt: $createdAt, bankName: $bankName)';
}


}

/// @nodoc
abstract mixin class _$ExpensePaymentMethodModelCopyWith<$Res> implements $ExpensePaymentMethodModelCopyWith<$Res> {
  factory _$ExpensePaymentMethodModelCopyWith(_ExpensePaymentMethodModel value, $Res Function(_ExpensePaymentMethodModel) _then) = __$ExpensePaymentMethodModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String method,@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String amount, String? referenceNumber, int? bankId, DateTime createdAt,@JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) String? bankName
});




}
/// @nodoc
class __$ExpensePaymentMethodModelCopyWithImpl<$Res>
    implements _$ExpensePaymentMethodModelCopyWith<$Res> {
  __$ExpensePaymentMethodModelCopyWithImpl(this._self, this._then);

  final _ExpensePaymentMethodModel _self;
  final $Res Function(_ExpensePaymentMethodModel) _then;

/// Create a copy of ExpensePaymentMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? amount = null,Object? referenceNumber = freezed,Object? bankId = freezed,Object? createdAt = null,Object? bankName = freezed,}) {
  return _then(_ExpensePaymentMethodModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,bankId: freezed == bankId ? _self.bankId : bankId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
