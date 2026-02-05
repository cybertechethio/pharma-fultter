// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_month_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossMonthDataModel {

 String get month;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get profit;
/// Create a copy of ProfitLossMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossMonthDataModelCopyWith<ProfitLossMonthDataModel> get copyWith => _$ProfitLossMonthDataModelCopyWithImpl<ProfitLossMonthDataModel>(this as ProfitLossMonthDataModel, _$identity);

  /// Serializes this ProfitLossMonthDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossMonthDataModel&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'ProfitLossMonthDataModel(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $ProfitLossMonthDataModelCopyWith<$Res>  {
  factory $ProfitLossMonthDataModelCopyWith(ProfitLossMonthDataModel value, $Res Function(ProfitLossMonthDataModel) _then) = _$ProfitLossMonthDataModelCopyWithImpl;
@useResult
$Res call({
 String month,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class _$ProfitLossMonthDataModelCopyWithImpl<$Res>
    implements $ProfitLossMonthDataModelCopyWith<$Res> {
  _$ProfitLossMonthDataModelCopyWithImpl(this._self, this._then);

  final ProfitLossMonthDataModel _self;
  final $Res Function(ProfitLossMonthDataModel) _then;

/// Create a copy of ProfitLossMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? sales = null,Object? profit = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfitLossMonthDataModel].
extension ProfitLossMonthDataModelPatterns on ProfitLossMonthDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossMonthDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossMonthDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossMonthDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel() when $default != null:
return $default(_that.month,_that.sales,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel():
return $default(_that.month,_that.sales,_that.profit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double profit)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossMonthDataModel() when $default != null:
return $default(_that.month,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossMonthDataModel implements ProfitLossMonthDataModel {
  const _ProfitLossMonthDataModel({required this.month, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.profit});
  factory _ProfitLossMonthDataModel.fromJson(Map<String, dynamic> json) => _$ProfitLossMonthDataModelFromJson(json);

@override final  String month;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double profit;

/// Create a copy of ProfitLossMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossMonthDataModelCopyWith<_ProfitLossMonthDataModel> get copyWith => __$ProfitLossMonthDataModelCopyWithImpl<_ProfitLossMonthDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossMonthDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossMonthDataModel&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'ProfitLossMonthDataModel(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossMonthDataModelCopyWith<$Res> implements $ProfitLossMonthDataModelCopyWith<$Res> {
  factory _$ProfitLossMonthDataModelCopyWith(_ProfitLossMonthDataModel value, $Res Function(_ProfitLossMonthDataModel) _then) = __$ProfitLossMonthDataModelCopyWithImpl;
@override @useResult
$Res call({
 String month,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class __$ProfitLossMonthDataModelCopyWithImpl<$Res>
    implements _$ProfitLossMonthDataModelCopyWith<$Res> {
  __$ProfitLossMonthDataModelCopyWithImpl(this._self, this._then);

  final _ProfitLossMonthDataModel _self;
  final $Res Function(_ProfitLossMonthDataModel) _then;

/// Create a copy of ProfitLossMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? sales = null,Object? profit = null,}) {
  return _then(_ProfitLossMonthDataModel(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
