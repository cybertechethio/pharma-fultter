// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopCustomerModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get name; String? get imageUrl; String? get location;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get orders;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get total;
/// Create a copy of TopCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopCustomerModelCopyWith<TopCustomerModel> get copyWith => _$TopCustomerModelCopyWithImpl<TopCustomerModel>(this as TopCustomerModel, _$identity);

  /// Serializes this TopCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,location,orders,total);

@override
String toString() {
  return 'TopCustomerModel(id: $id, name: $name, imageUrl: $imageUrl, location: $location, orders: $orders, total: $total)';
}


}

/// @nodoc
abstract mixin class $TopCustomerModelCopyWith<$Res>  {
  factory $TopCustomerModelCopyWith(TopCustomerModel value, $Res Function(TopCustomerModel) _then) = _$TopCustomerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl, String? location,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int orders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total
});




}
/// @nodoc
class _$TopCustomerModelCopyWithImpl<$Res>
    implements $TopCustomerModelCopyWith<$Res> {
  _$TopCustomerModelCopyWithImpl(this._self, this._then);

  final TopCustomerModel _self;
  final $Res Function(TopCustomerModel) _then;

/// Create a copy of TopCustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? location = freezed,Object? orders = null,Object? total = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopCustomerModel].
extension TopCustomerModelPatterns on TopCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _TopCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? location, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? location, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)  $default,) {final _that = this;
switch (_that) {
case _TopCustomerModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? location, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int orders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total)?  $default,) {final _that = this;
switch (_that) {
case _TopCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.location,_that.orders,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopCustomerModel implements TopCustomerModel {
  const _TopCustomerModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.name, this.imageUrl, this.location, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.orders, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.total});
  factory _TopCustomerModel.fromJson(Map<String, dynamic> json) => _$TopCustomerModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? location;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int orders;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double total;

/// Create a copy of TopCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopCustomerModelCopyWith<_TopCustomerModel> get copyWith => __$TopCustomerModelCopyWithImpl<_TopCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.orders, orders) || other.orders == orders)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,location,orders,total);

@override
String toString() {
  return 'TopCustomerModel(id: $id, name: $name, imageUrl: $imageUrl, location: $location, orders: $orders, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TopCustomerModelCopyWith<$Res> implements $TopCustomerModelCopyWith<$Res> {
  factory _$TopCustomerModelCopyWith(_TopCustomerModel value, $Res Function(_TopCustomerModel) _then) = __$TopCustomerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl, String? location,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int orders,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total
});




}
/// @nodoc
class __$TopCustomerModelCopyWithImpl<$Res>
    implements _$TopCustomerModelCopyWith<$Res> {
  __$TopCustomerModelCopyWithImpl(this._self, this._then);

  final _TopCustomerModel _self;
  final $Res Function(_TopCustomerModel) _then;

/// Create a copy of TopCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? location = freezed,Object? orders = null,Object? total = null,}) {
  return _then(_TopCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
