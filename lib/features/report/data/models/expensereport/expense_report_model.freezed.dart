// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseReportModel {

 List<ExpenseItemDataModel> get items; ExpenseSummaryModel get summary;
/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseReportModelCopyWith<ExpenseReportModel> get copyWith => _$ExpenseReportModelCopyWithImpl<ExpenseReportModel>(this as ExpenseReportModel, _$identity);

  /// Serializes this ExpenseReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseReportModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'ExpenseReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $ExpenseReportModelCopyWith<$Res>  {
  factory $ExpenseReportModelCopyWith(ExpenseReportModel value, $Res Function(ExpenseReportModel) _then) = _$ExpenseReportModelCopyWithImpl;
@useResult
$Res call({
 List<ExpenseItemDataModel> items, ExpenseSummaryModel summary
});


$ExpenseSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class _$ExpenseReportModelCopyWithImpl<$Res>
    implements $ExpenseReportModelCopyWith<$Res> {
  _$ExpenseReportModelCopyWithImpl(this._self, this._then);

  final ExpenseReportModel _self;
  final $Res Function(ExpenseReportModel) _then;

/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ExpenseSummaryModel,
  ));
}
/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseSummaryModelCopyWith<$Res> get summary {
  
  return $ExpenseSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpenseReportModel].
extension ExpenseReportModelPatterns on ExpenseReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExpenseItemDataModel> items,  ExpenseSummaryModel summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseReportModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExpenseItemDataModel> items,  ExpenseSummaryModel summary)  $default,) {final _that = this;
switch (_that) {
case _ExpenseReportModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExpenseItemDataModel> items,  ExpenseSummaryModel summary)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseReportModel() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseReportModel implements ExpenseReportModel {
  const _ExpenseReportModel({required final  List<ExpenseItemDataModel> items, required this.summary}): _items = items;
  factory _ExpenseReportModel.fromJson(Map<String, dynamic> json) => _$ExpenseReportModelFromJson(json);

 final  List<ExpenseItemDataModel> _items;
@override List<ExpenseItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ExpenseSummaryModel summary;

/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseReportModelCopyWith<_ExpenseReportModel> get copyWith => __$ExpenseReportModelCopyWithImpl<_ExpenseReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseReportModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'ExpenseReportModel(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$ExpenseReportModelCopyWith<$Res> implements $ExpenseReportModelCopyWith<$Res> {
  factory _$ExpenseReportModelCopyWith(_ExpenseReportModel value, $Res Function(_ExpenseReportModel) _then) = __$ExpenseReportModelCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseItemDataModel> items, ExpenseSummaryModel summary
});


@override $ExpenseSummaryModelCopyWith<$Res> get summary;

}
/// @nodoc
class __$ExpenseReportModelCopyWithImpl<$Res>
    implements _$ExpenseReportModelCopyWith<$Res> {
  __$ExpenseReportModelCopyWithImpl(this._self, this._then);

  final _ExpenseReportModel _self;
  final $Res Function(_ExpenseReportModel) _then;

/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_ExpenseReportModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseItemDataModel>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ExpenseSummaryModel,
  ));
}

/// Create a copy of ExpenseReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseSummaryModelCopyWith<$Res> get summary {
  
  return $ExpenseSummaryModelCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
