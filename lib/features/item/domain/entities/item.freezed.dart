// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Item {

 int get id; String get name; String get code;// Optional fields with defaults where appropriate
 int? get companyId; String? get description; String? get imageUrl; String? get sku; String? get barcode; String? get color; String? get size; String? get material; double? get weight; bool get isTaxable; int get taxRate; bool get isActive;// Pricing fields (mandatory)
 double get costPrice; double get unitPrice;// Date fields
 DateTime? get expirationDate; DateTime? get manufacturingDate;// Optional Foreign Keys
 int? get categoryId; int? get subCategoryId; int? get brandId; int? get unitId; int? get modelId;// Display Names from API response (plural form)
 String? get categories; String? get subCategories; String? get brands; String? get units; String? get models;// Legacy display names (kept for backward compatibility)
 String? get categoryName; String? get subCategoryName; String? get brandName; String? get unitName; String? get modelName;// Timestamps (mandatory)
 DateTime get createdAt; DateTime get updatedAt; int? get createdBy; int? get updatedBy; String? get createdByName;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.subCategories, subCategories) || other.subCategories == subCategories)&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.units, units) || other.units == units)&&(identical(other.models, models) || other.models == models)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,code,companyId,description,imageUrl,sku,barcode,color,size,material,weight,isTaxable,taxRate,isActive,costPrice,unitPrice,expirationDate,manufacturingDate,categoryId,subCategoryId,brandId,unitId,modelId,categories,subCategories,brands,units,models,categoryName,subCategoryName,brandName,unitName,modelName,createdAt,updatedAt,createdBy,updatedBy,createdByName]);

@override
String toString() {
  return 'Item(id: $id, name: $name, code: $code, companyId: $companyId, description: $description, imageUrl: $imageUrl, sku: $sku, barcode: $barcode, color: $color, size: $size, material: $material, weight: $weight, isTaxable: $isTaxable, taxRate: $taxRate, isActive: $isActive, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, categoryId: $categoryId, subCategoryId: $subCategoryId, brandId: $brandId, unitId: $unitId, modelId: $modelId, categories: $categories, subCategories: $subCategories, brands: $brands, units: $units, models: $models, categoryName: $categoryName, subCategoryName: $subCategoryName, brandName: $brandName, unitName: $unitName, modelName: $modelName, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, createdByName: $createdByName)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
 int id, String name, String code, int? companyId, String? description, String? imageUrl, String? sku, String? barcode, String? color, String? size, String? material, double? weight, bool isTaxable, int taxRate, bool isActive, double costPrice, double unitPrice, DateTime? expirationDate, DateTime? manufacturingDate, int? categoryId, int? subCategoryId, int? brandId, int? unitId, int? modelId, String? categories, String? subCategories, String? brands, String? units, String? models, String? categoryName, String? subCategoryName, String? brandName, String? unitName, String? modelName, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? createdByName
});




}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? companyId = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? sku = freezed,Object? barcode = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? isTaxable = null,Object? taxRate = null,Object? isActive = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? categoryId = freezed,Object? subCategoryId = freezed,Object? brandId = freezed,Object? unitId = freezed,Object? modelId = freezed,Object? categories = freezed,Object? subCategories = freezed,Object? brands = freezed,Object? units = freezed,Object? models = freezed,Object? categoryName = freezed,Object? subCategoryName = freezed,Object? brandName = freezed,Object? unitName = freezed,Object? modelName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdByName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as String?,brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as String?,models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategoryName: freezed == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,modelName: freezed == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Item value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Item value)  $default,){
final _that = this;
switch (_that) {
case _Item():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Item value)?  $default,){
final _that = this;
switch (_that) {
case _Item() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String code,  int? companyId,  String? description,  String? imageUrl,  String? sku,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  double costPrice,  double unitPrice,  DateTime? expirationDate,  DateTime? manufacturingDate,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? categoryName,  String? subCategoryName,  String? brandName,  String? unitName,  String? modelName,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? createdByName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.companyId,_that.description,_that.imageUrl,_that.sku,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.categoryName,_that.subCategoryName,_that.brandName,_that.unitName,_that.modelName,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.createdByName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String code,  int? companyId,  String? description,  String? imageUrl,  String? sku,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  double costPrice,  double unitPrice,  DateTime? expirationDate,  DateTime? manufacturingDate,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? categoryName,  String? subCategoryName,  String? brandName,  String? unitName,  String? modelName,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? createdByName)  $default,) {final _that = this;
switch (_that) {
case _Item():
return $default(_that.id,_that.name,_that.code,_that.companyId,_that.description,_that.imageUrl,_that.sku,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.categoryName,_that.subCategoryName,_that.brandName,_that.unitName,_that.modelName,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.createdByName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String code,  int? companyId,  String? description,  String? imageUrl,  String? sku,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  double costPrice,  double unitPrice,  DateTime? expirationDate,  DateTime? manufacturingDate,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? categories,  String? subCategories,  String? brands,  String? units,  String? models,  String? categoryName,  String? subCategoryName,  String? brandName,  String? unitName,  String? modelName,  DateTime createdAt,  DateTime updatedAt,  int? createdBy,  int? updatedBy,  String? createdByName)?  $default,) {final _that = this;
switch (_that) {
case _Item() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.companyId,_that.description,_that.imageUrl,_that.sku,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.categories,_that.subCategories,_that.brands,_that.units,_that.models,_that.categoryName,_that.subCategoryName,_that.brandName,_that.unitName,_that.modelName,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.createdByName);case _:
  return null;

}
}

}

