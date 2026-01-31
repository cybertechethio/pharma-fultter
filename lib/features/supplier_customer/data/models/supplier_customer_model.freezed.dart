// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierCustomerModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; String get name; String get phone; String get accountCode; String get tinNumber;/// API returns uppercase strings: CUSTOMER | SUPPLIER
 String get type; bool get isActive; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of SupplierCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierCustomerModelCopyWith<SupplierCustomerModel> get copyWith => _$SupplierCustomerModelCopyWithImpl<SupplierCustomerModel>(this as SupplierCustomerModel, _$identity);

  /// Serializes this SupplierCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountCode, accountCode) || other.accountCode == accountCode)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,accountCode,tinNumber,type,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'SupplierCustomerModel(id: $id, name: $name, phone: $phone, accountCode: $accountCode, tinNumber: $tinNumber, type: $type, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SupplierCustomerModelCopyWith<$Res>  {
  factory $SupplierCustomerModelCopyWith(SupplierCustomerModel value, $Res Function(SupplierCustomerModel) _then) = _$SupplierCustomerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name, String phone, String accountCode, String tinNumber, String type, bool isActive, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SupplierCustomerModelCopyWithImpl<$Res>
    implements $SupplierCustomerModelCopyWith<$Res> {
  _$SupplierCustomerModelCopyWithImpl(this._self, this._then);

  final SupplierCustomerModel _self;
  final $Res Function(SupplierCustomerModel) _then;

/// Create a copy of SupplierCustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? accountCode = null,Object? tinNumber = null,Object? type = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,accountCode: null == accountCode ? _self.accountCode : accountCode // ignore: cast_nullable_to_non_nullable
as String,tinNumber: null == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierCustomerModel].
extension SupplierCustomerModelPatterns on SupplierCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String phone,  String accountCode,  String tinNumber,  String type,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String phone,  String accountCode,  String tinNumber,  String type,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomerModel():
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.isActive,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String phone,  String accountCode,  String tinNumber,  String type,  bool isActive,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SupplierCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.accountCode,_that.tinNumber,_that.type,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierCustomerModel implements SupplierCustomerModel {
  const _SupplierCustomerModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, required this.name, required this.phone, required this.accountCode, this.tinNumber = 'N/A', required this.type, this.isActive = true, required this.createdAt, this.updatedAt});
  factory _SupplierCustomerModel.fromJson(Map<String, dynamic> json) => _$SupplierCustomerModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  String name;
@override final  String phone;
@override final  String accountCode;
@override@JsonKey() final  String tinNumber;
/// API returns uppercase strings: CUSTOMER | SUPPLIER
@override final  String type;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of SupplierCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierCustomerModelCopyWith<_SupplierCustomerModel> get copyWith => __$SupplierCustomerModelCopyWithImpl<_SupplierCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountCode, accountCode) || other.accountCode == accountCode)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,accountCode,tinNumber,type,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'SupplierCustomerModel(id: $id, name: $name, phone: $phone, accountCode: $accountCode, tinNumber: $tinNumber, type: $type, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SupplierCustomerModelCopyWith<$Res> implements $SupplierCustomerModelCopyWith<$Res> {
  factory _$SupplierCustomerModelCopyWith(_SupplierCustomerModel value, $Res Function(_SupplierCustomerModel) _then) = __$SupplierCustomerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name, String phone, String accountCode, String tinNumber, String type, bool isActive, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SupplierCustomerModelCopyWithImpl<$Res>
    implements _$SupplierCustomerModelCopyWith<$Res> {
  __$SupplierCustomerModelCopyWithImpl(this._self, this._then);

  final _SupplierCustomerModel _self;
  final $Res Function(_SupplierCustomerModel) _then;

/// Create a copy of SupplierCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? accountCode = null,Object? tinNumber = null,Object? type = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_SupplierCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,accountCode: null == accountCode ? _self.accountCode : accountCode // ignore: cast_nullable_to_non_nullable
as String,tinNumber: null == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
