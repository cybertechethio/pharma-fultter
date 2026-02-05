// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyModel {

@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String get id; String get name; String? get phone1; String? get phone2; String? get logoUrl; String? get tinNumber; String? get tradeName; String? get city; String? get wereda; bool get autoPrint; DateTime? get defaultStartDate; String? get businessType; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<CompanyModel> get copyWith => _$CompanyModelCopyWithImpl<CompanyModel>(this as CompanyModel, _$identity);

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.businessType, businessType) || other.businessType == businessType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,businessType,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyModel(id: $id, name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, businessType: $businessType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompanyModelCopyWith<$Res>  {
  factory $CompanyModelCopyWith(CompanyModel value, $Res Function(CompanyModel) _then) = _$CompanyModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool autoPrint, DateTime? defaultStartDate, String? businessType, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CompanyModelCopyWithImpl<$Res>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._self, this._then);

  final CompanyModel _self;
  final $Res Function(CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = null,Object? defaultStartDate = freezed,Object? businessType = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone1: freezed == phone1 ? _self.phone1 : phone1 // ignore: cast_nullable_to_non_nullable
as String?,phone2: freezed == phone2 ? _self.phone2 : phone2 // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,tinNumber: freezed == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,wereda: freezed == wereda ? _self.wereda : wereda // ignore: cast_nullable_to_non_nullable
as String?,autoPrint: null == autoPrint ? _self.autoPrint : autoPrint // ignore: cast_nullable_to_non_nullable
as bool,defaultStartDate: freezed == defaultStartDate ? _self.defaultStartDate : defaultStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,businessType: freezed == businessType ? _self.businessType : businessType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyModel].
extension CompanyModelPatterns on CompanyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  String? businessType,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  String? businessType,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CompanyModel():
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic)  String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  String? businessType,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyModel implements CompanyModel {
  const _CompanyModel({@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required this.id, required this.name, this.phone1, this.phone2, this.logoUrl, this.tinNumber, this.tradeName, this.city, this.wereda, this.autoPrint = false, this.defaultStartDate, this.businessType, required this.createdAt, this.updatedAt});
  factory _CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) final  String id;
@override final  String name;
@override final  String? phone1;
@override final  String? phone2;
@override final  String? logoUrl;
@override final  String? tinNumber;
@override final  String? tradeName;
@override final  String? city;
@override final  String? wereda;
@override@JsonKey() final  bool autoPrint;
@override final  DateTime? defaultStartDate;
@override final  String? businessType;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyModelCopyWith<_CompanyModel> get copyWith => __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.businessType, businessType) || other.businessType == businessType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,businessType,createdAt,updatedAt);

@override
String toString() {
  return 'CompanyModel(id: $id, name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, businessType: $businessType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyModelCopyWith<$Res> implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(_CompanyModel value, $Res Function(_CompanyModel) _then) = __$CompanyModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) String id, String name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool autoPrint, DateTime? defaultStartDate, String? businessType, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(this._self, this._then);

  final _CompanyModel _self;
  final $Res Function(_CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = null,Object? defaultStartDate = freezed,Object? businessType = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_CompanyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone1: freezed == phone1 ? _self.phone1 : phone1 // ignore: cast_nullable_to_non_nullable
as String?,phone2: freezed == phone2 ? _self.phone2 : phone2 // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,tinNumber: freezed == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,wereda: freezed == wereda ? _self.wereda : wereda // ignore: cast_nullable_to_non_nullable
as String?,autoPrint: null == autoPrint ? _self.autoPrint : autoPrint // ignore: cast_nullable_to_non_nullable
as bool,defaultStartDate: freezed == defaultStartDate ? _self.defaultStartDate : defaultStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,businessType: freezed == businessType ? _self.businessType : businessType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
