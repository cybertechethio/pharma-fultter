// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_day_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossDayDataModel {

 DateTime get date;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get profit;
/// Create a copy of ProfitLossDayDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossDayDataModelCopyWith<ProfitLossDayDataModel> get copyWith => _$ProfitLossDayDataModelCopyWithImpl<ProfitLossDayDataModel>(this as ProfitLossDayDataModel, _$identity);

  /// Serializes this ProfitLossDayDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossDayDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,sales,profit);

@override
String toString() {
  return 'ProfitLossDayDataModel(date: $date, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossDayDataModelCopyWith<$Res>  {
  factory $ProfitLossDayDataModelCopyWith(ProfitLossDayDataModel value, $Res Function(ProfitLossDayDataModel) _then) = _$ProfitLossDayDataModelCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class _$ProfitLossDayDataModelCopyWithImpl<$Res>
    implements $ProfitLossDayDataModelCopyWith<$Res> {
  _$ProfitLossDayDataModelCopyWithImpl(this._self, this._then);

  final ProfitLossDayDataModel _self;
  final $Res Function(ProfitLossDayDataModel) _then;

/// Create a copy of ProfitLossDayDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossDayDataModel].
extension ProfitLossDayDataModelPatterns on ProfitLossDayDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossDayDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossDayDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossDayDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossDayDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossDayDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossDayDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossDayDataModel() when $default != null:
return $default(_that.date,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossDayDataModel():
return $default(_that.date,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossDayDataModel() when $default != null:
return $default(_that.date,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossDayDataModel implements ProfitLossDayDataModel {
  const _ProfitLossDayDataModel({required this.date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.profit});
  factory _ProfitLossDayDataModel.fromJson(Map<String, dynamic> json) => _$ProfitLossDayDataModelFromJson(json);

@override final  DateTime date;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double profit;

/// Create a copy of ProfitLossDayDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossDayDataModelCopyWith<_ProfitLossDayDataModel> get copyWith => __$ProfitLossDayDataModelCopyWithImpl<_ProfitLossDayDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossDayDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossDayDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,sales,profit);

@override
String toString() {
  return 'ProfitLossDayDataModel(date: $date, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossDayDataModelCopyWith<$Res> implements $ProfitLossDayDataModelCopyWith<$Res> {
  factory _$ProfitLossDayDataModelCopyWith(_ProfitLossDayDataModel value, $Res Function(_ProfitLossDayDataModel) _then) = __$ProfitLossDayDataModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class __$ProfitLossDayDataModelCopyWithImpl<$Res>
    implements _$ProfitLossDayDataModelCopyWith<$Res> {
  __$ProfitLossDayDataModelCopyWithImpl(this._self, this._then);

  final _ProfitLossDayDataModel _self;
  final $Res Function(_ProfitLossDayDataModel) _then;

/// Create a copy of ProfitLossDayDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossDayDataModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
