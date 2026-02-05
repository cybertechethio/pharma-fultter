// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemRequestModel {

 String get name; String? get description; int? get categoryId; int? get subCategoryId; int? get brandId; int? get unitId; int? get modelId; String? get sku; String get code; String? get barcode; String? get color; String? get size; String? get material; double? get weight; bool get isTaxable; int get taxRate; bool get isActive; String? get imageUrl; double get costPrice; double get unitPrice; String? get expirationDate; String? get manufacturingDate;
/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemRequestModelCopyWith<ItemRequestModel> get copyWith => _$ItemRequestModelCopyWithImpl<ItemRequestModel>(this as ItemRequestModel, _$identity);

  /// Serializes this ItemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.code, code) || other.code == code)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,description,categoryId,subCategoryId,brandId,unitId,modelId,sku,code,barcode,color,size,material,weight,isTaxable,taxRate,isActive,imageUrl,costPrice,unitPrice,expirationDate,manufacturingDate]);

@override
String toString() {
  return 'ItemRequestModel(name: $name, description: $description, categoryId: $categoryId, subCategoryId: $subCategoryId, brandId: $brandId, unitId: $unitId, modelId: $modelId, sku: $sku, code: $code, barcode: $barcode, color: $color, size: $size, material: $material, weight: $weight, isTaxable: $isTaxable, taxRate: $taxRate, isActive: $isActive, imageUrl: $imageUrl, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate)';
}


}

/// @nodoc
abstract mixin class $ItemRequestModelCopyWith<$Res>  {
  factory $ItemRequestModelCopyWith(ItemRequestModel value, $Res Function(ItemRequestModel) _then) = _$ItemRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String? description, int? categoryId, int? subCategoryId, int? brandId, int? unitId, int? modelId, String? sku, String code, String? barcode, String? color, String? size, String? material, double? weight, bool isTaxable, int taxRate, bool isActive, String? imageUrl, double costPrice, double unitPrice, String? expirationDate, String? manufacturingDate
});




}
/// @nodoc
class _$ItemRequestModelCopyWithImpl<$Res>
    implements $ItemRequestModelCopyWith<$Res> {
  _$ItemRequestModelCopyWithImpl(this._self, this._then);

  final ItemRequestModel _self;
  final $Res Function(ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? categoryId = freezed,Object? subCategoryId = freezed,Object? brandId = freezed,Object? unitId = freezed,Object? modelId = freezed,Object? sku = freezed,Object? code = null,Object? barcode = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? isTaxable = null,Object? taxRate = null,Object? isActive = null,Object? imageUrl = freezed,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemRequestModel].
extension ItemRequestModelPatterns on ItemRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ItemRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? sku,  String code,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  String? imageUrl,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
return $default(_that.name,_that.description,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.sku,_that.code,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.imageUrl,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? sku,  String code,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  String? imageUrl,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate)  $default,) {final _that = this;
switch (_that) {
case _ItemRequestModel():
return $default(_that.name,_that.description,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.sku,_that.code,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.imageUrl,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  int? categoryId,  int? subCategoryId,  int? brandId,  int? unitId,  int? modelId,  String? sku,  String code,  String? barcode,  String? color,  String? size,  String? material,  double? weight,  bool isTaxable,  int taxRate,  bool isActive,  String? imageUrl,  double costPrice,  double unitPrice,  String? expirationDate,  String? manufacturingDate)?  $default,) {final _that = this;
switch (_that) {
case _ItemRequestModel() when $default != null:
return $default(_that.name,_that.description,_that.categoryId,_that.subCategoryId,_that.brandId,_that.unitId,_that.modelId,_that.sku,_that.code,_that.barcode,_that.color,_that.size,_that.material,_that.weight,_that.isTaxable,_that.taxRate,_that.isActive,_that.imageUrl,_that.costPrice,_that.unitPrice,_that.expirationDate,_that.manufacturingDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemRequestModel implements ItemRequestModel {
  const _ItemRequestModel({required this.name, this.description, this.categoryId, this.subCategoryId, this.brandId, this.unitId, this.modelId, this.sku, required this.code, this.barcode, this.color, this.size, this.material, this.weight, required this.isTaxable, this.taxRate = 0, required this.isActive, this.imageUrl, required this.costPrice, required this.unitPrice, this.expirationDate, this.manufacturingDate});
  factory _ItemRequestModel.fromJson(Map<String, dynamic> json) => _$ItemRequestModelFromJson(json);

@override final  String name;
@override final  String? description;
@override final  int? categoryId;
@override final  int? subCategoryId;
@override final  int? brandId;
@override final  int? unitId;
@override final  int? modelId;
@override final  String? sku;
@override final  String code;
@override final  String? barcode;
@override final  String? color;
@override final  String? size;
@override final  String? material;
@override final  double? weight;
@override final  bool isTaxable;
@override@JsonKey() final  int taxRate;
@override final  bool isActive;
@override final  String? imageUrl;
@override final  double costPrice;
@override final  double unitPrice;
@override final  String? expirationDate;
@override final  String? manufacturingDate;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemRequestModelCopyWith<_ItemRequestModel> get copyWith => __$ItemRequestModelCopyWithImpl<_ItemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.code, code) || other.code == code)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.manufacturingDate, manufacturingDate) || other.manufacturingDate == manufacturingDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,description,categoryId,subCategoryId,brandId,unitId,modelId,sku,code,barcode,color,size,material,weight,isTaxable,taxRate,isActive,imageUrl,costPrice,unitPrice,expirationDate,manufacturingDate]);

