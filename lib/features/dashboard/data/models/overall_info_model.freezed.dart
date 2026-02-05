// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overall_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OverallInfoModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get suppliers;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get customers;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get orders;
/// Create a copy of OverallInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverallInfoModelCopyWith<OverallInfoModel> get copyWith => _$OverallInfoModelCopyWithImpl<OverallInfoModel>(this as OverallInfoModel, _$identity);

  /// Serializes this OverallInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverallInfoModel&&(identical(other.suppliers, suppliers) || other.suppliers == suppliers)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.orders, orders) || other.orders == orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suppliers,customers,orders);

@override
String toString() {
  return 'OverallInfoModel(suppliers: $suppliers, customers: $customers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $OverallInfoModelCopyWith<$Res>  {
  factory $OverallInfoModelCopyWith(OverallInfoModel value, $Res Function(OverallInfoModel) _then) = _$OverallInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int suppliers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int customers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int orders
});




}
/// @nodoc
class _$OverallInfoModelCopyWithImpl<$Res>
    implements $OverallInfoModelCopyWith<$Res> {
  _$OverallInfoModelCopyWithImpl(this._self, this._then);

  final OverallInfoModel _self;
  final $Res Function(OverallInfoModel) _then;

/// Create a copy of OverallInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suppliers = null,Object? customers = null,Object? orders = null,}) {
  return _then(_self.copyWith(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as int,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OverallInfoModel].
extension OverallInfoModelPatterns on OverallInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverallInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverallInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverallInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _OverallInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverallInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _OverallInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int suppliers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverallInfoModel() when $default != null:
return $default(_that.suppliers,_that.customers,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int suppliers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders)  $default,) {final _that = this;
switch (_that) {
case _OverallInfoModel():
return $default(_that.suppliers,_that.customers,_that.orders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int suppliers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int customers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders)?  $default,) {final _that = this;
switch (_that) {
case _OverallInfoModel() when $default != null:
return $default(_that.suppliers,_that.customers,_that.orders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverallInfoModel implements OverallInfoModel {
  const _OverallInfoModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.suppliers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.customers, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.orders});
  factory _OverallInfoModel.fromJson(Map<String, dynamic> json) => _$OverallInfoModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int suppliers;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int customers;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int orders;

/// Create a copy of OverallInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverallInfoModelCopyWith<_OverallInfoModel> get copyWith => __$OverallInfoModelCopyWithImpl<_OverallInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverallInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverallInfoModel&&(identical(other.suppliers, suppliers) || other.suppliers == suppliers)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.orders, orders) || other.orders == orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suppliers,customers,orders);

@override
String toString() {
  return 'OverallInfoModel(suppliers: $suppliers, customers: $customers, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$OverallInfoModelCopyWith<$Res> implements $OverallInfoModelCopyWith<$Res> {
  factory _$OverallInfoModelCopyWith(_OverallInfoModel value, $Res Function(_OverallInfoModel) _then) = __$OverallInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int suppliers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int customers,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int orders
});




}
/// @nodoc
class __$OverallInfoModelCopyWithImpl<$Res>
    implements _$OverallInfoModelCopyWith<$Res> {
  __$OverallInfoModelCopyWithImpl(this._self, this._then);

  final _OverallInfoModel _self;
  final $Res Function(_OverallInfoModel) _then;

/// Create a copy of OverallInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suppliers = null,Object? customers = null,Object? orders = null,}) {
  return _then(_OverallInfoModel(
suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as int,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
