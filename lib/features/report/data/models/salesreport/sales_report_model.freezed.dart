// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesReportModel {

 List<SalesItemDataModel> get items; SalesSummaryModel get summary;
/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportModelCopyWith<SalesReportModel> get copyWith => _$SalesReportModelCopyWithImpl<SalesReportModel>(this as SalesReportModel, _$identity);

  /// Serializes this SalesReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReportModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'SalesReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $SalesReportModelCopyWith<$Res>  {
  factory $SalesReportModelCopyWith(SalesReportModel value, $Res Function(SalesReportModel) _then) = _$SalesReportModelCopyWithImpl;
@useResult
$Res call({
 List<SalesItemDataModel> items, SalesSummaryModel summary
});


$SalesSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class _$SalesReportModelCopyWithImpl<$Res>
    implements $SalesReportModelCopyWith<$Res> {
  _$SalesReportModelCopyWithImpl(this._self, this._then);

  final SalesReportModel _self;
  final $Res Function(SalesReportModel) _then;

/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SalesItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesSummaryModel,
  ));
}
/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryModelCopyWith<$Res> get summary {
  
  return $SalesSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesReportModel].
extension SalesReportModelPatterns on SalesReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReportModel value)  $default,){
final _that = this;
switch (_that) {
case _SalesReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesItemDataModel> items,  SalesSummaryModel summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesItemDataModel> items,  SalesSummaryModel summary)  $default,) {final _that = this;
switch (_that) {
case _SalesReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesItemDataModel> items,  SalesSummaryModel summary)?  $default,) {final _that = this;
switch (_that) {
case _SalesReportModel() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesReportModel implements SalesReportModel {
  const _SalesReportModel({required final  List<SalesItemDataModel> items, required this.summary}): _items = items;
  factory _SalesReportModel.fromJson(Map<String, dynamic> json) => _$SalesReportModelFromJson(json);

 final  List<SalesItemDataModel> _items;
@override List<SalesItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  SalesSummaryModel summary;

/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportModelCopyWith<_SalesReportModel> get copyWith => __$SalesReportModelCopyWithImpl<_SalesReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReportModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'SalesReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$SalesReportModelCopyWith<$Res> implements $SalesReportModelCopyWith<$Res> {
  factory _$SalesReportModelCopyWith(_SalesReportModel value, $Res Function(_SalesReportModel) _then) = __$SalesReportModelCopyWithImpl;
@override @useResult
$Res call({
 List<SalesItemDataModel> items, SalesSummaryModel summary
});


@override $SalesSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class __$SalesReportModelCopyWithImpl<$Res>
    implements _$SalesReportModelCopyWith<$Res> {
  __$SalesReportModelCopyWithImpl(this._self, this._then);

  final _SalesReportModel _self;
  final $Res Function(_SalesReportModel) _then;

/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_SalesReportModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SalesItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesSummaryModel,
  ));
}

/// Create a copy of SalesReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryModelCopyWith<$Res> get summary {
  
  return $SalesSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
