// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_salespurchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChartSalesPerchase {

 List<SalesPurchaseData> get data; double get totalSales; double get totalPurchase;
/// Create a copy of ChartSalesPerchase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartSalesPerchaseCopyWith<ChartSalesPerchase> get copyWith => _$ChartSalesPerchaseCopyWithImpl<ChartSalesPerchase>(this as ChartSalesPerchase, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartSalesPerchase&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalSales,totalPurchase);

@override
String toString() {
  return 'ChartSalesPerchase(data: $data, totalSales: $totalSales, totalPurchase: $totalPurchase)';
}


}

/// @nodoc
abstract mixin class $ChartSalesPerchaseCopyWith<$Res>  {
  factory $ChartSalesPerchaseCopyWith(ChartSalesPerchase value, $Res Function(ChartSalesPerchase) _then) = _$ChartSalesPerchaseCopyWithImpl;
@useResult
$Res call({
 List<SalesPurchaseData> data, double totalSales, double totalPurchase
});




}
/// @nodoc
class _$ChartSalesPerchaseCopyWithImpl<$Res>
    implements $ChartSalesPerchaseCopyWith<$Res> {
  _$ChartSalesPerchaseCopyWithImpl(this._self, this._then);

  final ChartSalesPerchase _self;
  final $Res Function(ChartSalesPerchase) _then;

/// Create a copy of ChartSalesPerchase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalSales = null,Object? totalPurchase = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesPurchaseData>,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartSalesPerchase].
extension ChartSalesPerchasePatterns on ChartSalesPerchase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartSalesPerchase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartSalesPerchase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartSalesPerchase value)  $default,){
final _that = this;
switch (_that) {
case _ChartSalesPerchase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartSalesPerchase value)?  $default,){
final _that = this;
switch (_that) {
case _ChartSalesPerchase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesPurchaseData> data,  double totalSales,  double totalPurchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartSalesPerchase() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesPurchaseData> data,  double totalSales,  double totalPurchase)  $default,) {final _that = this;
switch (_that) {
case _ChartSalesPerchase():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesPurchaseData> data,  double totalSales,  double totalPurchase)?  $default,) {final _that = this;
switch (_that) {
case _ChartSalesPerchase() when $default != null:
return $default(_that.data,_that.totalSales,_that.totalPurchase);case _:
  return null;

}
}

}

/// @nodoc


class _ChartSalesPerchase implements ChartSalesPerchase {
  const _ChartSalesPerchase({required final  List<SalesPurchaseData> data, required this.totalSales, required this.totalPurchase}): _data = data;
  

 final  List<SalesPurchaseData> _data;
@override List<SalesPurchaseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  double totalSales;
@override final  double totalPurchase;

/// Create a copy of ChartSalesPerchase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartSalesPerchaseCopyWith<_ChartSalesPerchase> get copyWith => __$ChartSalesPerchaseCopyWithImpl<_ChartSalesPerchase>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartSalesPerchase&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalPurchase, totalPurchase) || other.totalPurchase == totalPurchase));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalSales,totalPurchase);

@override
String toString() {
  return 'ChartSalesPerchase(data: $data, totalSales: $totalSales, totalPurchase: $totalPurchase)';
}


}

/// @nodoc
abstract mixin class _$ChartSalesPerchaseCopyWith<$Res> implements $ChartSalesPerchaseCopyWith<$Res> {
  factory _$ChartSalesPerchaseCopyWith(_ChartSalesPerchase value, $Res Function(_ChartSalesPerchase) _then) = __$ChartSalesPerchaseCopyWithImpl;
@override @useResult
$Res call({
 List<SalesPurchaseData> data, double totalSales, double totalPurchase
});




}
/// @nodoc
class __$ChartSalesPerchaseCopyWithImpl<$Res>
    implements _$ChartSalesPerchaseCopyWith<$Res> {
  __$ChartSalesPerchaseCopyWithImpl(this._self, this._then);

  final _ChartSalesPerchase _self;
  final $Res Function(_ChartSalesPerchase) _then;

/// Create a copy of ChartSalesPerchase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalSales = null,Object? totalPurchase = null,}) {
  return _then(_ChartSalesPerchase(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesPurchaseData>,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalPurchase: null == totalPurchase ? _self.totalPurchase : totalPurchase // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
