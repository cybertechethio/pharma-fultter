// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salespurchase_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesPurchaseDataModel {

 DateTime get date;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get purchase;
/// Create a copy of SalesPurchaseDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesPurchaseDataModelCopyWith<SalesPurchaseDataModel> get copyWith => _$SalesPurchaseDataModelCopyWithImpl<SalesPurchaseDataModel>(this as SalesPurchaseDataModel, _$identity);

  /// Serializes this SalesPurchaseDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesPurchaseDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,sales,purchase);

@override
String toString() {
  return 'SalesPurchaseDataModel(date: $date, sales: $sales, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class $SalesPurchaseDataModelCopyWith<$Res>  {
  factory $SalesPurchaseDataModelCopyWith(SalesPurchaseDataModel value, $Res Function(SalesPurchaseDataModel) _then) = _$SalesPurchaseDataModelCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double purchase
});




}
/// @nodoc
class _$SalesPurchaseDataModelCopyWithImpl<$Res>
    implements $SalesPurchaseDataModelCopyWith<$Res> {
  _$SalesPurchaseDataModelCopyWithImpl(this._self, this._then);

  final SalesPurchaseDataModel _self;
  final $Res Function(SalesPurchaseDataModel) _then;

/// Create a copy of SalesPurchaseDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sales = null,Object? purchase = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesPurchaseDataModel].
extension SalesPurchaseDataModelPatterns on SalesPurchaseDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesPurchaseDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesPurchaseDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesPurchaseDataModel value)  $default,){
final _that = this;
switch (_that) {
case _SalesPurchaseDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesPurchaseDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalesPurchaseDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double purchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesPurchaseDataModel() when $default != null:
return $default(_that.date,_that.sales,_that.purchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double purchase)  $default,) {final _that = this;
switch (_that) {
case _SalesPurchaseDataModel():
return $default(_that.date,_that.sales,_that.purchase);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double purchase)?  $default,) {final _that = this;
switch (_that) {
case _SalesPurchaseDataModel() when $default != null:
return $default(_that.date,_that.sales,_that.purchase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesPurchaseDataModel implements SalesPurchaseDataModel {
  const _SalesPurchaseDataModel({required this.date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.purchase});
  factory _SalesPurchaseDataModel.fromJson(Map<String, dynamic> json) => _$SalesPurchaseDataModelFromJson(json);

@override final  DateTime date;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double purchase;

/// Create a copy of SalesPurchaseDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesPurchaseDataModelCopyWith<_SalesPurchaseDataModel> get copyWith => __$SalesPurchaseDataModelCopyWithImpl<_SalesPurchaseDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesPurchaseDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesPurchaseDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.purchase, purchase) || other.purchase == purchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,sales,purchase);

@override
String toString() {
  return 'SalesPurchaseDataModel(date: $date, sales: $sales, purchase: $purchase)';
}


}

/// @nodoc
abstract mixin class _$SalesPurchaseDataModelCopyWith<$Res> implements $SalesPurchaseDataModelCopyWith<$Res> {
  factory _$SalesPurchaseDataModelCopyWith(_SalesPurchaseDataModel value, $Res Function(_SalesPurchaseDataModel) _then) = __$SalesPurchaseDataModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double purchase
});




}
/// @nodoc
class __$SalesPurchaseDataModelCopyWithImpl<$Res>
    implements _$SalesPurchaseDataModelCopyWith<$Res> {
  __$SalesPurchaseDataModelCopyWithImpl(this._self, this._then);

  final _SalesPurchaseDataModel _self;
  final $Res Function(_SalesPurchaseDataModel) _then;

/// Create a copy of SalesPurchaseDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sales = null,Object? purchase = null,}) {
  return _then(_SalesPurchaseDataModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as double,purchase: null == purchase ? _self.purchase : purchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
