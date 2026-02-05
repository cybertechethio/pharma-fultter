// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_month_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualMonthDataModel {

 String get month;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get profit;
/// Create a copy of AnnualMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualMonthDataModelCopyWith<AnnualMonthDataModel> get copyWith => _$AnnualMonthDataModelCopyWithImpl<AnnualMonthDataModel>(this as AnnualMonthDataModel, _$identity);

  /// Serializes this AnnualMonthDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualMonthDataModel&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'AnnualMonthDataModel(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $AnnualMonthDataModelCopyWith<$Res>  {
  factory $AnnualMonthDataModelCopyWith(AnnualMonthDataModel value, $Res Function(AnnualMonthDataModel) _then) = _$AnnualMonthDataModelCopyWithImpl;
@useResult
$Res call({
 String month,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class _$AnnualMonthDataModelCopyWithImpl<$Res>
    implements $AnnualMonthDataModelCopyWith<$Res> {
  _$AnnualMonthDataModelCopyWithImpl(this._self, this._then);

  final AnnualMonthDataModel _self;
  final $Res Function(AnnualMonthDataModel) _then;

/// Create a copy of AnnualMonthDataModel
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


/// Adds pattern-matching-related methods to [AnnualMonthDataModel].
extension AnnualMonthDataModelPatterns on AnnualMonthDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualMonthDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualMonthDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualMonthDataModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualMonthDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualMonthDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualMonthDataModel() when $default != null:
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
case _AnnualMonthDataModel() when $default != null:
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
case _AnnualMonthDataModel():
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
case _AnnualMonthDataModel() when $default != null:
return $default(_that.month,_that.sales,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualMonthDataModel implements AnnualMonthDataModel {
  const _AnnualMonthDataModel({required this.month, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.profit});
  factory _AnnualMonthDataModel.fromJson(Map<String, dynamic> json) => _$AnnualMonthDataModelFromJson(json);

@override final  String month;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double profit;

/// Create a copy of AnnualMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualMonthDataModelCopyWith<_AnnualMonthDataModel> get copyWith => __$AnnualMonthDataModelCopyWithImpl<_AnnualMonthDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualMonthDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualMonthDataModel&&(identical(other.month, month) || other.month == month)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,sales,profit);

@override
String toString() {
  return 'AnnualMonthDataModel(month: $month, sales: $sales, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$AnnualMonthDataModelCopyWith<$Res> implements $AnnualMonthDataModelCopyWith<$Res> {
  factory _$AnnualMonthDataModelCopyWith(_AnnualMonthDataModel value, $Res Function(_AnnualMonthDataModel) _then) = __$AnnualMonthDataModelCopyWithImpl;
@override @useResult
$Res call({
 String month,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double profit
});




}
/// @nodoc
class __$AnnualMonthDataModelCopyWithImpl<$Res>
    implements _$AnnualMonthDataModelCopyWith<$Res> {
  __$AnnualMonthDataModelCopyWithImpl(this._self, this._then);

  final _AnnualMonthDataModel _self;
  final $Res Function(_AnnualMonthDataModel) _then;

/// Create a copy of AnnualMonthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? sales = null,Object? profit = null,}) {
  return _then(_AnnualMonthDataModel(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
