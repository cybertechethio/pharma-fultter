// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseSummaryModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get totalExpenses;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalAmount;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get averageExpense;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get largestExpense;
/// Create a copy of ExpenseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseSummaryModelCopyWith<ExpenseSummaryModel> get copyWith => _$ExpenseSummaryModelCopyWithImpl<ExpenseSummaryModel>(this as ExpenseSummaryModel, _$identity);

  /// Serializes this ExpenseSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseSummaryModel&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.averageExpense, averageExpense) || other.averageExpense == averageExpense)&&(identical(other.largestExpense, largestExpense) || other.largestExpense == largestExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalExpenses,totalAmount,averageExpense,largestExpense);

@override
String toString() {
  return 'ExpenseSummaryModel(totalExpenses: $totalExpenses, totalAmount: $totalAmount, averageExpense: $averageExpense, largestExpense: $largestExpense)';
}


}

/// @nodoc
abstract mixin class $ExpenseSummaryModelCopyWith<$Res>  {
  factory $ExpenseSummaryModelCopyWith(ExpenseSummaryModel value, $Res Function(ExpenseSummaryModel) _then) = _$ExpenseSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalExpenses,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double averageExpense,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double largestExpense
});




}
/// @nodoc
class _$ExpenseSummaryModelCopyWithImpl<$Res>
    implements $ExpenseSummaryModelCopyWith<$Res> {
  _$ExpenseSummaryModelCopyWithImpl(this._self, this._then);

  final ExpenseSummaryModel _self;
  final $Res Function(ExpenseSummaryModel) _then;

/// Create a copy of ExpenseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalExpenses = null,Object? totalAmount = null,Object? averageExpense = null,Object? largestExpense = null,}) {
  return _then(_self.copyWith(
totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,averageExpense: null == averageExpense ? _self.averageExpense : averageExpense // ignore: cast_nullable_to_non_nullable
as double,largestExpense: null == largestExpense ? _self.largestExpense : largestExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseSummaryModel].
extension ExpenseSummaryModelPatterns on ExpenseSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalExpenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageExpense, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double largestExpense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseSummaryModel() when $default != null:
return $default(_that.totalExpenses,_that.totalAmount,_that.averageExpense,_that.largestExpense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalExpenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageExpense, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double largestExpense)  $default,) {final _that = this;
switch (_that) {
case _ExpenseSummaryModel():
return $default(_that.totalExpenses,_that.totalAmount,_that.averageExpense,_that.largestExpense);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int totalExpenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double averageExpense, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double largestExpense)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseSummaryModel() when $default != null:
return $default(_that.totalExpenses,_that.totalAmount,_that.averageExpense,_that.largestExpense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseSummaryModel implements ExpenseSummaryModel {
  const _ExpenseSummaryModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.totalExpenses, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalAmount, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.averageExpense, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.largestExpense});
  factory _ExpenseSummaryModel.fromJson(Map<String, dynamic> json) => _$ExpenseSummaryModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int totalExpenses;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalAmount;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double averageExpense;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double largestExpense;

/// Create a copy of ExpenseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseSummaryModelCopyWith<_ExpenseSummaryModel> get copyWith => __$ExpenseSummaryModelCopyWithImpl<_ExpenseSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseSummaryModel&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.averageExpense, averageExpense) || other.averageExpense == averageExpense)&&(identical(other.largestExpense, largestExpense) || other.largestExpense == largestExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalExpenses,totalAmount,averageExpense,largestExpense);

@override
String toString() {
  return 'ExpenseSummaryModel(totalExpenses: $totalExpenses, totalAmount: $totalAmount, averageExpense: $averageExpense, largestExpense: $largestExpense)';
}


}

/// @nodoc
abstract mixin class _$ExpenseSummaryModelCopyWith<$Res> implements $ExpenseSummaryModelCopyWith<$Res> {
  factory _$ExpenseSummaryModelCopyWith(_ExpenseSummaryModel value, $Res Function(_ExpenseSummaryModel) _then) = __$ExpenseSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int totalExpenses,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalAmount,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double averageExpense,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double largestExpense
});




}
/// @nodoc
class __$ExpenseSummaryModelCopyWithImpl<$Res>
    implements _$ExpenseSummaryModelCopyWith<$Res> {
  __$ExpenseSummaryModelCopyWithImpl(this._self, this._then);

  final _ExpenseSummaryModel _self;
  final $Res Function(_ExpenseSummaryModel) _then;

/// Create a copy of ExpenseSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalExpenses = null,Object? totalAmount = null,Object? averageExpense = null,Object? largestExpense = null,}) {
  return _then(_ExpenseSummaryModel(
totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,averageExpense: null == averageExpense ? _self.averageExpense : averageExpense // ignore: cast_nullable_to_non_nullable
as double,largestExpense: null == largestExpense ? _self.largestExpense : largestExpense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
