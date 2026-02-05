// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseReportModel {

 List<PurchaseItemDataModel> get items; PurchaseSummaryModel get summary;
/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseReportModelCopyWith<PurchaseReportModel> get copyWith => _$PurchaseReportModelCopyWithImpl<PurchaseReportModel>(this as PurchaseReportModel, _$identity);

  /// Serializes this PurchaseReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseReportModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'PurchaseReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $PurchaseReportModelCopyWith<$Res>  {
  factory $PurchaseReportModelCopyWith(PurchaseReportModel value, $Res Function(PurchaseReportModel) _then) = _$PurchaseReportModelCopyWithImpl;
@useResult
$Res call({
 List<PurchaseItemDataModel> items, PurchaseSummaryModel summary
});


$PurchaseSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class _$PurchaseReportModelCopyWithImpl<$Res>
    implements $PurchaseReportModelCopyWith<$Res> {
  _$PurchaseReportModelCopyWithImpl(this._self, this._then);

  final PurchaseReportModel _self;
  final $Res Function(PurchaseReportModel) _then;

/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PurchaseItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PurchaseSummaryModel,
  ));
}
/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseSummaryModelCopyWith<$Res> get summary {
  
  return $PurchaseSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurchaseReportModel].
extension PurchaseReportModelPatterns on PurchaseReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseReportModel value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PurchaseItemDataModel> items,  PurchaseSummaryModel summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PurchaseItemDataModel> items,  PurchaseSummaryModel summary)  $default,) {final _that = this;
switch (_that) {
case _PurchaseReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PurchaseItemDataModel> items,  PurchaseSummaryModel summary)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseReportModel() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseReportModel implements PurchaseReportModel {
  const _PurchaseReportModel({required final  List<PurchaseItemDataModel> items, required this.summary}): _items = items;
  factory _PurchaseReportModel.fromJson(Map<String, dynamic> json) => _$PurchaseReportModelFromJson(json);

 final  List<PurchaseItemDataModel> _items;
@override List<PurchaseItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  PurchaseSummaryModel summary;

/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseReportModelCopyWith<_PurchaseReportModel> get copyWith => __$PurchaseReportModelCopyWithImpl<_PurchaseReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseReportModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'PurchaseReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$PurchaseReportModelCopyWith<$Res> implements $PurchaseReportModelCopyWith<$Res> {
  factory _$PurchaseReportModelCopyWith(_PurchaseReportModel value, $Res Function(_PurchaseReportModel) _then) = __$PurchaseReportModelCopyWithImpl;
@override @useResult
$Res call({
 List<PurchaseItemDataModel> items, PurchaseSummaryModel summary
});


@override $PurchaseSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class __$PurchaseReportModelCopyWithImpl<$Res>
    implements _$PurchaseReportModelCopyWith<$Res> {
  __$PurchaseReportModelCopyWithImpl(this._self, this._then);

  final _PurchaseReportModel _self;
  final $Res Function(_PurchaseReportModel) _then;

/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_PurchaseReportModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PurchaseItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PurchaseSummaryModel,
  ));
}

/// Create a copy of PurchaseReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseSummaryModelCopyWith<$Res> get summary {
  
  return $PurchaseSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
