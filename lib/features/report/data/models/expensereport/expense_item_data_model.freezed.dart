// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_item_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseItemDataModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get expenseName; String? get category; String? get description; DateTime get date;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get amount; String? get paymentMethod;
/// Create a copy of ExpenseItemDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseItemDataModelCopyWith<ExpenseItemDataModel> get copyWith => _$ExpenseItemDataModelCopyWithImpl<ExpenseItemDataModel>(this as ExpenseItemDataModel, _$identity);

  /// Serializes this ExpenseItemDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseItemDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseName, expenseName) || other.expenseName == expenseName)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseName,category,description,date,amount,paymentMethod);

@override
String toString() {
  return 'ExpenseItemDataModel(id: $id, expenseName: $expenseName, category: $category, description: $description, date: $date, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $ExpenseItemDataModelCopyWith<$Res>  {
  factory $ExpenseItemDataModelCopyWith(ExpenseItemDataModel value, $Res Function(ExpenseItemDataModel) _then) = _$ExpenseItemDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String expenseName, String? category, String? description, DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, String? paymentMethod
});




}
/// @nodoc
class _$ExpenseItemDataModelCopyWithImpl<$Res>
    implements $ExpenseItemDataModelCopyWith<$Res> {
  _$ExpenseItemDataModelCopyWithImpl(this._self, this._then);

  final ExpenseItemDataModel _self;
  final $Res Function(ExpenseItemDataModel) _then;

/// Create a copy of ExpenseItemDataModel
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


/// Adds pattern-matching-related methods to [ExpenseItemDataModel].
extension ExpenseItemDataModelPatterns on ExpenseItemDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseItemDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseItemDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseItemDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseItemDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseItemDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseItemDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String expenseName,  String? category,  String? description,  DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseItemDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String expenseName,  String? category,  String? description,  DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _ExpenseItemDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String expenseName,  String? category,  String? description,  DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double amount,  String? paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseItemDataModel() when $default != null:
return $default(_that.id,_that.expenseName,_that.category,_that.description,_that.date,_that.amount,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseItemDataModel implements ExpenseItemDataModel {
  const _ExpenseItemDataModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.expenseName, this.category, this.description, required this.date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.amount, this.paymentMethod});
  factory _ExpenseItemDataModel.fromJson(Map<String, dynamic> json) => _$ExpenseItemDataModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String expenseName;
@override final  String? category;
@override final  String? description;
@override final  DateTime date;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double amount;
@override final  String? paymentMethod;

/// Create a copy of ExpenseItemDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseItemDataModelCopyWith<_ExpenseItemDataModel> get copyWith => __$ExpenseItemDataModelCopyWithImpl<_ExpenseItemDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseItemDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseItemDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseName, expenseName) || other.expenseName == expenseName)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseName,category,description,date,amount,paymentMethod);

@override
String toString() {
  return 'ExpenseItemDataModel(id: $id, expenseName: $expenseName, category: $category, description: $description, date: $date, amount: $amount, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$ExpenseItemDataModelCopyWith<$Res> implements $ExpenseItemDataModelCopyWith<$Res> {
  factory _$ExpenseItemDataModelCopyWith(_ExpenseItemDataModel value, $Res Function(_ExpenseItemDataModel) _then) = __$ExpenseItemDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String expenseName, String? category, String? description, DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double amount, String? paymentMethod
});




}
/// @nodoc
class __$ExpenseItemDataModelCopyWithImpl<$Res>
    implements _$ExpenseItemDataModelCopyWith<$Res> {
  __$ExpenseItemDataModelCopyWithImpl(this._self, this._then);

  final _ExpenseItemDataModel _self;
  final $Res Function(_ExpenseItemDataModel) _then;

/// Create a copy of ExpenseItemDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseName = null,Object? category = freezed,Object? description = freezed,Object? date = null,Object? amount = null,Object? paymentMethod = freezed,}) {
  return _then(_ExpenseItemDataModel(
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
