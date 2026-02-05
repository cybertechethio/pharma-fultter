// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Chart {

 ChartSalesPerchase get salesPurchase; ChartCustomer get customer; ChartSalesStatistics get salesStatistics; ChartHeatmap get heatmap;
/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartCopyWith<Chart> get copyWith => _$ChartCopyWithImpl<Chart>(this as Chart, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chart&&(identical(other.salesPurchase, salesPurchase) || other.salesPurchase == salesPurchase)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.salesStatistics, salesStatistics) || other.salesStatistics == salesStatistics)&&(identical(other.heatmap, heatmap) || other.heatmap == heatmap));
}


@override
int get hashCode => Object.hash(runtimeType,salesPurchase,customer,salesStatistics,heatmap);

@override
String toString() {
  return 'Chart(salesPurchase: $salesPurchase, customer: $customer, salesStatistics: $salesStatistics, heatmap: $heatmap)';
}


}

/// @nodoc
abstract mixin class $ChartCopyWith<$Res>  {
  factory $ChartCopyWith(Chart value, $Res Function(Chart) _then) = _$ChartCopyWithImpl;
@useResult
$Res call({
 ChartSalesPerchase salesPurchase, ChartCustomer customer, ChartSalesStatistics salesStatistics, ChartHeatmap heatmap
});


$ChartSalesPerchaseCopyWith<$Res> get salesPurchase;$ChartCustomerCopyWith<$Res> get customer;$ChartSalesStatisticsCopyWith<$Res> get salesStatistics;$ChartHeatmapCopyWith<$Res> get heatmap;

}
/// @nodoc
class _$ChartCopyWithImpl<$Res>
    implements $ChartCopyWith<$Res> {
  _$ChartCopyWithImpl(this._self, this._then);

  final Chart _self;
  final $Res Function(Chart) _then;

/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesPurchase = null,Object? customer = null,Object? salesStatistics = null,Object? heatmap = null,}) {
  return _then(_self.copyWith(
salesPurchase: null == salesPurchase ? _self.salesPurchase : salesPurchase // ignore: cast_nullable_to_non_nullable
as ChartSalesPerchase,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ChartCustomer,salesStatistics: null == salesStatistics ? _self.salesStatistics : salesStatistics // ignore: cast_nullable_to_non_nullable
as ChartSalesStatistics,heatmap: null == heatmap ? _self.heatmap : heatmap // ignore: cast_nullable_to_non_nullable
as ChartHeatmap,
  ));
}
/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesPerchaseCopyWith<$Res> get salesPurchase {
  
  return $ChartSalesPerchaseCopyWith<$Res>(_self.salesPurchase, (value) {
    return _then(_self.copyWith(salesPurchase: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCustomerCopyWith<$Res> get customer {
  
  return $ChartCustomerCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesStatisticsCopyWith<$Res> get salesStatistics {
  
  return $ChartSalesStatisticsCopyWith<$Res>(_self.salesStatistics, (value) {
    return _then(_self.copyWith(salesStatistics: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartHeatmapCopyWith<$Res> get heatmap {
  
  return $ChartHeatmapCopyWith<$Res>(_self.heatmap, (value) {
    return _then(_self.copyWith(heatmap: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chart].
extension ChartPatterns on Chart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chart value)  $default,){
final _that = this;
switch (_that) {
case _Chart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chart value)?  $default,){
final _that = this;
switch (_that) {
case _Chart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChartSalesPerchase salesPurchase,  ChartCustomer customer,  ChartSalesStatistics salesStatistics,  ChartHeatmap heatmap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chart() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChartSalesPerchase salesPurchase,  ChartCustomer customer,  ChartSalesStatistics salesStatistics,  ChartHeatmap heatmap)  $default,) {final _that = this;
switch (_that) {
case _Chart():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChartSalesPerchase salesPurchase,  ChartCustomer customer,  ChartSalesStatistics salesStatistics,  ChartHeatmap heatmap)?  $default,) {final _that = this;
switch (_that) {
case _Chart() when $default != null:
return $default(_that.salesPurchase,_that.customer,_that.salesStatistics,_that.heatmap);case _:
  return null;

}
}

}

/// @nodoc


class _Chart implements Chart {
  const _Chart({required this.salesPurchase, required this.customer, required this.salesStatistics, required this.heatmap});
  

@override final  ChartSalesPerchase salesPurchase;
@override final  ChartCustomer customer;
@override final  ChartSalesStatistics salesStatistics;
@override final  ChartHeatmap heatmap;

/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartCopyWith<_Chart> get copyWith => __$ChartCopyWithImpl<_Chart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chart&&(identical(other.salesPurchase, salesPurchase) || other.salesPurchase == salesPurchase)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.salesStatistics, salesStatistics) || other.salesStatistics == salesStatistics)&&(identical(other.heatmap, heatmap) || other.heatmap == heatmap));
}


@override
int get hashCode => Object.hash(runtimeType,salesPurchase,customer,salesStatistics,heatmap);

@override
String toString() {
  return 'Chart(salesPurchase: $salesPurchase, customer: $customer, salesStatistics: $salesStatistics, heatmap: $heatmap)';
}


}

/// @nodoc
abstract mixin class _$ChartCopyWith<$Res> implements $ChartCopyWith<$Res> {
  factory _$ChartCopyWith(_Chart value, $Res Function(_Chart) _then) = __$ChartCopyWithImpl;
@override @useResult
$Res call({
 ChartSalesPerchase salesPurchase, ChartCustomer customer, ChartSalesStatistics salesStatistics, ChartHeatmap heatmap
});


@override $ChartSalesPerchaseCopyWith<$Res> get salesPurchase;@override $ChartCustomerCopyWith<$Res> get customer;@override $ChartSalesStatisticsCopyWith<$Res> get salesStatistics;@override $ChartHeatmapCopyWith<$Res> get heatmap;

}
/// @nodoc
class __$ChartCopyWithImpl<$Res>
    implements _$ChartCopyWith<$Res> {
  __$ChartCopyWithImpl(this._self, this._then);

  final _Chart _self;
  final $Res Function(_Chart) _then;

/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesPurchase = null,Object? customer = null,Object? salesStatistics = null,Object? heatmap = null,}) {
  return _then(_Chart(
salesPurchase: null == salesPurchase ? _self.salesPurchase : salesPurchase // ignore: cast_nullable_to_non_nullable
as ChartSalesPerchase,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ChartCustomer,salesStatistics: null == salesStatistics ? _self.salesStatistics : salesStatistics // ignore: cast_nullable_to_non_nullable
as ChartSalesStatistics,heatmap: null == heatmap ? _self.heatmap : heatmap // ignore: cast_nullable_to_non_nullable
as ChartHeatmap,
  ));
}

/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesPerchaseCopyWith<$Res> get salesPurchase {
  
  return $ChartSalesPerchaseCopyWith<$Res>(_self.salesPurchase, (value) {
    return _then(_self.copyWith(salesPurchase: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartCustomerCopyWith<$Res> get customer {
  
  return $ChartCustomerCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartSalesStatisticsCopyWith<$Res> get salesStatistics {
  
  return $ChartSalesStatisticsCopyWith<$Res>(_self.salesStatistics, (value) {
    return _then(_self.copyWith(salesStatistics: value));
  });
}/// Create a copy of Chart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartHeatmapCopyWith<$Res> get heatmap {
  
  return $ChartHeatmapCopyWith<$Res>(_self.heatmap, (value) {
    return _then(_self.copyWith(heatmap: value));
  });
}
}

// dart format on
