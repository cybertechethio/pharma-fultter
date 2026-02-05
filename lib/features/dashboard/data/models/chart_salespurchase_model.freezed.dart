// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_salespurchase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartSalesPerchaseModel {

 List<SalesPurchaseDataModel> get data;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalSales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get totalPurchase;
/// Create a copy of ChartSalesPerchaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartSalesPerchaseModelCopyWith<ChartSalesPerchaseModel> get copyWith => _$ChartSalesPerchaseModelCopyWithImpl<ChartSalesPerchaseModel>(this as ChartSalesPerchaseModel, _$identity);

  /// Serializes this ChartSalesPerchaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartSalesPerchaseModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalSales,totalPurchase);

@override
String toString() {
  return 'ChartSalesPerchaseModel(data: $data, totalSales: $totalSales, totalPurchase: $totalPurchase)';
}


}

/// @nodoc
abstract mixin class $ChartSalesPerchaseModelCopyWith<$Res>  {
  factory $ChartSalesPerchaseModelCopyWith(ChartSalesPerchaseModel value, $Res Function(ChartSalesPerchaseModel) _then) = _$ChartSalesPerchaseModelCopyWithImpl;
@useResult
$Res call({
 List<SalesPurchaseDataModel> data,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalSales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPurchase
});




}
/// @nodoc
class _$ChartSalesPerchaseModelCopyWithImpl<$Res>
    implements $ChartSalesPerchaseModelCopyWith<$Res> {
  _$ChartSalesPerchaseModelCopyWithImpl(this._self, this._then);

  final ChartSalesPerchaseModel _self;
  final $Res Function(ChartSalesPerchaseModel) _then;

/// Create a copy of ChartSalesPerchaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalSales = null,Object? totalPurchase = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesPurchaseDataModel>,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartSalesPerchaseModel].
extension ChartSalesPerchaseModelPatterns on ChartSalesPerchaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartSalesPerchaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartSalesPerchaseModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartSalesPerchaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesPurchaseDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPurchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel() when $default != null:
return $default(_that.data,_that.totalSales,_that.totalPurchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesPurchaseDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPurchase)  $default,) {final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel():
return $default(_that.data,_that.totalSales,_that.totalPurchase);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesPurchaseDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalSales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double totalPurchase)?  $default,) {final _that = this;
switch (_that) {
case _ChartSalesPerchaseModel() when $default != null:
return $default(_that.data,_that.totalSales,_that.totalPurchase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartSalesPerchaseModel implements ChartSalesPerchaseModel {
  const _ChartSalesPerchaseModel({required final  List<SalesPurchaseDataModel> data, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalSales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.totalPurchase}): _data = data;
  factory _ChartSalesPerchaseModel.fromJson(Map<String, dynamic> json) => _$ChartSalesPerchaseModelFromJson(json);

 final  List<SalesPurchaseDataModel> _data;
@override List<SalesPurchaseDataModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalSales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double totalPurchase;

/// Create a copy of ChartSalesPerchaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartSalesPerchaseModelCopyWith<_ChartSalesPerchaseModel> get copyWith => __$ChartSalesPerchaseModelCopyWithImpl<_ChartSalesPerchaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartSalesPerchaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartSalesPerchaseModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalSales,totalPurchase);

@override
String toString() {
  return 'ChartSalesPerchaseModel(data: $data, totalSales: $totalSales, totalPurchase: $totalPurchase)';
}


}

/// @nodoc
abstract mixin class _$ChartSalesPerchaseModelCopyWith<$Res> implements $ChartSalesPerchaseModelCopyWith<$Res> {
  factory _$ChartSalesPerchaseModelCopyWith(_ChartSalesPerchaseModel value, $Res Function(_ChartSalesPerchaseModel) _then) = __$ChartSalesPerchaseModelCopyWithImpl;
@override @useResult
$Res call({
 List<SalesPurchaseDataModel> data,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalSales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double totalPurchase
});




}
/// @nodoc
class __$ChartSalesPerchaseModelCopyWithImpl<$Res>
    implements _$ChartSalesPerchaseModelCopyWith<$Res> {
  __$ChartSalesPerchaseModelCopyWithImpl(this._self, this._then);

  final _ChartSalesPerchaseModel _self;
  final $Res Function(_ChartSalesPerchaseModel) _then;

/// Create a copy of ChartSalesPerchaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalSales = null,Object? totalPurchase = null,}) {
  return _then(_ChartSalesPerchaseModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesPurchaseDataModel>,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
