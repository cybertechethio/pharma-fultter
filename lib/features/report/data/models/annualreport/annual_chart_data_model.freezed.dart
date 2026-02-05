// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_chart_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualChartDataModel {

 AnnualMonthsModel get salesProfitTrend; AnnualItemTypesBreakdownModel get itemTypesBreakdown;
/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualChartDataModelCopyWith<AnnualChartDataModel> get copyWith => _$AnnualChartDataModelCopyWithImpl<AnnualChartDataModel>(this as AnnualChartDataModel, _$identity);

  /// Serializes this AnnualChartDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualChartDataModel&&(identical(other.salesProfitTrend, salesProfitTrend) || other.salesProfitTrend == salesProfitTrend)&&(identical(other.itemTypesBreakdown, itemTypesBreakdown) || other.itemTypesBreakdown == itemTypesBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesProfitTrend,itemTypesBreakdown);

@override
String toString() {
  return 'AnnualChartDataModel(salesProfitTrend: $salesProfitTrend, itemTypesBreakdown: $itemTypesBreakdown)';
}


}

/// @nodoc
abstract mixin class $AnnualChartDataModelCopyWith<$Res>  {
  factory $AnnualChartDataModelCopyWith(AnnualChartDataModel value, $Res Function(AnnualChartDataModel) _then) = _$AnnualChartDataModelCopyWithImpl;
@useResult
$Res call({
 AnnualMonthsModel salesProfitTrend, AnnualItemTypesBreakdownModel itemTypesBreakdown
});


$AnnualMonthsModelCopyWith<$Res> get salesProfitTrend;$AnnualItemTypesBreakdownModelCopyWith<$Res> get itemTypesBreakdown;

}
/// @nodoc
class _$AnnualChartDataModelCopyWithImpl<$Res>
    implements $AnnualChartDataModelCopyWith<$Res> {
  _$AnnualChartDataModelCopyWithImpl(this._self, this._then);

  final AnnualChartDataModel _self;
  final $Res Function(AnnualChartDataModel) _then;

/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? salesProfitTrend = null,Object? itemTypesBreakdown = null,}) {
  return _then(_self.copyWith(
salesProfitTrend: null == salesProfitTrend ? _self.salesProfitTrend : salesProfitTrend // ignore: cast_nullable_to_non_nullable
as AnnualMonthsModel,itemTypesBreakdown: null == itemTypesBreakdown ? _self.itemTypesBreakdown : itemTypesBreakdown // ignore: cast_nullable_to_non_nullable
as AnnualItemTypesBreakdownModel,
  ));
}
/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualMonthsModelCopyWith<$Res> get salesProfitTrend {
  
  return $AnnualMonthsModelCopyWith<$Res>(_self.salesProfitTrend, (value) {
    return _then(_self.copyWith(salesProfitTrend: value));
  });
}/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownModelCopyWith<$Res> get itemTypesBreakdown {
  
  return $AnnualItemTypesBreakdownModelCopyWith<$Res>(_self.itemTypesBreakdown, (value) {
    return _then(_self.copyWith(itemTypesBreakdown: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnnualChartDataModel].
extension AnnualChartDataModelPatterns on AnnualChartDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualChartDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualChartDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualChartDataModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualChartDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualChartDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualChartDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnualMonthsModel salesProfitTrend,  AnnualItemTypesBreakdownModel itemTypesBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualChartDataModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnualMonthsModel salesProfitTrend,  AnnualItemTypesBreakdownModel itemTypesBreakdown)  $default,) {final _that = this;
switch (_that) {
case _AnnualChartDataModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnualMonthsModel salesProfitTrend,  AnnualItemTypesBreakdownModel itemTypesBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _AnnualChartDataModel() when $default != null:
return $default(_that.salesProfitTrend,_that.itemTypesBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualChartDataModel implements AnnualChartDataModel {
  const _AnnualChartDataModel({required this.salesProfitTrend, required this.itemTypesBreakdown});
  factory _AnnualChartDataModel.fromJson(Map<String, dynamic> json) => _$AnnualChartDataModelFromJson(json);

@override final  AnnualMonthsModel salesProfitTrend;
@override final  AnnualItemTypesBreakdownModel itemTypesBreakdown;

/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualChartDataModelCopyWith<_AnnualChartDataModel> get copyWith => __$AnnualChartDataModelCopyWithImpl<_AnnualChartDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualChartDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualChartDataModel&&(identical(other.salesProfitTrend, salesProfitTrend) || other.salesProfitTrend == salesProfitTrend)&&(identical(other.itemTypesBreakdown, itemTypesBreakdown) || other.itemTypesBreakdown == itemTypesBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,salesProfitTrend,itemTypesBreakdown);

@override
String toString() {
  return 'AnnualChartDataModel(salesProfitTrend: $salesProfitTrend, itemTypesBreakdown: $itemTypesBreakdown)';
}


}

/// @nodoc
abstract mixin class _$AnnualChartDataModelCopyWith<$Res> implements $AnnualChartDataModelCopyWith<$Res> {
  factory _$AnnualChartDataModelCopyWith(_AnnualChartDataModel value, $Res Function(_AnnualChartDataModel) _then) = __$AnnualChartDataModelCopyWithImpl;
@override @useResult
$Res call({
 AnnualMonthsModel salesProfitTrend, AnnualItemTypesBreakdownModel itemTypesBreakdown
});


@override $AnnualMonthsModelCopyWith<$Res> get salesProfitTrend;@override $AnnualItemTypesBreakdownModelCopyWith<$Res> get itemTypesBreakdown;

}
/// @nodoc
class __$AnnualChartDataModelCopyWithImpl<$Res>
    implements _$AnnualChartDataModelCopyWith<$Res> {
  __$AnnualChartDataModelCopyWithImpl(this._self, this._then);

  final _AnnualChartDataModel _self;
  final $Res Function(_AnnualChartDataModel) _then;

/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? salesProfitTrend = null,Object? itemTypesBreakdown = null,}) {
  return _then(_AnnualChartDataModel(
salesProfitTrend: null == salesProfitTrend ? _self.salesProfitTrend : salesProfitTrend // ignore: cast_nullable_to_non_nullable
as AnnualMonthsModel,itemTypesBreakdown: null == itemTypesBreakdown ? _self.itemTypesBreakdown : itemTypesBreakdown // ignore: cast_nullable_to_non_nullable
as AnnualItemTypesBreakdownModel,
  ));
}

/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualMonthsModelCopyWith<$Res> get salesProfitTrend {
  
  return $AnnualMonthsModelCopyWith<$Res>(_self.salesProfitTrend, (value) {
    return _then(_self.copyWith(salesProfitTrend: value));
  });
}/// Create a copy of AnnualChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnualItemTypesBreakdownModelCopyWith<$Res> get itemTypesBreakdown {
  
  return $AnnualItemTypesBreakdownModelCopyWith<$Res>(_self.itemTypesBreakdown, (value) {
    return _then(_self.copyWith(itemTypesBreakdown: value));
  });
}
}

// dart format on
