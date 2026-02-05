// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_months_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnualMonthsModel {

 List<AnnualMonthDataModel> get months;
/// Create a copy of AnnualMonthsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnualMonthsModelCopyWith<AnnualMonthsModel> get copyWith => _$AnnualMonthsModelCopyWithImpl<AnnualMonthsModel>(this as AnnualMonthsModel, _$identity);

  /// Serializes this AnnualMonthsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnualMonthsModel&&const DeepCollectionEquality().equals(other.months, months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(months));

@override
String toString() {
  return 'AnnualMonthsModel(months: $months)';
}


}

/// @nodoc
abstract mixin class $AnnualMonthsModelCopyWith<$Res>  {
  factory $AnnualMonthsModelCopyWith(AnnualMonthsModel value, $Res Function(AnnualMonthsModel) _then) = _$AnnualMonthsModelCopyWithImpl;
@useResult
$Res call({
 List<AnnualMonthDataModel> months
});




}
/// @nodoc
class _$AnnualMonthsModelCopyWithImpl<$Res>
    implements $AnnualMonthsModelCopyWith<$Res> {
  _$AnnualMonthsModelCopyWithImpl(this._self, this._then);

  final AnnualMonthsModel _self;
  final $Res Function(AnnualMonthsModel) _then;

/// Create a copy of AnnualMonthsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? months = null,}) {
  return _then(_self.copyWith(
months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as List<AnnualMonthDataModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnualMonthsModel].
extension AnnualMonthsModelPatterns on AnnualMonthsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnualMonthsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnualMonthsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnualMonthsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnualMonthsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnualMonthsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnualMonthsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AnnualMonthDataModel> months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnualMonthsModel() when $default != null:
return $default(_that.months);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AnnualMonthDataModel> months)  $default,) {final _that = this;
switch (_that) {
case _AnnualMonthsModel():
return $default(_that.months);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AnnualMonthDataModel> months)?  $default,) {final _that = this;
switch (_that) {
case _AnnualMonthsModel() when $default != null:
return $default(_that.months);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnualMonthsModel implements AnnualMonthsModel {
  const _AnnualMonthsModel({required final  List<AnnualMonthDataModel> months}): _months = months;
  factory _AnnualMonthsModel.fromJson(Map<String, dynamic> json) => _$AnnualMonthsModelFromJson(json);

 final  List<AnnualMonthDataModel> _months;
@override List<AnnualMonthDataModel> get months {
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_months);
}


/// Create a copy of AnnualMonthsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnualMonthsModelCopyWith<_AnnualMonthsModel> get copyWith => __$AnnualMonthsModelCopyWithImpl<_AnnualMonthsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnualMonthsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnualMonthsModel&&const DeepCollectionEquality().equals(other._months, _months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'AnnualMonthsModel(months: $months)';
}


}

/// @nodoc
abstract mixin class _$AnnualMonthsModelCopyWith<$Res> implements $AnnualMonthsModelCopyWith<$Res> {
  factory _$AnnualMonthsModelCopyWith(_AnnualMonthsModel value, $Res Function(_AnnualMonthsModel) _then) = __$AnnualMonthsModelCopyWithImpl;
@override @useResult
$Res call({
 List<AnnualMonthDataModel> months
});




}
/// @nodoc
class __$AnnualMonthsModelCopyWithImpl<$Res>
    implements _$AnnualMonthsModelCopyWith<$Res> {
  __$AnnualMonthsModelCopyWithImpl(this._self, this._then);

  final _AnnualMonthsModel _self;
  final $Res Function(_AnnualMonthsModel) _then;

/// Create a copy of AnnualMonthsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? months = null,}) {
  return _then(_AnnualMonthsModel(
months: null == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<AnnualMonthDataModel>,
  ));
}


}

// dart format on