/// @nodoc


class _Item implements Item {
  const _Item({required this.id, required this.name, required this.code, this.companyId, this.description, this.imageUrl, this.sku, this.barcode, this.color = 'N/A', this.size, this.material, this.weight = 0.0, required this.isTaxable, this.taxRate = 0, required this.isActive, required this.costPrice, required this.unitPrice, this.expirationDate, this.manufacturingDate, this.categoryId, this.subCategoryId, this.brandId, this.unitId, this.modelId, this.categories, this.subCategories, this.brands, this.units, this.models, this.categoryName, this.subCategoryName, this.brandName, this.unitName, this.modelName, required this.createdAt, required this.updatedAt, this.createdBy, this.updatedBy, this.createdByName});
  

@override final  int id;
@override final  String name;
@override final  String code;
// Optional fields with defaults where appropriate
@override final  int? companyId;
@override final  String? description;
@override final  String? imageUrl;
@override final  String? sku;
@override final  String? barcode;
@override@JsonKey() final  String? color;
@override final  String? size;
@override final  String? material;
@override@JsonKey() final  double? weight;
@override final  bool isTaxable;
@override@JsonKey() final  int taxRate;
@override final  bool isActive;
// Pricing fields (mandatory)
@override final  double costPrice;
@override final  double unitPrice;
// Date fields
@override final  DateTime? expirationDate;
@override final  DateTime? manufacturingDate;
// Optional Foreign Keys
@override final  int? categoryId;
@override final  int? subCategoryId;
@override final  int? brandId;
@override final  int? unitId;
@override final  int? modelId;
// Display Names from API response (plural form)
@override final  String? categories;
@override final  String? subCategories;
@override final  String? brands;
@override final  String? units;
@override final  String? models;
// Legacy display names (kept for backward compatibility)
@override final  String? categoryName;
@override final  String? subCategoryName;
@override final  String? brandName;
@override final  String? unitName;
@override final  String? modelName;
// Timestamps (mandatory)
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? createdBy;
@override final  int? updatedBy;
@override final  String? createdByName;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.subCategories, subCategories) || other.subCategories == subCategories)&&(identical(other.brands, brands) || other.brands == brands)&&(identical(other.units, units) || other.units == units)&&(identical(other.models, models) || other.models == models)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,code,companyId,description,imageUrl,sku,barcode,color,size,material,weight,isTaxable,taxRate,isActive,costPrice,unitPrice,expirationDate,manufacturingDate,categoryId,subCategoryId,brandId,unitId,modelId,categories,subCategories,brands,units,models,categoryName,subCategoryName,brandName,unitName,modelName,createdAt,updatedAt,createdBy,updatedBy,createdByName]);

@override
String toString() {
  return 'Item(id: $id, name: $name, code: $code, companyId: $companyId, description: $description, imageUrl: $imageUrl, sku: $sku, barcode: $barcode, color: $color, size: $size, material: $material, weight: $weight, isTaxable: $isTaxable, taxRate: $taxRate, isActive: $isActive, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate, categoryId: $categoryId, subCategoryId: $subCategoryId, brandId: $brandId, unitId: $unitId, modelId: $modelId, categories: $categories, subCategories: $subCategories, brands: $brands, units: $units, models: $models, categoryName: $categoryName, subCategoryName: $subCategoryName, brandName: $brandName, unitName: $unitName, modelName: $modelName, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, createdByName: $createdByName)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String code, int? companyId, String? description, String? imageUrl, String? sku, String? barcode, String? color, String? size, String? material, double? weight, bool isTaxable, int taxRate, bool isActive, double costPrice, double unitPrice, DateTime? expirationDate, DateTime? manufacturingDate, int? categoryId, int? subCategoryId, int? brandId, int? unitId, int? modelId, String? categories, String? subCategories, String? brands, String? units, String? models, String? categoryName, String? subCategoryName, String? brandName, String? unitName, String? modelName, DateTime createdAt, DateTime updatedAt, int? createdBy, int? updatedBy, String? createdByName
});




}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? companyId = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? sku = freezed,Object? barcode = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? isTaxable = null,Object? taxRate = null,Object? isActive = null,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,Object? categoryId = freezed,Object? subCategoryId = freezed,Object? brandId = freezed,Object? unitId = freezed,Object? modelId = freezed,Object? categories = freezed,Object? subCategories = freezed,Object? brands = freezed,Object? units = freezed,Object? models = freezed,Object? categoryName = freezed,Object? subCategoryName = freezed,Object? brandName = freezed,Object? unitName = freezed,Object? modelName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdByName = freezed,}) {
  return _then(_Item(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as String?,brands: freezed == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as String?,units: freezed == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as String?,models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategoryName: freezed == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,modelName: freezed == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as int?,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
