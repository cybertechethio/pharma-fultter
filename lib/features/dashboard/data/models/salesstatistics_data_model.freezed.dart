// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salesstatistics_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesStatisticsDataModel {

@JsonKey(name: 'date') String get date;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get revenue;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get expense;
/// Create a copy of SalesStatisticsDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesStatisticsDataModelCopyWith<SalesStatisticsDataModel> get copyWith => _$SalesStatisticsDataModelCopyWithImpl<SalesStatisticsDataModel>(this as SalesStatisticsDataModel, _$identity);

  /// Serializes this SalesStatisticsDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesStatisticsDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.expense, expense) || other.expense == expense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,expense);

@override
String toString() {
  return 'SalesStatisticsDataModel(date: $date, revenue: $revenue, expense: $expense)';
}


}

/// @nodoc
abstract mixin class $SalesStatisticsDataModelCopyWith<$Res>  {
  factory $SalesStatisticsDataModelCopyWith(SalesStatisticsDataModel value, $Res Function(SalesStatisticsDataModel) _then) = _$SalesStatisticsDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date') String date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double revenue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double expense
});




}
/// @nodoc
class _$SalesStatisticsDataModelCopyWithImpl<$Res>
    implements $SalesStatisticsDataModelCopyWith<$Res> {
  _$SalesStatisticsDataModelCopyWithImpl(this._self, this._then);

  final SalesStatisticsDataModel _self;
  final $Res Function(SalesStatisticsDataModel) _then;

/// Create a copy of SalesStatisticsDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? revenue = null,Object? expense = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesStatisticsDataModel].
extension SalesStatisticsDataModelPatterns on SalesStatisticsDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesStatisticsDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesStatisticsDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesStatisticsDataModel value)  $default,){
final _that = this;
switch (_that) {
case _SalesStatisticsDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesStatisticsDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalesStatisticsDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date')  String date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double revenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesStatisticsDataModel() when $default != null:
return $default(_that.date,_that.revenue,_that.expense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date')  String date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double revenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expense)  $default,) {final _that = this;
switch (_that) {
case _SalesStatisticsDataModel():
return $default(_that.date,_that.revenue,_that.expense);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date')  String date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double revenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double expense)?  $default,) {final _that = this;
switch (_that) {
case _SalesStatisticsDataModel() when $default != null:
return $default(_that.date,_that.revenue,_that.expense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesStatisticsDataModel implements SalesStatisticsDataModel {
  const _SalesStatisticsDataModel({@JsonKey(name: 'date') required this.date, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.revenue, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.expense});
  factory _SalesStatisticsDataModel.fromJson(Map<String, dynamic> json) => _$SalesStatisticsDataModelFromJson(json);

@override@JsonKey(name: 'date') final  String date;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double revenue;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double expense;

/// Create a copy of SalesStatisticsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesStatisticsDataModelCopyWith<_SalesStatisticsDataModel> get copyWith => __$SalesStatisticsDataModelCopyWithImpl<_SalesStatisticsDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesStatisticsDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesStatisticsDataModel&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.expense, expense) || other.expense == expense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,expense);

@override
String toString() {
  return 'SalesStatisticsDataModel(date: $date, revenue: $revenue, expense: $expense)';
}


}

/// @nodoc
abstract mixin class _$SalesStatisticsDataModelCopyWith<$Res> implements $SalesStatisticsDataModelCopyWith<$Res> {
  factory _$SalesStatisticsDataModelCopyWith(_SalesStatisticsDataModel value, $Res Function(_SalesStatisticsDataModel) _then) = __$SalesStatisticsDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date') String date,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double revenue,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double expense
});




}
/// @nodoc
class __$SalesStatisticsDataModelCopyWithImpl<$Res>
    implements _$SalesStatisticsDataModelCopyWith<$Res> {
  __$SalesStatisticsDataModelCopyWithImpl(this._self, this._then);

  final _SalesStatisticsDataModel _self;
  final $Res Function(_SalesStatisticsDataModel) _then;

/// Create a copy of SalesStatisticsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? revenue = null,Object? expense = null,}) {
  return _then(_SalesStatisticsDataModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
