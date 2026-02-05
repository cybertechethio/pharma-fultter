// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_totals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualTotalsModel {

@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get cost;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get vat;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get grossProfit;
/// Create a copy of AnnualTotalsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualTotalsModelCopyWith<AnnualTotalsModel> get copyWith => _$AnnualTotalsModelCopyWithImpl<AnnualTotalsModel>(this as AnnualTotalsModel, _$identity);

  /// Serializes this AnnualTotalsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualTotalsModel&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualTotalsModel(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class $AnnualTotalsModelCopyWith<$Res>  {
  factory $AnnualTotalsModelCopyWith(AnnualTotalsModel value, $Res Function(AnnualTotalsModel) _then) = _$AnnualTotalsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double cost,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double vat,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double grossProfit
});




}
/// @nodoc
class _$AnnualTotalsModelCopyWithImpl<$Res>
    implements $AnnualTotalsModelCopyWith<$Res> {
  _$AnnualTotalsModelCopyWithImpl(this._self, this._then);

  final AnnualTotalsModel _self;
  final $Res Function(AnnualTotalsModel) _then;

/// Create a copy of AnnualTotalsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sales = null,Object? cost = null,Object? vat = null,Object? grossProfit = null,}) {
  return _then(_self.copyWith(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,vat: null == vat ? _self.vat : vat // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnualTotalsModel].
extension AnnualTotalsModelPatterns on AnnualTotalsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualTotalsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualTotalsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualTotalsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualTotalsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualTotalsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualTotalsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double cost, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double vat, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double grossProfit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualTotalsModel() when $default != null:
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double cost, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double vat, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double grossProfit)  $default,) {final _that = this;
switch (_that) {
case _AnnualTotalsModel():
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double cost, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double vat, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double grossProfit)?  $default,) {final _that = this;
switch (_that) {
case _AnnualTotalsModel() when $default != null:
return $default(_that.sales,_that.cost,_that.vat,_that.grossProfit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualTotalsModel implements AnnualTotalsModel {
  const _AnnualTotalsModel({@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.cost, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.vat, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.grossProfit});
  factory _AnnualTotalsModel.fromJson(Map<String, dynamic> json) => _$AnnualTotalsModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double cost;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double vat;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double grossProfit;

/// Create a copy of AnnualTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualTotalsModelCopyWith<_AnnualTotalsModel> get copyWith => __$AnnualTotalsModelCopyWithImpl<_AnnualTotalsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualTotalsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualTotalsModel&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.vat, vat) || other.vat == vat)&&(identical(other.grossProfit, grossProfit) || other.grossProfit == grossProfit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sales,cost,vat,grossProfit);

@override
String toString() {
  return 'AnnualTotalsModel(sales: $sales, cost: $cost, vat: $vat, grossProfit: $grossProfit)';
}


}

/// @nodoc
abstract mixin class _$AnnualTotalsModelCopyWith<$Res> implements $AnnualTotalsModelCopyWith<$Res> {
  factory _$AnnualTotalsModelCopyWith(_AnnualTotalsModel value, $Res Function(_AnnualTotalsModel) _then) = __$AnnualTotalsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double cost,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double vat,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double grossProfit
});




}
/// @nodoc
class __$AnnualTotalsModelCopyWithImpl<$Res>
    implements _$AnnualTotalsModelCopyWith<$Res> {
  __$AnnualTotalsModelCopyWithImpl(this._self, this._then);

  final _AnnualTotalsModel _self;
  final $Res Function(_AnnualTotalsModel) _then;

/// Create a copy of AnnualTotalsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sales = null,Object? cost = null,Object? vat = null,Object? grossProfit = null,}) {
  return _then(_AnnualTotalsModel(
sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,vat: null == vat ? _self.vat : vat // ignore: cast_nullable_to_non_nullable
as double,grossProfit: null == grossProfit ? _self.grossProfit : grossProfit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