@override
String toString() {
  return 'ItemRequestModel(name: $name, description: $description, categoryId: $categoryId, subCategoryId: $subCategoryId, brandId: $brandId, unitId: $unitId, modelId: $modelId, sku: $sku, code: $code, barcode: $barcode, color: $color, size: $size, material: $material, weight: $weight, isTaxable: $isTaxable, taxRate: $taxRate, isActive: $isActive, imageUrl: $imageUrl, costPrice: $costPrice, unitPrice: $unitPrice, expirationDate: $expirationDate, manufacturingDate: $manufacturingDate)';
}


}

/// @nodoc
abstract mixin class _$ItemRequestModelCopyWith<$Res> implements $ItemRequestModelCopyWith<$Res> {
  factory _$ItemRequestModelCopyWith(_ItemRequestModel value, $Res Function(_ItemRequestModel) _then) = __$ItemRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, int? categoryId, int? subCategoryId, int? brandId, int? unitId, int? modelId, String? sku, String code, String? barcode, String? color, String? size, String? material, double? weight, bool isTaxable, int taxRate, bool isActive, String? imageUrl, double costPrice, double unitPrice, String? expirationDate, String? manufacturingDate
});




}
/// @nodoc
class __$ItemRequestModelCopyWithImpl<$Res>
    implements _$ItemRequestModelCopyWith<$Res> {
  __$ItemRequestModelCopyWithImpl(this._self, this._then);

  final _ItemRequestModel _self;
  final $Res Function(_ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? categoryId = freezed,Object? subCategoryId = freezed,Object? brandId = freezed,Object? unitId = freezed,Object? modelId = freezed,Object? sku = freezed,Object? code = null,Object? barcode = freezed,Object? color = freezed,Object? size = freezed,Object? material = freezed,Object? weight = freezed,Object? isTaxable = null,Object? taxRate = null,Object? isActive = null,Object? imageUrl = freezed,Object? costPrice = null,Object? unitPrice = null,Object? expirationDate = freezed,Object? manufacturingDate = freezed,}) {
  return _then(_ItemRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,subCategoryId: freezed == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String?,manufacturingDate: freezed == manufacturingDate ? _self.manufacturingDate : manufacturingDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
