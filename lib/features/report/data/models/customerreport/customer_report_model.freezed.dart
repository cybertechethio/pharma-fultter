// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerReportModel {

 List<CustomerItemDataModel> get items; CustomerSummaryModel get summary;
/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReportModelCopyWith<CustomerReportModel> get copyWith => _$CustomerReportModelCopyWithImpl<CustomerReportModel>(this as CustomerReportModel, _$identity);

  /// Serializes this CustomerReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReportModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'CustomerReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CustomerReportModelCopyWith<$Res>  {
  factory $CustomerReportModelCopyWith(CustomerReportModel value, $Res Function(CustomerReportModel) _then) = _$CustomerReportModelCopyWithImpl;
@useResult
$Res call({
 List<CustomerItemDataModel> items, CustomerSummaryModel summary
});


$CustomerSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class _$CustomerReportModelCopyWithImpl<$Res>
    implements $CustomerReportModelCopyWith<$Res> {
  _$CustomerReportModelCopyWithImpl(this._self, this._then);

  final CustomerReportModel _self;
  final $Res Function(CustomerReportModel) _then;

/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CustomerItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CustomerSummaryModel,
  ));
}
/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSummaryModelCopyWith<$Res> get summary {
  
  return $CustomerSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomerReportModel].
extension CustomerReportModelPatterns on CustomerReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReportModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerItemDataModel> items,  CustomerSummaryModel summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReportModel() when $default != null:
return $default(_that.items,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerItemDataModel> items,  CustomerSummaryModel summary)  $default,) {final _that = this;
switch (_that) {
case _CustomerReportModel():
return $default(_that.items,_that.summary);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerItemDataModel> items,  CustomerSummaryModel summary)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReportModel() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerReportModel implements CustomerReportModel {
  const _CustomerReportModel({required final  List<CustomerItemDataModel> items, required this.summary}): _items = items;
  factory _CustomerReportModel.fromJson(Map<String, dynamic> json) => _$CustomerReportModelFromJson(json);

 final  List<CustomerItemDataModel> _items;
@override List<CustomerItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  CustomerSummaryModel summary;

/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReportModelCopyWith<_CustomerReportModel> get copyWith => __$CustomerReportModelCopyWithImpl<_CustomerReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReportModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'CustomerReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CustomerReportModelCopyWith<$Res> implements $CustomerReportModelCopyWith<$Res> {
  factory _$CustomerReportModelCopyWith(_CustomerReportModel value, $Res Function(_CustomerReportModel) _then) = __$CustomerReportModelCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerItemDataModel> items, CustomerSummaryModel summary
});


@override $CustomerSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class __$CustomerReportModelCopyWithImpl<$Res>
    implements _$CustomerReportModelCopyWith<$Res> {
  __$CustomerReportModelCopyWithImpl(this._self, this._then);

  final _CustomerReportModel _self;
  final $Res Function(_CustomerReportModel) _then;

/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_CustomerReportModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CustomerItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CustomerSummaryModel,
  ));
}

/// Create a copy of CustomerReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSummaryModelCopyWith<$Res> get summary {
  
  return $CustomerSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
