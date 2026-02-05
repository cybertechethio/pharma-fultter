// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashList {

 List<TopSellingProduct> get topSellingProducts; List<LowStockProduct> get lowStockProducts; List<TopCustomer> get topCustomers;
/// Create a copy of DashList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashListCopyWith<DashList> get copyWith => _$DashListCopyWithImpl<DashList>(this as DashList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashList&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts)&&const DeepCollectionEquality().equals(other.lowStockProducts, lowStockProducts)&&const DeepCollectionEquality().equals(other.topCustomers, topCustomers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(topSellingProducts),const DeepCollectionEquality().hash(lowStockProducts),const DeepCollectionEquality().hash(topCustomers));

@override
String toString() {
  return 'DashList(topSellingProducts: $topSellingProducts, lowStockProducts: $lowStockProducts, topCustomers: $topCustomers)';
}


}

/// @nodoc
abstract mixin class $DashListCopyWith<$Res>  {
  factory $DashListCopyWith(DashList value, $Res Function(DashList) _then) = _$DashListCopyWithImpl;
@useResult
$Res call({
 List<TopSellingProduct> topSellingProducts, List<LowStockProduct> lowStockProducts, List<TopCustomer> topCustomers
});




}
/// @nodoc
class _$DashListCopyWithImpl<$Res>
    implements $DashListCopyWith<$Res> {
  _$DashListCopyWithImpl(this._self, this._then);

  final DashList _self;
  final $Res Function(DashList) _then;

/// Create a copy of DashList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topSellingProducts = null,Object? lowStockProducts = null,Object? topCustomers = null,}) {
  return _then(_self.copyWith(
topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProduct>,lowStockProducts: null == lowStockProducts ? _self.lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProduct>,topCustomers: null == topCustomers ? _self.topCustomers : topCustomers // ignore: cast_nullable_to_non_nullable
as List<TopCustomer>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashList].
extension DashListPatterns on DashList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashList value)  $default,){
final _that = this;
switch (_that) {
case _DashList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashList value)?  $default,){
final _that = this;
switch (_that) {
case _DashList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TopSellingProduct> topSellingProducts,  List<LowStockProduct> lowStockProducts,  List<TopCustomer> topCustomers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TopSellingProduct> topSellingProducts,  List<LowStockProduct> lowStockProducts,  List<TopCustomer> topCustomers)  $default,) {final _that = this;
switch (_that) {
case _DashList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TopSellingProduct> topSellingProducts,  List<LowStockProduct> lowStockProducts,  List<TopCustomer> topCustomers)?  $default,) {final _that = this;
switch (_that) {
case _DashList() when $default != null:
return $default(_that.topSellingProducts,_that.lowStockProducts,_that.topCustomers);case _:
  return null;

}
}

}

/// @nodoc


class _DashList implements DashList {
  const _DashList({required final  List<TopSellingProduct> topSellingProducts, required final  List<LowStockProduct> lowStockProducts, required final  List<TopCustomer> topCustomers}): _topSellingProducts = topSellingProducts,_lowStockProducts = lowStockProducts,_topCustomers = topCustomers;
  

 final  List<TopSellingProduct> _topSellingProducts;
@override List<TopSellingProduct> get topSellingProducts {
  if (_topSellingProducts is EqualUnmodifiableListView) return _topSellingProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingProducts);
}

 final  List<LowStockProduct> _lowStockProducts;
@override List<LowStockProduct> get lowStockProducts {
  if (_lowStockProducts is EqualUnmodifiableListView) return _lowStockProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lowStockProducts);
}

 final  List<TopCustomer> _topCustomers;
@override List<TopCustomer> get topCustomers {
  if (_topCustomers is EqualUnmodifiableListView) return _topCustomers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCustomers);
}


/// Create a copy of DashList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashListCopyWith<_DashList> get copyWith => __$DashListCopyWithImpl<_DashList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashList&&const DeepCollectionEquality().equals(other._topSellingProducts, _topSellingProducts)&&const DeepCollectionEquality().equals(other._lowStockProducts, _lowStockProducts)&&const DeepCollectionEquality().equals(other._topCustomers, _topCustomers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_topSellingProducts),const DeepCollectionEquality().hash(_lowStockProducts),const DeepCollectionEquality().hash(_topCustomers));

@override
String toString() {
  return 'DashList(topSellingProducts: $topSellingProducts, lowStockProducts: $lowStockProducts, topCustomers: $topCustomers)';
}


}

/// @nodoc
abstract mixin class _$DashListCopyWith<$Res> implements $DashListCopyWith<$Res> {
  factory _$DashListCopyWith(_DashList value, $Res Function(_DashList) _then) = __$DashListCopyWithImpl;
@override @useResult
$Res call({
 List<TopSellingProduct> topSellingProducts, List<LowStockProduct> lowStockProducts, List<TopCustomer> topCustomers
});




}
/// @nodoc
class __$DashListCopyWithImpl<$Res>
    implements _$DashListCopyWith<$Res> {
  __$DashListCopyWithImpl(this._self, this._then);

  final _DashList _self;
  final $Res Function(_DashList) _then;

/// Create a copy of DashList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topSellingProducts = null,Object? lowStockProducts = null,Object? topCustomers = null,}) {
  return _then(_DashList(
topSellingProducts: null == topSellingProducts ? _self._topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProduct>,lowStockProducts: null == lowStockProducts ? _self._lowStockProducts : lowStockProducts // ignore: cast_nullable_to_non_nullable
as List<LowStockProduct>,topCustomers: null == topCustomers ? _self._topCustomers : topCustomers // ignore: cast_nullable_to_non_nullable
as List<TopCustomer>,
  ));
}


}

// dart format on
