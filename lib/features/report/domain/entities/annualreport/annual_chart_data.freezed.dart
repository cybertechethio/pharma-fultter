// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnualChartData {

 AnnualMonths get salesProfitTrend; AnnualItemTypesBreakdown get itemTypesBreakdown;
/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualChartDataCopyWith<AnnualChartData> get copyWith => _$AnnualChartDataCopyWithImpl<AnnualChartData>(this as AnnualChartData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualChartData&&(identical(other.salesProfitTrend, salesProfitTrend) || other.salesProfitTrend == salesProfitTrend)&&(identical(other.itemTypesBreakdown, itemTypesBreakdown) || other.itemTypesBreakdown == itemTypesBreakdown));
}


@override
int get hashCode => Object.hash(runtimeType,salesProfitTrend,itemTypesBreakdown);

@override
String toString() {
  return 'AnnualChartData(salesProfitTrend: $salesProfitTrend, itemTypesBreakdown: $itemTypesBreakdown)';
}


}

/// @nodoc
abstract mixin class $AnnualChartDataCopyWith<$Res>  {
  factory $AnnualChartDataCopyWith(AnnualChartData value, $Res Function(AnnualChartData) _then) = _$AnnualChartDataCopyWithImpl;
@useResult
$Res call({
 AnnualMonths salesProfitTrend, AnnualItemTypesBreakdown itemTypesBreakdown
});


$AnnualMonthsCopyWith<$Res> get salesProfitTrend;$AnnualItemTypesBreakdownCopyWith<$Res> get itemTypesBreakdown;

}
/// @nodoc
class _$AnnualChartDataCopyWithImpl<$Res>
    implements $AnnualChartDataCopyWith<$Res> {
  _$AnnualChartDataCopyWithImpl(this._self, this._then);

  final AnnualChartData _self;
  final $Res Function(AnnualChartData) _then;

/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesProfitTrend = null,Object? itemTypesBreakdown = null,}) {
  return _then(_self.copyWith(
salesProfitTrend: null == salesProfitTrend ? _self.salesProfitTrend : salesProfitTrend // ignore: cast_nullable_to_non_nullable
as AnnualMonths,itemTypesBreakdown: null == itemTypesBreakdown ? _self.itemTypesBreakdown : itemTypesBreakdown // ignore: cast_nullable_to_non_nullable
as AnnualItemTypesBreakdown,
  ));
}
/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualMonthsCopyWith<$Res> get salesProfitTrend {
  
  return $AnnualMonthsCopyWith<$Res>(_self.salesProfitTrend, (value) {
    return _then(_self.copyWith(salesProfitTrend: value));
  });
}/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownCopyWith<$Res> get itemTypesBreakdown {
  
  return $AnnualItemTypesBreakdownCopyWith<$Res>(_self.itemTypesBreakdown, (value) {
    return _then(_self.copyWith(itemTypesBreakdown: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualChartData].
extension AnnualChartDataPatterns on AnnualChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualChartData value)  $default,){
final _that = this;
switch (_that) {
case _AnnualChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualChartData value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualMonths salesProfitTrend,  AnnualItemTypesBreakdown itemTypesBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualChartData() when $default != null:
return $default(_that.salesProfitTrend,_that.itemTypesBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualMonths salesProfitTrend,  AnnualItemTypesBreakdown itemTypesBreakdown)  $default,) {final _that = this;
switch (_that) {
case _AnnualChartData():
return $default(_that.salesProfitTrend,_that.itemTypesBreakdown);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualMonths salesProfitTrend,  AnnualItemTypesBreakdown itemTypesBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _AnnualChartData() when $default != null:
return $default(_that.salesProfitTrend,_that.itemTypesBreakdown);case _:
  return null;

}
}

}

/// @nodoc


class _AnnualChartData implements AnnualChartData {
  const _AnnualChartData({required this.salesProfitTrend, required this.itemTypesBreakdown});
  

@override final  AnnualMonths salesProfitTrend;
@override final  AnnualItemTypesBreakdown itemTypesBreakdown;

/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualChartDataCopyWith<_AnnualChartData> get copyWith => __$AnnualChartDataCopyWithImpl<_AnnualChartData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualChartData&&(identical(other.salesProfitTrend, salesProfitTrend) || other.salesProfitTrend == salesProfitTrend)&&(identical(other.itemTypesBreakdown, itemTypesBreakdown) || other.itemTypesBreakdown == itemTypesBreakdown));
}


@override
int get hashCode => Object.hash(runtimeType,salesProfitTrend,itemTypesBreakdown);

@override
String toString() {
  return 'AnnualChartData(salesProfitTrend: $salesProfitTrend, itemTypesBreakdown: $itemTypesBreakdown)';
}


}

/// @nodoc
abstract mixin class _$AnnualChartDataCopyWith<$Res> implements $AnnualChartDataCopyWith<$Res> {
  factory _$AnnualChartDataCopyWith(_AnnualChartData value, $Res Function(_AnnualChartData) _then) = __$AnnualChartDataCopyWithImpl;
@override @useResult
$Res call({
 AnnualMonths salesProfitTrend, AnnualItemTypesBreakdown itemTypesBreakdown
});


@override $AnnualMonthsCopyWith<$Res> get salesProfitTrend;@override $AnnualItemTypesBreakdownCopyWith<$Res> get itemTypesBreakdown;

}
/// @nodoc
class __$AnnualChartDataCopyWithImpl<$Res>
    implements _$AnnualChartDataCopyWith<$Res> {
  __$AnnualChartDataCopyWithImpl(this._self, this._then);

  final _AnnualChartData _self;
  final $Res Function(_AnnualChartData) _then;

/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesProfitTrend = null,Object? itemTypesBreakdown = null,}) {
  return _then(_AnnualChartData(
salesProfitTrend: null == salesProfitTrend ? _self.salesProfitTrend : salesProfitTrend // ignore: cast_nullable_to_non_nullable
as AnnualMonths,itemTypesBreakdown: null == itemTypesBreakdown ? _self.itemTypesBreakdown : itemTypesBreakdown // ignore: cast_nullable_to_non_nullable
as AnnualItemTypesBreakdown,
  ));
}

/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualMonthsCopyWith<$Res> get salesProfitTrend {
  
  return $AnnualMonthsCopyWith<$Res>(_self.salesProfitTrend, (value) {
    return _then(_self.copyWith(salesProfitTrend: value));
  });
}/// Create a copy of AnnualChartData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownCopyWith<$Res> get itemTypesBreakdown {
  
  return $AnnualItemTypesBreakdownCopyWith<$Res>(_self.itemTypesBreakdown, (value) {
    return _then(_self.copyWith(itemTypesBreakdown: value));
  });
}
}

// dart format on
