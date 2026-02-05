// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_movement_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockMovementItemModel {

 int get id; String get name; String? get code;
/// Create a copy of StockMovementItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMovementItemModelCopyWith<StockMovementItemModel> get copyWith => _$StockMovementItemModelCopyWithImpl<StockMovementItemModel>(this as StockMovementItemModel, _$identity);

  /// Serializes this StockMovementItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMovementItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'StockMovementItemModel(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $StockMovementItemModelCopyWith<$Res>  {
  factory $StockMovementItemModelCopyWith(StockMovementItemModel value, $Res Function(StockMovementItemModel) _then) = _$StockMovementItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? code
});




}
/// @nodoc
class _$StockMovementItemModelCopyWithImpl<$Res>
    implements $StockMovementItemModelCopyWith<$Res> {
  _$StockMovementItemModelCopyWithImpl(this._self, this._then);

  final StockMovementItemModel _self;
  final $Res Function(StockMovementItemModel) _then;

/// Create a copy of StockMovementItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockMovementItemModel].
extension StockMovementItemModelPatterns on StockMovementItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMovementItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMovementItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMovementItemModel value)  $default,){
final _that = this;
switch (_that) {
case _StockMovementItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMovementItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _StockMovementItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMovementItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? code)  $default,) {final _that = this;
switch (_that) {
case _StockMovementItemModel():
return $default(_that.id,_that.name,_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _StockMovementItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMovementItemModel implements StockMovementItemModel {
  const _StockMovementItemModel({required this.id, required this.name, this.code});
  factory _StockMovementItemModel.fromJson(Map<String, dynamic> json) => _$StockMovementItemModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? code;

/// Create a copy of StockMovementItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMovementItemModelCopyWith<_StockMovementItemModel> get copyWith => __$StockMovementItemModelCopyWithImpl<_StockMovementItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMovementItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMovementItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'StockMovementItemModel(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$StockMovementItemModelCopyWith<$Res> implements $StockMovementItemModelCopyWith<$Res> {
  factory _$StockMovementItemModelCopyWith(_StockMovementItemModel value, $Res Function(_StockMovementItemModel) _then) = __$StockMovementItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? code
});




}
/// @nodoc
class __$StockMovementItemModelCopyWithImpl<$Res>
    implements _$StockMovementItemModelCopyWith<$Res> {
  __$StockMovementItemModelCopyWithImpl(this._self, this._then);

  final _StockMovementItemModel _self;
  final $Res Function(_StockMovementItemModel) _then;

/// Create a copy of StockMovementItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_StockMovementItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
