// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyRequestModel {

 String? get name; String? get phone1; String? get phone2; String? get logoUrl; String? get tinNumber; String? get tradeName; String? get city; String? get wereda; bool? get autoPrint; DateTime? get defaultStartDate; String? get businessType;
/// Create a copy of CompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyRequestModelCopyWith<CompanyRequestModel> get copyWith => _$CompanyRequestModelCopyWithImpl<CompanyRequestModel>(this as CompanyRequestModel, _$identity);

  /// Serializes this CompanyRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.businessType, businessType) || other.businessType == businessType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,businessType);

@override
String toString() {
  return 'CompanyRequestModel(name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, businessType: $businessType)';
}


}

/// @nodoc
abstract mixin class $CompanyRequestModelCopyWith<$Res>  {
  factory $CompanyRequestModelCopyWith(CompanyRequestModel value, $Res Function(CompanyRequestModel) _then) = _$CompanyRequestModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool? autoPrint, DateTime? defaultStartDate, String? businessType
});




}
/// @nodoc
class _$CompanyRequestModelCopyWithImpl<$Res>
    implements $CompanyRequestModelCopyWith<$Res> {
  _$CompanyRequestModelCopyWithImpl(this._self, this._then);

  final CompanyRequestModel _self;
  final $Res Function(CompanyRequestModel) _then;

/// Create a copy of CompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = freezed,Object? defaultStartDate = freezed,Object? businessType = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone1: freezed == phone1 ? _self.phone1 : phone1 // ignore: cast_nullable_to_non_nullable
as String?,phone2: freezed == phone2 ? _self.phone2 : phone2 // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,tinNumber: freezed == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,wereda: freezed == wereda ? _self.wereda : wereda // ignore: cast_nullable_to_non_nullable
as String?,autoPrint: freezed == autoPrint ? _self.autoPrint : autoPrint // ignore: cast_nullable_to_non_nullable
as bool?,defaultStartDate: freezed == defaultStartDate ? _self.defaultStartDate : defaultStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,businessType: freezed == businessType ? _self.businessType : businessType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyRequestModel].
extension CompanyRequestModelPatterns on CompanyRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool? autoPrint,  DateTime? defaultStartDate,  String? businessType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyRequestModel() when $default != null:
return $default(_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool? autoPrint,  DateTime? defaultStartDate,  String? businessType)  $default,) {final _that = this;
switch (_that) {
case _CompanyRequestModel():
return $default(_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool? autoPrint,  DateTime? defaultStartDate,  String? businessType)?  $default,) {final _that = this;
switch (_that) {
case _CompanyRequestModel() when $default != null:
return $default(_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.businessType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyRequestModel implements CompanyRequestModel {
  const _CompanyRequestModel({this.name, this.phone1, this.phone2, this.logoUrl, this.tinNumber, this.tradeName, this.city, this.wereda, this.autoPrint, this.defaultStartDate, this.businessType});
  factory _CompanyRequestModel.fromJson(Map<String, dynamic> json) => _$CompanyRequestModelFromJson(json);

@override final  String? name;
@override final  String? phone1;
@override final  String? phone2;
@override final  String? logoUrl;
@override final  String? tinNumber;
@override final  String? tradeName;
@override final  String? city;
@override final  String? wereda;
@override final  bool? autoPrint;
@override final  DateTime? defaultStartDate;
@override final  String? businessType;

/// Create a copy of CompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyRequestModelCopyWith<_CompanyRequestModel> get copyWith => __$CompanyRequestModelCopyWithImpl<_CompanyRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.businessType, businessType) || other.businessType == businessType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,businessType);

@override
String toString() {
  return 'CompanyRequestModel(name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, businessType: $businessType)';
}


}

/// @nodoc
abstract mixin class _$CompanyRequestModelCopyWith<$Res> implements $CompanyRequestModelCopyWith<$Res> {
  factory _$CompanyRequestModelCopyWith(_CompanyRequestModel value, $Res Function(_CompanyRequestModel) _then) = __$CompanyRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool? autoPrint, DateTime? defaultStartDate, String? businessType
});




}
/// @nodoc
class __$CompanyRequestModelCopyWithImpl<$Res>
    implements _$CompanyRequestModelCopyWith<$Res> {
  __$CompanyRequestModelCopyWithImpl(this._self, this._then);

  final _CompanyRequestModel _self;
  final $Res Function(_CompanyRequestModel) _then;

/// Create a copy of CompanyRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = freezed,Object? defaultStartDate = freezed,Object? businessType = freezed,}) {
  return _then(_CompanyRequestModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone1: freezed == phone1 ? _self.phone1 : phone1 // ignore: cast_nullable_to_non_nullable
as String?,phone2: freezed == phone2 ? _self.phone2 : phone2 // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,tinNumber: freezed == tinNumber ? _self.tinNumber : tinNumber // ignore: cast_nullable_to_non_nullable
as String?,tradeName: freezed == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,wereda: freezed == wereda ? _self.wereda : wereda // ignore: cast_nullable_to_non_nullable
as String?,autoPrint: freezed == autoPrint ? _self.autoPrint : autoPrint // ignore: cast_nullable_to_non_nullable
as bool?,defaultStartDate: freezed == defaultStartDate ? _self.defaultStartDate : defaultStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,businessType: freezed == businessType ? _self.businessType : businessType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
