// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_selling_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopSellingProductModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get name; String? get imageUrl;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get price;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get sales;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get growth;
/// Create a copy of TopSellingProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductModelCopyWith<TopSellingProductModel> get copyWith => _$TopSellingProductModelCopyWithImpl<TopSellingProductModel>(this as TopSellingProductModel, _$identity);

  /// Serializes this TopSellingProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.growth, growth) || other.growth == growth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,sales,growth);

@override
String toString() {
  return 'TopSellingProductModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, sales: $sales, growth: $growth)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductModelCopyWith<$Res>  {
  factory $TopSellingProductModelCopyWith(TopSellingProductModel value, $Res Function(TopSellingProductModel) _then) = _$TopSellingProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double price,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double growth
});




}
/// @nodoc
class _$TopSellingProductModelCopyWithImpl<$Res>
    implements $TopSellingProductModelCopyWith<$Res> {
  _$TopSellingProductModelCopyWithImpl(this._self, this._then);

  final TopSellingProductModel _self;
  final $Res Function(TopSellingProductModel) _then;

/// Create a copy of TopSellingProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? price = null,Object? sales = null,Object? growth = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,growth: null == growth ? _self.growth : growth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProductModel].
extension TopSellingProductModelPatterns on TopSellingProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductModel value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double price, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double growth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProductModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double price, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double growth)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double price, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double growth)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.price,_that.sales,_that.growth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductModel implements TopSellingProductModel {
  const _TopSellingProductModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.name, this.imageUrl, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.price, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.sales, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.growth});
  factory _TopSellingProductModel.fromJson(Map<String, dynamic> json) => _$TopSellingProductModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String name;
@override final  String? imageUrl;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double price;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int sales;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double growth;

/// Create a copy of TopSellingProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductModelCopyWith<_TopSellingProductModel> get copyWith => __$TopSellingProductModelCopyWithImpl<_TopSellingProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.growth, growth) || other.growth == growth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,price,sales,growth);

@override
String toString() {
  return 'TopSellingProductModel(id: $id, name: $name, imageUrl: $imageUrl, price: $price, sales: $sales, growth: $growth)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductModelCopyWith<$Res> implements $TopSellingProductModelCopyWith<$Res> {
  factory _$TopSellingProductModelCopyWith(_TopSellingProductModel value, $Res Function(_TopSellingProductModel) _then) = __$TopSellingProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double price,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int sales,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double growth
});




}
/// @nodoc
class __$TopSellingProductModelCopyWithImpl<$Res>
    implements _$TopSellingProductModelCopyWith<$Res> {
  __$TopSellingProductModelCopyWithImpl(this._self, this._then);

  final _TopSellingProductModel _self;
  final $Res Function(_TopSellingProductModel) _then;

/// Create a copy of TopSellingProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? price = null,Object? sales = null,Object? growth = null,}) {
  return _then(_TopSellingProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as int,growth: null == growth ? _self.growth : growth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
