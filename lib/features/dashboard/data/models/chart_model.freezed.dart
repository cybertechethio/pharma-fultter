// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartModel {

 ChartSalesPerchaseModel get salesPurchase; ChartCustomerModel get customer; ChartSalesStatisticsModel get salesStatistics; ChartHeatmapModel get heatmap;
/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartModelCopyWith<ChartModel> get copyWith => _$ChartModelCopyWithImpl<ChartModel>(this as ChartModel, _$identity);

  /// Serializes this ChartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartModel&&(identical(other.salesPurchase, salesPurchase) || other.salesPurchase == salesPurchase)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.salesStatistics, salesStatistics) || other.salesStatistics == salesStatistics)&&(identical(other.heatmap, heatmap) || other.heatmap == heatmap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesPurchase,customer,salesStatistics,heatmap);

@override
String toString() {
  return 'ChartModel(salesPurchase: $salesPurchase, customer: $customer, salesStatistics: $salesStatistics, heatmap: $heatmap)';
}


}

/// @nodoc
abstract mixin class $ChartModelCopyWith<$Res>  {
  factory $ChartModelCopyWith(ChartModel value, $Res Function(ChartModel) _then) = _$ChartModelCopyWithImpl;
@useResult
$Res call({
 ChartSalesPerchaseModel salesPurchase, ChartCustomerModel customer, ChartSalesStatisticsModel salesStatistics, ChartHeatmapModel heatmap
});


$ChartSalesPerchaseModelCopyWith<$Res> get salesPurchase;$ChartCustomerModelCopyWith<$Res> get customer;$ChartSalesStatisticsModelCopyWith<$Res> get salesStatistics;$ChartHeatmapModelCopyWith<$Res> get heatmap;

}
/// @nodoc
class _$ChartModelCopyWithImpl<$Res>
    implements $ChartModelCopyWith<$Res> {
  _$ChartModelCopyWithImpl(this._self, this._then);

  final ChartModel _self;
  final $Res Function(ChartModel) _then;

/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesPurchase = null,Object? customer = null,Object? salesStatistics = null,Object? heatmap = null,}) {
  return _then(_self.copyWith(
salesPurchase: null == salesPurchase ? _self.salesPurchase : salesPurchase // ignore: cast_nullable_to_non_nullable
as ChartSalesPerchaseModel,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ChartCustomerModel,salesStatistics: null == salesStatistics ? _self.salesStatistics : salesStatistics // ignore: cast_nullable_to_non_nullable
as ChartSalesStatisticsModel,heatmap: null == heatmap ? _self.heatmap : heatmap // ignore: cast_nullable_to_non_nullable
as ChartHeatmapModel,
  ));
}
/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesPerchaseModelCopyWith<$Res> get salesPurchase {
  
  return $ChartSalesPerchaseModelCopyWith<$Res>(_self.salesPurchase, (value) {
    return _then(_self.copyWith(salesPurchase: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCustomerModelCopyWith<$Res> get customer {
  
  return $ChartCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesStatisticsModelCopyWith<$Res> get salesStatistics {
  
  return $ChartSalesStatisticsModelCopyWith<$Res>(_self.salesStatistics, (value) {
    return _then(_self.copyWith(salesStatistics: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartHeatmapModelCopyWith<$Res> get heatmap {
  
  return $ChartHeatmapModelCopyWith<$Res>(_self.heatmap, (value) {
    return _then(_self.copyWith(heatmap: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChartModel].
extension ChartModelPatterns on ChartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChartSalesPerchaseModel salesPurchase,  ChartCustomerModel customer,  ChartSalesStatisticsModel salesStatistics,  ChartHeatmapModel heatmap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartModel() when $default != null:
return $default(_that.salesPurchase,_that.customer,_that.salesStatistics,_that.heatmap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChartSalesPerchaseModel salesPurchase,  ChartCustomerModel customer,  ChartSalesStatisticsModel salesStatistics,  ChartHeatmapModel heatmap)  $default,) {final _that = this;
switch (_that) {
case _ChartModel():
return $default(_that.salesPurchase,_that.customer,_that.salesStatistics,_that.heatmap);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChartSalesPerchaseModel salesPurchase,  ChartCustomerModel customer,  ChartSalesStatisticsModel salesStatistics,  ChartHeatmapModel heatmap)?  $default,) {final _that = this;
switch (_that) {
case _ChartModel() when $default != null:
return $default(_that.salesPurchase,_that.customer,_that.salesStatistics,_that.heatmap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartModel implements ChartModel {
  const _ChartModel({required this.salesPurchase, required this.customer, required this.salesStatistics, required this.heatmap});
  factory _ChartModel.fromJson(Map<String, dynamic> json) => _$ChartModelFromJson(json);

@override final  ChartSalesPerchaseModel salesPurchase;
@override final  ChartCustomerModel customer;
@override final  ChartSalesStatisticsModel salesStatistics;
@override final  ChartHeatmapModel heatmap;

/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartModelCopyWith<_ChartModel> get copyWith => __$ChartModelCopyWithImpl<_ChartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartModel&&(identical(other.salesPurchase, salesPurchase) || other.salesPurchase == salesPurchase)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.salesStatistics, salesStatistics) || other.salesStatistics == salesStatistics)&&(identical(other.heatmap, heatmap) || other.heatmap == heatmap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesPurchase,customer,salesStatistics,heatmap);

@override
String toString() {
  return 'ChartModel(salesPurchase: $salesPurchase, customer: $customer, salesStatistics: $salesStatistics, heatmap: $heatmap)';
}


}

/// @nodoc
abstract mixin class _$ChartModelCopyWith<$Res> implements $ChartModelCopyWith<$Res> {
  factory _$ChartModelCopyWith(_ChartModel value, $Res Function(_ChartModel) _then) = __$ChartModelCopyWithImpl;
@override @useResult
$Res call({
 ChartSalesPerchaseModel salesPurchase, ChartCustomerModel customer, ChartSalesStatisticsModel salesStatistics, ChartHeatmapModel heatmap
});


@override $ChartSalesPerchaseModelCopyWith<$Res> get salesPurchase;@override $ChartCustomerModelCopyWith<$Res> get customer;@override $ChartSalesStatisticsModelCopyWith<$Res> get salesStatistics;@override $ChartHeatmapModelCopyWith<$Res> get heatmap;

}
/// @nodoc
class __$ChartModelCopyWithImpl<$Res>
    implements _$ChartModelCopyWith<$Res> {
  __$ChartModelCopyWithImpl(this._self, this._then);

  final _ChartModel _self;
  final $Res Function(_ChartModel) _then;

/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesPurchase = null,Object? customer = null,Object? salesStatistics = null,Object? heatmap = null,}) {
  return _then(_ChartModel(
salesPurchase: null == salesPurchase ? _self.salesPurchase : salesPurchase // ignore: cast_nullable_to_non_nullable
as ChartSalesPerchaseModel,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ChartCustomerModel,salesStatistics: null == salesStatistics ? _self.salesStatistics : salesStatistics // ignore: cast_nullable_to_non_nullable
as ChartSalesStatisticsModel,heatmap: null == heatmap ? _self.heatmap : heatmap // ignore: cast_nullable_to_non_nullable
as ChartHeatmapModel,
  ));
}

/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesPerchaseModelCopyWith<$Res> get salesPurchase {
  
  return $ChartSalesPerchaseModelCopyWith<$Res>(_self.salesPurchase, (value) {
    return _then(_self.copyWith(salesPurchase: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCustomerModelCopyWith<$Res> get customer {
  
  return $ChartCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesStatisticsModelCopyWith<$Res> get salesStatistics {
  
  return $ChartSalesStatisticsModelCopyWith<$Res>(_self.salesStatistics, (value) {
    return _then(_self.copyWith(salesStatistics: value));
  });
}/// Create a copy of ChartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartHeatmapModelCopyWith<$Res> get heatmap {
  
  return $ChartHeatmapModelCopyWith<$Res>(_self.heatmap, (value) {
    return _then(_self.copyWith(heatmap: value));
  });
}
}

// dart format on
