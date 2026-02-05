// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_stock_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LowStockProductModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id; String get name; String? get imageUrl; String? get code;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get stock;
/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockProductModelCopyWith<LowStockProductModel> get copyWith => _$LowStockProductModelCopyWithImpl<LowStockProductModel>(this as LowStockProductModel, _$identity);

  /// Serializes this LowStockProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.code, code) || other.code == code)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,code,stock);

@override
String toString() {
  return 'LowStockProductModel(id: $id, name: $name, imageUrl: $imageUrl, code: $code, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $LowStockProductModelCopyWith<$Res>  {
  factory $LowStockProductModelCopyWith(LowStockProductModel value, $Res Function(LowStockProductModel) _then) = _$LowStockProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl, String? code,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int stock
});




}
/// @nodoc
class _$LowStockProductModelCopyWithImpl<$Res>
    implements $LowStockProductModelCopyWith<$Res> {
  _$LowStockProductModelCopyWithImpl(this._self, this._then);

  final LowStockProductModel _self;
  final $Res Function(LowStockProductModel) _then;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? code = freezed,Object? stock = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockProductModel].
extension LowStockProductModelPatterns on LowStockProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockProductModel value)  $default,){
final _that = this;
switch (_that) {
case _LowStockProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int stock)  $default,) {final _that = this;
switch (_that) {
case _LowStockProductModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id,  String name,  String? imageUrl,  String? code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int stock)?  $default,) {final _that = this;
switch (_that) {
case _LowStockProductModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.code,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockProductModel implements LowStockProductModel {
  const _LowStockProductModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, required this.name, this.imageUrl, this.code, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.stock});
  factory _LowStockProductModel.fromJson(Map<String, dynamic> json) => _$LowStockProductModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override final  String name;
@override final  String? imageUrl;
@override final  String? code;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int stock;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockProductModelCopyWith<_LowStockProductModel> get copyWith => __$LowStockProductModelCopyWithImpl<_LowStockProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.code, code) || other.code == code)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,code,stock);

@override
String toString() {
  return 'LowStockProductModel(id: $id, name: $name, imageUrl: $imageUrl, code: $code, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$LowStockProductModelCopyWith<$Res> implements $LowStockProductModelCopyWith<$Res> {
  factory _$LowStockProductModelCopyWith(_LowStockProductModel value, $Res Function(_LowStockProductModel) _then) = __$LowStockProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id, String name, String? imageUrl, String? code,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int stock
});




}
/// @nodoc
class __$LowStockProductModelCopyWithImpl<$Res>
    implements _$LowStockProductModelCopyWith<$Res> {
  __$LowStockProductModelCopyWithImpl(this._self, this._then);

  final _LowStockProductModel _self;
  final $Res Function(_LowStockProductModel) _then;

/// Create a copy of LowStockProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? code = freezed,Object? stock = null,}) {
  return _then(_LowStockProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
