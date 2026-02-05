// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesReport {

 List<SalesItemData> get items; SalesSummary get summary;
/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportCopyWith<SalesReport> get copyWith => _$SalesReportCopyWithImpl<SalesReport>(this as SalesReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReport&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'SalesReport(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $SalesReportCopyWith<$Res>  {
  factory $SalesReportCopyWith(SalesReport value, $Res Function(SalesReport) _then) = _$SalesReportCopyWithImpl;
@useResult
$Res call({
 List<SalesItemData> items, SalesSummary summary
});


$SalesSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$SalesReportCopyWithImpl<$Res>
    implements $SalesReportCopyWith<$Res> {
  _$SalesReportCopyWithImpl(this._self, this._then);

  final SalesReport _self;
  final $Res Function(SalesReport) _then;

/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SalesItemData>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesSummary,
  ));
}
/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryCopyWith<$Res> get summary {
  
  return $SalesSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesReport].
extension SalesReportPatterns on SalesReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReport value)  $default,){
final _that = this;
switch (_that) {
case _SalesReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReport value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesItemData> items,  SalesSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReport() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesItemData> items,  SalesSummary summary)  $default,) {final _that = this;
switch (_that) {
case _SalesReport():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesItemData> items,  SalesSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _SalesReport() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _SalesReport implements SalesReport {
  const _SalesReport({required final  List<SalesItemData> items, required this.summary}): _items = items;
  

 final  List<SalesItemData> _items;
@override List<SalesItemData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  SalesSummary summary;

/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportCopyWith<_SalesReport> get copyWith => __$SalesReportCopyWithImpl<_SalesReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReport&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'SalesReport(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$SalesReportCopyWith<$Res> implements $SalesReportCopyWith<$Res> {
  factory _$SalesReportCopyWith(_SalesReport value, $Res Function(_SalesReport) _then) = __$SalesReportCopyWithImpl;
@override @useResult
$Res call({
 List<SalesItemData> items, SalesSummary summary
});


@override $SalesSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$SalesReportCopyWithImpl<$Res>
    implements _$SalesReportCopyWith<$Res> {
  __$SalesReportCopyWithImpl(this._self, this._then);

  final _SalesReport _self;
  final $Res Function(_SalesReport) _then;

/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_SalesReport(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SalesItemData>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesSummary,
  ));
}

/// Create a copy of SalesReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryCopyWith<$Res> get summary {
  
  return $SalesSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
