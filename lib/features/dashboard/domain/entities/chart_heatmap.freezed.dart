// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_heatmap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChartHeatmap {

 List<HeatmapData> get data;
/// Create a copy of ChartHeatmap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartHeatmapCopyWith<ChartHeatmap> get copyWith => _$ChartHeatmapCopyWithImpl<ChartHeatmap>(this as ChartHeatmap, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartHeatmap&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ChartHeatmap(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChartHeatmapCopyWith<$Res>  {
  factory $ChartHeatmapCopyWith(ChartHeatmap value, $Res Function(ChartHeatmap) _then) = _$ChartHeatmapCopyWithImpl;
@useResult
$Res call({
 List<HeatmapData> data
});




}
/// @nodoc
class _$ChartHeatmapCopyWithImpl<$Res>
    implements $ChartHeatmapCopyWith<$Res> {
  _$ChartHeatmapCopyWithImpl(this._self, this._then);

  final ChartHeatmap _self;
  final $Res Function(ChartHeatmap) _then;

/// Create a copy of ChartHeatmap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<HeatmapData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartHeatmap].
extension ChartHeatmapPatterns on ChartHeatmap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartHeatmap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartHeatmap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartHeatmap value)  $default,){
final _that = this;
switch (_that) {
case _ChartHeatmap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartHeatmap value)?  $default,){
final _that = this;
switch (_that) {
case _ChartHeatmap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HeatmapData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartHeatmap() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HeatmapData> data)  $default,) {final _that = this;
switch (_that) {
case _ChartHeatmap():
return $default(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HeatmapData> data)?  $default,) {final _that = this;
switch (_that) {
case _ChartHeatmap() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _ChartHeatmap implements ChartHeatmap {
  const _ChartHeatmap({required final  List<HeatmapData> data}): _data = data;
  

 final  List<HeatmapData> _data;
@override List<HeatmapData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ChartHeatmap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartHeatmapCopyWith<_ChartHeatmap> get copyWith => __$ChartHeatmapCopyWithImpl<_ChartHeatmap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartHeatmap&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ChartHeatmap(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ChartHeatmapCopyWith<$Res> implements $ChartHeatmapCopyWith<$Res> {
  factory _$ChartHeatmapCopyWith(_ChartHeatmap value, $Res Function(_ChartHeatmap) _then) = __$ChartHeatmapCopyWithImpl;
@override @useResult
$Res call({
 List<HeatmapData> data
});




}
/// @nodoc
class __$ChartHeatmapCopyWithImpl<$Res>
    implements _$ChartHeatmapCopyWith<$Res> {
  __$ChartHeatmapCopyWithImpl(this._self, this._then);

  final _ChartHeatmap _self;
  final $Res Function(_ChartHeatmap) _then;

/// Create a copy of ChartHeatmap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ChartHeatmap(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<HeatmapData>,
  ));
}


}

// dart format on
