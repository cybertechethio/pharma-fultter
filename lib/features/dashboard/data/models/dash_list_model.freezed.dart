// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashListModel {

 List<TopSellingProductModel> get topSellingProducts; List<LowStockProductModel> get lowStockProducts; List<TopCustomerModel> get topCustomers;
/// Create a copy of DashListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashListModelCopyWith<DashListModel> get copyWith => _$DashListModelCopyWithImpl<DashListModel>(this as DashListModel, _$identity);

  /// Serializes this DashListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashListModel&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts)&&const DeepCollectionEquality().equals(other.lowStockProducts, lowStockProducts)&&const DeepCollectionEquality().equals(other.topCustomers, topCustomers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(topSellingProducts),const DeepCollectionEquality().hash(lowStockProducts),const DeepCollectionEquality().hash(topCustomers));

@override
String toString() {
  return 'DashListModel(topSellingProducts: $topSellingProducts, lowStockProducts: $lowStockProducts, topCustomers: $topCustomers)';
}


}

/// @nodoc
abstract mixin class $DashListModelCopyWith<$Res>  {
  factory $DashListModelCopyWith(DashListModel value, $Res Function(DashListModel) _then) = _$DashListModelCopyWithImpl;
@useResult
$Res call({
 List<TopSellingProductModel> topSellingProducts, List<LowStockProductModel> lowStockProducts, List<TopCustomerModel> topCustomers
});




}
/// @nodoc
class _$DashListModelCopyWithImpl<$Res>
    implements $DashListModelCopyWith<$Res> {
  _$DashListModelCopyWithImpl(this._self, this._then);

  final DashListModel _self;
  final $Res Function(DashListModel) _then;

/// Create a copy of DashListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topSellingProducts = null,Object? lowStockProducts = null,Object? topCustomers = null,}) {
  return _then(_self.copyWith(
topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProductModel>,lowStockProducts: null == lowStockProducts ? _self.lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProductModel>,topCustomers: null == topCustomers ? _self.topCustomers : topCustomers // ignore: cast_nullable_to_non_nullable
as List<TopCustomerModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashListModel].
extension DashListModelPatterns on DashListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashListModel value)  $default,){
final _that = this;
switch (_that) {
case _DashListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashListModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TopSellingProductModel> topSellingProducts,  List<LowStockProductModel> lowStockProducts,  List<TopCustomerModel> topCustomers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashListModel() when $default != null:
return $default(_that.topSellingProducts,_that.lowStockProducts,_that.topCustomers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TopSellingProductModel> topSellingProducts,  List<LowStockProductModel> lowStockProducts,  List<TopCustomerModel> topCustomers)  $default,) {final _that = this;
switch (_that) {
case _DashListModel():
return $default(_that.topSellingProducts,_that.lowStockProducts,_that.topCustomers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TopSellingProductModel> topSellingProducts,  List<LowStockProductModel> lowStockProducts,  List<TopCustomerModel> topCustomers)?  $default,) {final _that = this;
switch (_that) {
case _DashListModel() when $default != null:
return $default(_that.topSellingProducts,_that.lowStockProducts,_that.topCustomers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashListModel implements DashListModel {
  const _DashListModel({required final  List<TopSellingProductModel> topSellingProducts, required final  List<LowStockProductModel> lowStockProducts, required final  List<TopCustomerModel> topCustomers}): _topSellingProducts = topSellingProducts,_lowStockProducts = lowStockProducts,_topCustomers = topCustomers;
  factory _DashListModel.fromJson(Map<String, dynamic> json) => _$DashListModelFromJson(json);

 final  List<TopSellingProductModel> _topSellingProducts;
@override List<TopSellingProductModel> get topSellingProducts {
  if (_topSellingProducts is EqualUnmodifiableListView) return _topSellingProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingProducts);
}

 final  List<LowStockProductModel> _lowStockProducts;
@override List<LowStockProductModel> get lowStockProducts {
  if (_lowStockProducts is EqualUnmodifiableListView) return _lowStockProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStockProducts);
}

 final  List<TopCustomerModel> _topCustomers;
@override List<TopCustomerModel> get topCustomers {
  if (_topCustomers is EqualUnmodifiableListView) return _topCustomers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCustomers);
}


/// Create a copy of DashListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashListModelCopyWith<_DashListModel> get copyWith => __$DashListModelCopyWithImpl<_DashListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashListModel&&const DeepCollectionEquality().equals(other._topSellingProducts, _topSellingProducts)&&const DeepCollectionEquality().equals(other._lowStockProducts, _lowStockProducts)&&const DeepCollectionEquality().equals(other._topCustomers, _topCustomers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_topSellingProducts),const DeepCollectionEquality().hash(_lowStockProducts),const DeepCollectionEquality().hash(_topCustomers));

@override
String toString() {
  return 'DashListModel(topSellingProducts: $topSellingProducts, lowStockProducts: $lowStockProducts, topCustomers: $topCustomers)';
}


}

/// @nodoc
abstract mixin class _$DashListModelCopyWith<$Res> implements $DashListModelCopyWith<$Res> {
  factory _$DashListModelCopyWith(_DashListModel value, $Res Function(_DashListModel) _then) = __$DashListModelCopyWithImpl;
@override @useResult
$Res call({
 List<TopSellingProductModel> topSellingProducts, List<LowStockProductModel> lowStockProducts, List<TopCustomerModel> topCustomers
});




}
/// @nodoc
class __$DashListModelCopyWithImpl<$Res>
    implements _$DashListModelCopyWith<$Res> {
  __$DashListModelCopyWithImpl(this._self, this._then);

  final _DashListModel _self;
  final $Res Function(_DashListModel) _then;

/// Create a copy of DashListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topSellingProducts = null,Object? lowStockProducts = null,Object? topCustomers = null,}) {
  return _then(_DashListModel(
topSellingProducts: null == topSellingProducts ? _self._topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProductModel>,lowStockProducts: null == lowStockProducts ? _self._lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProductModel>,topCustomers: null == topCustomers ? _self._topCustomers : topCustomers // ignore: cast_nullable_to_non_nullable
as List<TopCustomerModel>,
  ));
}


}

// dart format on
