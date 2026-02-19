// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Company {

 String get id; String get name; String? get phone1; String? get phone2; String? get logoUrl; String? get tinNumber; String? get tradeName; String? get city; String? get wereda; bool get autoPrint; DateTime? get defaultStartDate; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,createdAt,updatedAt);

@override
String toString() {
  return 'Company(id: $id, name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool autoPrint, DateTime? defaultStartDate, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = null,Object? defaultStartDate = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
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
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? phone1,  String? phone2,  String? logoUrl,  String? tinNumber,  String? tradeName,  String? city,  String? wereda,  bool autoPrint,  DateTime? defaultStartDate,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.name,_that.phone1,_that.phone2,_that.logoUrl,_that.tinNumber,_that.tradeName,_that.city,_that.wereda,_that.autoPrint,_that.defaultStartDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Company implements Company {
  const _Company({required this.id, required this.name, this.phone1, this.phone2, this.logoUrl, this.tinNumber, this.tradeName, this.city, this.wereda, required this.autoPrint, this.defaultStartDate, required this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String? phone1;
@override final  String? phone2;
@override final  String? logoUrl;
@override final  String? tinNumber;
@override final  String? tradeName;
@override final  String? city;
@override final  String? wereda;
@override final  bool autoPrint;
@override final  DateTime? defaultStartDate;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone1, phone1) || other.phone1 == phone1)&&(identical(other.phone2, phone2) || other.phone2 == phone2)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.tinNumber, tinNumber) || other.tinNumber == tinNumber)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.city, city) || other.city == city)&&(identical(other.wereda, wereda) || other.wereda == wereda)&&(identical(other.autoPrint, autoPrint) || other.autoPrint == autoPrint)&&(identical(other.defaultStartDate, defaultStartDate) || other.defaultStartDate == defaultStartDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,phone1,phone2,logoUrl,tinNumber,tradeName,city,wereda,autoPrint,defaultStartDate,createdAt,updatedAt);

@override
String toString() {
  return 'Company(id: $id, name: $name, phone1: $phone1, phone2: $phone2, logoUrl: $logoUrl, tinNumber: $tinNumber, tradeName: $tradeName, city: $city, wereda: $wereda, autoPrint: $autoPrint, defaultStartDate: $defaultStartDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? phone1, String? phone2, String? logoUrl, String? tinNumber, String? tradeName, String? city, String? wereda, bool autoPrint, DateTime? defaultStartDate, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone1 = freezed,Object? phone2 = freezed,Object? logoUrl = freezed,Object? tinNumber = freezed,Object? tradeName = freezed,Object? city = freezed,Object? wereda = freezed,Object? autoPrint = null,Object? defaultStartDate = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_Company(
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
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
