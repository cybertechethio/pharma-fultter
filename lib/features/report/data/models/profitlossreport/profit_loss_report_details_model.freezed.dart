// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_loss_report_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfitLossReportDetailsModel {

 DateTime get date; List<ProfitLossItemDataModel> get items; ProfitLossTotalsModel get totals;
/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfitLossReportDetailsModelCopyWith<ProfitLossReportDetailsModel> get copyWith => _$ProfitLossReportDetailsModelCopyWithImpl<ProfitLossReportDetailsModel>(this as ProfitLossReportDetailsModel, _$identity);

  /// Serializes this ProfitLossReportDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfitLossReportDetailsModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(items),totals);

@override
String toString() {
  return 'ProfitLossReportDetailsModel(date: $date, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class $ProfitLossReportDetailsModelCopyWith<$Res>  {
  factory $ProfitLossReportDetailsModelCopyWith(ProfitLossReportDetailsModel value, $Res Function(ProfitLossReportDetailsModel) _then) = _$ProfitLossReportDetailsModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<ProfitLossItemDataModel> items, ProfitLossTotalsModel totals
});


$ProfitLossTotalsModelCopyWith<$Res> get totals;

}
/// @nodoc
class _$ProfitLossReportDetailsModelCopyWithImpl<$Res>
    implements $ProfitLossReportDetailsModelCopyWith<$Res> {
  _$ProfitLossReportDetailsModelCopyWithImpl(this._self, this._then);

  final ProfitLossReportDetailsModel _self;
  final $Res Function(ProfitLossReportDetailsModel) _then;

/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? items = null,Object? totals = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLossItemDataModel>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as ProfitLossTotalsModel,
  ));
}
/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossTotalsModelCopyWith<$Res> get totals {
  
  return $ProfitLossTotalsModelCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfitLossReportDetailsModel].
extension ProfitLossReportDetailsModelPatterns on ProfitLossReportDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfitLossReportDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfitLossReportDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfitLossReportDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<ProfitLossItemDataModel> items,  ProfitLossTotalsModel totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel() when $default != null:
return $default(_that.date,_that.items,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<ProfitLossItemDataModel> items,  ProfitLossTotalsModel totals)  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel():
return $default(_that.date,_that.items,_that.totals);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<ProfitLossItemDataModel> items,  ProfitLossTotalsModel totals)?  $default,) {final _that = this;
switch (_that) {
case _ProfitLossReportDetailsModel() when $default != null:
return $default(_that.date,_that.items,_that.totals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfitLossReportDetailsModel implements ProfitLossReportDetailsModel {
  const _ProfitLossReportDetailsModel({required this.date, required final  List<ProfitLossItemDataModel> items, required this.totals}): _items = items;
  factory _ProfitLossReportDetailsModel.fromJson(Map<String, dynamic> json) => _$ProfitLossReportDetailsModelFromJson(json);

@override final  DateTime date;
 final  List<ProfitLossItemDataModel> _items;
@override List<ProfitLossItemDataModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ProfitLossTotalsModel totals;

/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfitLossReportDetailsModelCopyWith<_ProfitLossReportDetailsModel> get copyWith => __$ProfitLossReportDetailsModelCopyWithImpl<_ProfitLossReportDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfitLossReportDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfitLossReportDetailsModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_items),totals);

@override
String toString() {
  return 'ProfitLossReportDetailsModel(date: $date, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$ProfitLossReportDetailsModelCopyWith<$Res> implements $ProfitLossReportDetailsModelCopyWith<$Res> {
  factory _$ProfitLossReportDetailsModelCopyWith(_ProfitLossReportDetailsModel value, $Res Function(_ProfitLossReportDetailsModel) _then) = __$ProfitLossReportDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<ProfitLossItemDataModel> items, ProfitLossTotalsModel totals
});


@override $ProfitLossTotalsModelCopyWith<$Res> get totals;

}
/// @nodoc
class __$ProfitLossReportDetailsModelCopyWithImpl<$Res>
    implements _$ProfitLossReportDetailsModelCopyWith<$Res> {
  __$ProfitLossReportDetailsModelCopyWithImpl(this._self, this._then);

  final _ProfitLossReportDetailsModel _self;
  final $Res Function(_ProfitLossReportDetailsModel) _then;

/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? items = null,Object? totals = null,}) {
  return _then(_ProfitLossReportDetailsModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProfitLossItemDataModel>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as ProfitLossTotalsModel,
  ));
}

/// Create a copy of ProfitLossReportDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfitLossTotalsModelCopyWith<$Res> get totals {
  
  return $ProfitLossTotalsModelCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
