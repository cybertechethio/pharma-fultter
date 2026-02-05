// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseReport {

 List<ExpenseItemData> get items; ExpenseSummary get summary;
/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseReportCopyWith<ExpenseReport> get copyWith => _$ExpenseReportCopyWithImpl<ExpenseReport>(this as ExpenseReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseReport&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'ExpenseReport(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $ExpenseReportCopyWith<$Res>  {
  factory $ExpenseReportCopyWith(ExpenseReport value, $Res Function(ExpenseReport) _then) = _$ExpenseReportCopyWithImpl;
@useResult
$Res call({
 List<ExpenseItemData> items, ExpenseSummary summary
});


$ExpenseSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$ExpenseReportCopyWithImpl<$Res>
    implements $ExpenseReportCopyWith<$Res> {
  _$ExpenseReportCopyWithImpl(this._self, this._then);

  final ExpenseReport _self;
  final $Res Function(ExpenseReport) _then;

/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseItemData>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ExpenseSummary,
  ));
}
/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseSummaryCopyWith<$Res> get summary {
  
  return $ExpenseSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpenseReport].
extension ExpenseReportPatterns on ExpenseReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseReport value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseReport value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExpenseItemData> items,  ExpenseSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseReport() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExpenseItemData> items,  ExpenseSummary summary)  $default,) {final _that = this;
switch (_that) {
case _ExpenseReport():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExpenseItemData> items,  ExpenseSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseReport() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseReport implements ExpenseReport {
  const _ExpenseReport({required final  List<ExpenseItemData> items, required this.summary}): _items = items;
  

 final  List<ExpenseItemData> _items;
@override List<ExpenseItemData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ExpenseSummary summary;

/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseReportCopyWith<_ExpenseReport> get copyWith => __$ExpenseReportCopyWithImpl<_ExpenseReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseReport&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'ExpenseReport(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$ExpenseReportCopyWith<$Res> implements $ExpenseReportCopyWith<$Res> {
  factory _$ExpenseReportCopyWith(_ExpenseReport value, $Res Function(_ExpenseReport) _then) = __$ExpenseReportCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseItemData> items, ExpenseSummary summary
});


@override $ExpenseSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$ExpenseReportCopyWithImpl<$Res>
    implements _$ExpenseReportCopyWith<$Res> {
  __$ExpenseReportCopyWithImpl(this._self, this._then);

  final _ExpenseReport _self;
  final $Res Function(_ExpenseReport) _then;

/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_ExpenseReport(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ExpenseItemData>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ExpenseSummary,
  ));
}

/// Create a copy of ExpenseReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseSummaryCopyWith<$Res> get summary {
  
  return $ExpenseSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
