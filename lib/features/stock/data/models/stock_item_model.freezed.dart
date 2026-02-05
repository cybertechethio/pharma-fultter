// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockItemModel {

 int get id; String get name; String? get code; String? get categories; String? get subCategories; String? get brands; String? get units; String? get models; String? get color; String? get size; String? get material; String? get weight; String? get unitPrice;
/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockItemModelCopyWith<StockItemModel> get copyWith => _$StockItemModelCopyWithImpl<StockItemModel>(this as StockItemModel, _$identity);

  /// Serializes this StockItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.subCategories, subCategories) || other.subCategories == subCategories)&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.units, units) || other.units == units)&&(identical(other.models, models) || other.models == models)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,categories,subCategories,brands,units,models,color,size,material,weight,unitPrice);

@override
String toString() {
  return 'StockItemModel(id: $id, name: $name, code: $code, categories: $categories, subCategories: $subCategories, brands: $brands, units: $units, models: $models, color: $color, size: $size, material: $material, weight: $weight, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $StockItemModelCopyWith<$Res>  {
  factory $StockItemModelCopyWith(StockItemModel value, $Res Function(StockItemModel) _then) = _$StockItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? code, String? categories, String? subCategories, String? brands, String? units, String? models, String? color, String? size, String? material, String? weight, String? unitPrice
});




}
/// @nodoc
class _$StockItemModelCopyWithImpl<$Res>
    implements $StockItemModelCopyWith<$Res> {
  _$StockItemModelCopyWithImpl(this._self, this._then);

  final StockItemModel _self;
  final $Res Function(StockItemModel) _then;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? categories = freezed,Object? subCategories = freezed,Object? brands = freezed,Object? units = freezed,Object? models = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? unitPrice = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as String?,brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as String?,models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockItemModel].
extension StockItemModelPatterns on StockItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockItemModel value)  $default,){
final _that = this;
switch (_that) {
case _StockItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? color,  String? size,  String? material,  String? weight,  String? unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.color,_that.size,_that.material,_that.weight,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? code,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? color,  String? size,  String? material,  String? weight,  String? unitPrice)  $default,) {final _that = this;
switch (_that) {
case _StockItemModel():
return $default(_that.id,_that.name,_that.code,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.color,_that.size,_that.material,_that.weight,_that.unitPrice);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? code,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? color,  String? size,  String? material,  String? weight,  String? unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _StockItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.color,_that.size,_that.material,_that.weight,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockItemModel implements StockItemModel {
  const _StockItemModel({required this.id, required this.name, this.code, this.categories, this.subCategories, this.brands, this.units, this.models, this.color, this.size, this.material, this.weight, this.unitPrice});
  factory _StockItemModel.fromJson(Map<String, dynamic> json) => _$StockItemModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? code;
@override final  String? categories;
@override final  String? subCategories;
@override final  String? brands;
@override final  String? units;
@override final  String? models;
@override final  String? color;
@override final  String? size;
@override final  String? material;
@override final  String? weight;
@override final  String? unitPrice;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockItemModelCopyWith<_StockItemModel> get copyWith => __$StockItemModelCopyWithImpl<_StockItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.subCategories, subCategories) || other.subCategories == subCategories)&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.units, units) || other.units == units)&&(identical(other.models, models) || other.models == models)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,categories,subCategories,brands,units,models,color,size,material,weight,unitPrice);

@override
String toString() {
  return 'StockItemModel(id: $id, name: $name, code: $code, categories: $categories, subCategories: $subCategories, brands: $brands, units: $units, models: $models, color: $color, size: $size, material: $material, weight: $weight, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$StockItemModelCopyWith<$Res> implements $StockItemModelCopyWith<$Res> {
  factory _$StockItemModelCopyWith(_StockItemModel value, $Res Function(_StockItemModel) _then) = __$StockItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? code, String? categories, String? subCategories, String? brands, String? units, String? models, String? color, String? size, String? material, String? weight, String? unitPrice
});




}
/// @nodoc
class __$StockItemModelCopyWithImpl<$Res>
    implements _$StockItemModelCopyWith<$Res> {
  __$StockItemModelCopyWithImpl(this._self, this._then);

  final _StockItemModel _self;
  final $Res Function(_StockItemModel) _then;

/// Create a copy of StockItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? categories = freezed,Object? subCategories = freezed,Object? brands = freezed,Object? units = freezed,Object? models = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? unitPrice = freezed,}) {
  return _then(_StockItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as String?,brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as String?,models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
