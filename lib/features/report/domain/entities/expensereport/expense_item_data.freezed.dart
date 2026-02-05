// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseItemData {

 int get id; String get expenseName; String? get category; String? get description; DateTime get date; double get amount; String? get paymentMethod;
/// Create a copy of ExpenseItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseItemDataCopyWith<ExpenseItemData> get copyWith => _$ExpenseItemDataCopyWithImpl<ExpenseItemData>(this as ExpenseItemData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseName, expenseName) || other.expenseName == expenseName)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseName,category,description,date,amount,paymentMethod);

@override
String toString() {
  return 'ExpenseItemData(id: $id, expenseName: $expenseName, category: $category, description: $description, date: $date, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $ExpenseItemDataCopyWith<$Res>  {
  factory $ExpenseItemDataCopyWith(ExpenseItemData value, $Res Function(ExpenseItemData) _then) = _$ExpenseItemDataCopyWithImpl;
@useResult
$Res call({
 int id, String expenseName, String? category, String? description, DateTime date, double amount, String? paymentMethod
});




}
/// @nodoc
class _$ExpenseItemDataCopyWithImpl<$Res>
    implements $ExpenseItemDataCopyWith<$Res> {
  _$ExpenseItemDataCopyWithImpl(this._self, this._then);

  final ExpenseItemData _self;
  final $Res Function(ExpenseItemData) _then;

/// Create a copy of ExpenseItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseName = null,Object? category = freezed,Object? description = freezed,Object? date = null,Object? amount = null,Object? paymentMethod = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseName: null == expenseName ? _self.expenseName : expenseName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseItemData].
extension ExpenseItemDataPatterns on ExpenseItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseItemData value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseItemData value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String expenseName,  String? category,  String? description,  DateTime date,  double amount,  String? paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseItemData() when $default != null:
return $default(_that.id,_that.expenseName,_that.category,_that.description,_that.date,_that.amount,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String expenseName,  String? category,  String? description,  DateTime date,  double amount,  String? paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _ExpenseItemData():
return $default(_that.id,_that.expenseName,_that.category,_that.description,_that.date,_that.amount,_that.paymentMethod);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String expenseName,  String? category,  String? description,  DateTime date,  double amount,  String? paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseItemData() when $default != null:
return $default(_that.id,_that.expenseName,_that.category,_that.description,_that.date,_that.amount,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseItemData implements ExpenseItemData {
  const _ExpenseItemData({required this.id, required this.expenseName, this.category, this.description, required this.date, required this.amount, this.paymentMethod});
  

@override final  int id;
@override final  String expenseName;
@override final  String? category;
@override final  String? description;
@override final  DateTime date;
@override final  double amount;
@override final  String? paymentMethod;

/// Create a copy of ExpenseItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseItemDataCopyWith<_ExpenseItemData> get copyWith => __$ExpenseItemDataCopyWithImpl<_ExpenseItemData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseName, expenseName) || other.expenseName == expenseName)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,id,expenseName,category,description,date,amount,paymentMethod);

@override
String toString() {
  return 'ExpenseItemData(id: $id, expenseName: $expenseName, category: $category, description: $description, date: $date, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$ExpenseItemDataCopyWith<$Res> implements $ExpenseItemDataCopyWith<$Res> {
  factory _$ExpenseItemDataCopyWith(_ExpenseItemData value, $Res Function(_ExpenseItemData) _then) = __$ExpenseItemDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String expenseName, String? category, String? description, DateTime date, double amount, String? paymentMethod
});




}
/// @nodoc
class __$ExpenseItemDataCopyWithImpl<$Res>
    implements _$ExpenseItemDataCopyWith<$Res> {
  __$ExpenseItemDataCopyWithImpl(this._self, this._then);

  final _ExpenseItemData _self;
  final $Res Function(_ExpenseItemData) _then;

/// Create a copy of ExpenseItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseName = null,Object? category = freezed,Object? description = freezed,Object? date = null,Object? amount = null,Object? paymentMethod = freezed,}) {
  return _then(_ExpenseItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,expenseName: null == expenseName ? _self.expenseName : expenseName // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
