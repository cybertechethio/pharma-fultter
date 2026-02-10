// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Expense {

 String get id; String get amount; DateTime get expenseDate; String get name; DateTime get createdAt; int? get createdBy; List<String> get attachments;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,expenseDate,name,createdAt,createdBy,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'Expense(id: $id, amount: $amount, expenseDate: $expenseDate, name: $name, createdAt: $createdAt, createdBy: $createdBy, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
 String id, String amount, DateTime expenseDate, String name, DateTime createdAt, int? createdBy, List<String> attachments
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? expenseDate = null,Object? name = null,Object? createdAt = null,Object? createdBy = freezed,Object? attachments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String amount,  DateTime expenseDate,  String name,  DateTime createdAt,  int? createdBy,  List<String> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.amount,_that.expenseDate,_that.name,_that.createdAt,_that.createdBy,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String amount,  DateTime expenseDate,  String name,  DateTime createdAt,  int? createdBy,  List<String> attachments)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.id,_that.amount,_that.expenseDate,_that.name,_that.createdAt,_that.createdBy,_that.attachments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String amount,  DateTime expenseDate,  String name,  DateTime createdAt,  int? createdBy,  List<String> attachments)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.amount,_that.expenseDate,_that.name,_that.createdAt,_that.createdBy,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc


class _Expense implements Expense {
  const _Expense({required this.id, required this.amount, required this.expenseDate, required this.name, required this.createdAt, this.createdBy, required final  List<String> attachments}): _attachments = attachments;
  

@override final  String id;
@override final  String amount;
@override final  DateTime expenseDate;
@override final  String name;
@override final  DateTime createdAt;
@override final  int? createdBy;
 final  List<String> _attachments;
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}


@override
int get hashCode => Object.hash(runtimeType,id,amount,expenseDate,name,createdAt,createdBy,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'Expense(id: $id, amount: $amount, expenseDate: $expenseDate, name: $name, createdAt: $createdAt, createdBy: $createdBy, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id, String amount, DateTime expenseDate, String name, DateTime createdAt, int? createdBy, List<String> attachments
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? expenseDate = null,Object? name = null,Object? createdAt = null,Object? createdBy = freezed,Object? attachments = null,}) {
  return _then(_Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
