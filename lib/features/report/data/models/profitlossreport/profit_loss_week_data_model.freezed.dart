// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_week_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossWeekDataModel {

 String get week;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get profit;
/// Create a copy of ProfitLossWeekDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossWeekDataModelCopyWith<ProfitLossWeekDataModel> get copyWith => _$ProfitLossWeekDataModelCopyWithImpl<ProfitLossWeekDataModel>(this as ProfitLossWeekDataModel, _$identity);

  /// Serializes this ProfitLossWeekDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossWeekDataModel&&(identical(other.week, week) || other.week == week)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,sales,profit);

@override
String toString() {
  return 'ProfitLossWeekDataModel(week: $week, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossWeekDataModelCopyWith<$Res>  {
  factory $ProfitLossWeekDataModelCopyWith(ProfitLossWeekDataModel value, $Res Function(ProfitLossWeekDataModel) _then) = _$ProfitLossWeekDataModelCopyWithImpl;
@useResult
$Res call({
 String week,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class _$ProfitLossWeekDataModelCopyWithImpl<$Res>
    implements $ProfitLossWeekDataModelCopyWith<$Res> {
  _$ProfitLossWeekDataModelCopyWithImpl(this._self, this._then);

  final ProfitLossWeekDataModel _self;
  final $Res Function(ProfitLossWeekDataModel) _then;

/// Create a copy of ProfitLossWeekDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossWeekDataModel].
extension ProfitLossWeekDataModelPatterns on ProfitLossWeekDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossWeekDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossWeekDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossWeekDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String week, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel() when $default != null:
return $default(_that.week,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String week, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel():
return $default(_that.week,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String week, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossWeekDataModel() when $default != null:
return $default(_that.week,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossWeekDataModel implements ProfitLossWeekDataModel {
  const _ProfitLossWeekDataModel({required this.week, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.profit});
  factory _ProfitLossWeekDataModel.fromJson(Map<String, dynamic> json) => _$ProfitLossWeekDataModelFromJson(json);

@override final  String week;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double profit;

/// Create a copy of ProfitLossWeekDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossWeekDataModelCopyWith<_ProfitLossWeekDataModel> get copyWith => __$ProfitLossWeekDataModelCopyWithImpl<_ProfitLossWeekDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossWeekDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossWeekDataModel&&(identical(other.week, week) || other.week == week)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,week,sales,profit);

@override
String toString() {
  return 'ProfitLossWeekDataModel(week: $week, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossWeekDataModelCopyWith<$Res> implements $ProfitLossWeekDataModelCopyWith<$Res> {
  factory _$ProfitLossWeekDataModelCopyWith(_ProfitLossWeekDataModel value, $Res Function(_ProfitLossWeekDataModel) _then) = __$ProfitLossWeekDataModelCopyWithImpl;
@override @useResult
$Res call({
 String week,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class __$ProfitLossWeekDataModelCopyWithImpl<$Res>
    implements _$ProfitLossWeekDataModelCopyWith<$Res> {
  __$ProfitLossWeekDataModelCopyWithImpl(this._self, this._then);

  final _ProfitLossWeekDataModel _self;
  final $Res Function(_ProfitLossWeekDataModel) _then;

/// Create a copy of ProfitLossWeekDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossWeekDataModel(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
