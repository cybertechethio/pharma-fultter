// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadFileData {

 String get url; String get filename; int get size; String get mimetype; String get type;
/// Create a copy of UploadFileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadFileDataCopyWith<UploadFileData> get copyWith => _$UploadFileDataCopyWithImpl<UploadFileData>(this as UploadFileData, _$identity);

  /// Serializes this UploadFileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadFileData&&(identical(other.url, url) || other.url == url)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,filename,size,mimetype,type);

@override
String toString() {
  return 'UploadFileData(url: $url, filename: $filename, size: $size, mimetype: $mimetype, type: $type)';
}


}

/// @nodoc
abstract mixin class $UploadFileDataCopyWith<$Res>  {
  factory $UploadFileDataCopyWith(UploadFileData value, $Res Function(UploadFileData) _then) = _$UploadFileDataCopyWithImpl;
@useResult
$Res call({
 String url, String filename, int size, String mimetype, String type
});




}
/// @nodoc
class _$UploadFileDataCopyWithImpl<$Res>
    implements $UploadFileDataCopyWith<$Res> {
  _$UploadFileDataCopyWithImpl(this._self, this._then);

  final UploadFileData _self;
  final $Res Function(UploadFileData) _then;

/// Create a copy of UploadFileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? filename = null,Object? size = null,Object? mimetype = null,Object? type = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimetype: null == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadFileData].
extension UploadFileDataPatterns on UploadFileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadFileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadFileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadFileData value)  $default,){
final _that = this;
switch (_that) {
case _UploadFileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadFileData value)?  $default,){
final _that = this;
switch (_that) {
case _UploadFileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String filename,  int size,  String mimetype,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadFileData() when $default != null:
return $default(_that.url,_that.filename,_that.size,_that.mimetype,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String filename,  int size,  String mimetype,  String type)  $default,) {final _that = this;
switch (_that) {
case _UploadFileData():
return $default(_that.url,_that.filename,_that.size,_that.mimetype,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String filename,  int size,  String mimetype,  String type)?  $default,) {final _that = this;
switch (_that) {
case _UploadFileData() when $default != null:
return $default(_that.url,_that.filename,_that.size,_that.mimetype,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadFileData implements UploadFileData {
  const _UploadFileData({required this.url, required this.filename, required this.size, required this.mimetype, required this.type});
  factory _UploadFileData.fromJson(Map<String, dynamic> json) => _$UploadFileDataFromJson(json);

@override final  String url;
@override final  String filename;
@override final  int size;
@override final  String mimetype;
@override final  String type;

/// Create a copy of UploadFileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadFileDataCopyWith<_UploadFileData> get copyWith => __$UploadFileDataCopyWithImpl<_UploadFileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadFileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadFileData&&(identical(other.url, url) || other.url == url)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.size, size) || other.size == size)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,filename,size,mimetype,type);

@override
String toString() {
  return 'UploadFileData(url: $url, filename: $filename, size: $size, mimetype: $mimetype, type: $type)';
}


}

/// @nodoc
abstract mixin class _$UploadFileDataCopyWith<$Res> implements $UploadFileDataCopyWith<$Res> {
  factory _$UploadFileDataCopyWith(_UploadFileData value, $Res Function(_UploadFileData) _then) = __$UploadFileDataCopyWithImpl;
@override @useResult
$Res call({
 String url, String filename, int size, String mimetype, String type
});




}
/// @nodoc
class __$UploadFileDataCopyWithImpl<$Res>
    implements _$UploadFileDataCopyWith<$Res> {
  __$UploadFileDataCopyWithImpl(this._self, this._then);

  final _UploadFileData _self;
  final $Res Function(_UploadFileData) _then;

/// Create a copy of UploadFileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? filename = null,Object? size = null,Object? mimetype = null,Object? type = null,}) {
  return _then(_UploadFileData(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,mimetype: null == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UploadFilesData {

 List<UploadFileData> get files;
/// Create a copy of UploadFilesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadFilesDataCopyWith<UploadFilesData> get copyWith => _$UploadFilesDataCopyWithImpl<UploadFilesData>(this as UploadFilesData, _$identity);

  /// Serializes this UploadFilesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadFilesData&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'UploadFilesData(files: $files)';
}


}

/// @nodoc
abstract mixin class $UploadFilesDataCopyWith<$Res>  {
  factory $UploadFilesDataCopyWith(UploadFilesData value, $Res Function(UploadFilesData) _then) = _$UploadFilesDataCopyWithImpl;
@useResult
$Res call({
 List<UploadFileData> files
});




}
/// @nodoc
class _$UploadFilesDataCopyWithImpl<$Res>
    implements $UploadFilesDataCopyWith<$Res> {
  _$UploadFilesDataCopyWithImpl(this._self, this._then);

  final UploadFilesData _self;
  final $Res Function(UploadFilesData) _then;

/// Create a copy of UploadFilesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? files = null,}) {
  return _then(_self.copyWith(
files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<UploadFileData>,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadFilesData].
extension UploadFilesDataPatterns on UploadFilesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadFilesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadFilesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadFilesData value)  $default,){
final _that = this;
switch (_that) {
case _UploadFilesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadFilesData value)?  $default,){
final _that = this;
switch (_that) {
case _UploadFilesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UploadFileData> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadFilesData() when $default != null:
return $default(_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UploadFileData> files)  $default,) {final _that = this;
switch (_that) {
case _UploadFilesData():
return $default(_that.files);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UploadFileData> files)?  $default,) {final _that = this;
switch (_that) {
case _UploadFilesData() when $default != null:
return $default(_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadFilesData implements UploadFilesData {
  const _UploadFilesData({required final  List<UploadFileData> files}): _files = files;
  factory _UploadFilesData.fromJson(Map<String, dynamic> json) => _$UploadFilesDataFromJson(json);

 final  List<UploadFileData> _files;
@override List<UploadFileData> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of UploadFilesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadFilesDataCopyWith<_UploadFilesData> get copyWith => __$UploadFilesDataCopyWithImpl<_UploadFilesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadFilesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadFilesData&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'UploadFilesData(files: $files)';
}


}

/// @nodoc
abstract mixin class _$UploadFilesDataCopyWith<$Res> implements $UploadFilesDataCopyWith<$Res> {
  factory _$UploadFilesDataCopyWith(_UploadFilesData value, $Res Function(_UploadFilesData) _then) = __$UploadFilesDataCopyWithImpl;
@override @useResult
$Res call({
 List<UploadFileData> files
});




}
/// @nodoc
class __$UploadFilesDataCopyWithImpl<$Res>
    implements _$UploadFilesDataCopyWith<$Res> {
  __$UploadFilesDataCopyWithImpl(this._self, this._then);

  final _UploadFilesData _self;
  final $Res Function(_UploadFilesData) _then;

/// Create a copy of UploadFilesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? files = null,}) {
  return _then(_UploadFilesData(
files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<UploadFileData>,
  ));
}


}

/// @nodoc
mixin _$UploadResponseModel {

 Object get data;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponseModel&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'UploadResponseModel(data: $data)';
}


}

/// @nodoc
class $UploadResponseModelCopyWith<$Res>  {
$UploadResponseModelCopyWith(UploadResponseModel _, $Res Function(UploadResponseModel) __);
}


/// Adds pattern-matching-related methods to [UploadResponseModel].
extension UploadResponseModelPatterns on UploadResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UploadResponseModelSingle value)?  single,TResult Function( _UploadResponseModelMultiple value)?  multiple,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResponseModelSingle() when single != null:
return single(_that);case _UploadResponseModelMultiple() when multiple != null:
return multiple(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UploadResponseModelSingle value)  single,required TResult Function( _UploadResponseModelMultiple value)  multiple,}){
final _that = this;
switch (_that) {
case _UploadResponseModelSingle():
return single(_that);case _UploadResponseModelMultiple():
return multiple(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UploadResponseModelSingle value)?  single,TResult? Function( _UploadResponseModelMultiple value)?  multiple,}){
final _that = this;
switch (_that) {
case _UploadResponseModelSingle() when single != null:
return single(_that);case _UploadResponseModelMultiple() when multiple != null:
return multiple(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UploadFileData data)?  single,TResult Function( UploadFilesData data)?  multiple,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResponseModelSingle() when single != null:
return single(_that.data);case _UploadResponseModelMultiple() when multiple != null:
return multiple(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UploadFileData data)  single,required TResult Function( UploadFilesData data)  multiple,}) {final _that = this;
switch (_that) {
case _UploadResponseModelSingle():
return single(_that.data);case _UploadResponseModelMultiple():
return multiple(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UploadFileData data)?  single,TResult? Function( UploadFilesData data)?  multiple,}) {final _that = this;
switch (_that) {
case _UploadResponseModelSingle() when single != null:
return single(_that.data);case _UploadResponseModelMultiple() when multiple != null:
return multiple(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _UploadResponseModelSingle implements UploadResponseModel {
  const _UploadResponseModelSingle({required this.data});
  

@override final  UploadFileData data;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseModelSingleCopyWith<_UploadResponseModelSingle> get copyWith => __$UploadResponseModelSingleCopyWithImpl<_UploadResponseModelSingle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponseModelSingle&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UploadResponseModel.single(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseModelSingleCopyWith<$Res> implements $UploadResponseModelCopyWith<$Res> {
  factory _$UploadResponseModelSingleCopyWith(_UploadResponseModelSingle value, $Res Function(_UploadResponseModelSingle) _then) = __$UploadResponseModelSingleCopyWithImpl;
@useResult
$Res call({
 UploadFileData data
});


$UploadFileDataCopyWith<$Res> get data;

}
/// @nodoc
class __$UploadResponseModelSingleCopyWithImpl<$Res>
    implements _$UploadResponseModelSingleCopyWith<$Res> {
  __$UploadResponseModelSingleCopyWithImpl(this._self, this._then);

  final _UploadResponseModelSingle _self;
  final $Res Function(_UploadResponseModelSingle) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_UploadResponseModelSingle(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadFileData,
  ));
}

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadFileDataCopyWith<$Res> get data {
  
  return $UploadFileDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class _UploadResponseModelMultiple implements UploadResponseModel {
  const _UploadResponseModelMultiple({required this.data});
  

@override final  UploadFilesData data;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseModelMultipleCopyWith<_UploadResponseModelMultiple> get copyWith => __$UploadResponseModelMultipleCopyWithImpl<_UploadResponseModelMultiple>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponseModelMultiple&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UploadResponseModel.multiple(data: $data)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseModelMultipleCopyWith<$Res> implements $UploadResponseModelCopyWith<$Res> {
  factory _$UploadResponseModelMultipleCopyWith(_UploadResponseModelMultiple value, $Res Function(_UploadResponseModelMultiple) _then) = __$UploadResponseModelMultipleCopyWithImpl;
@useResult
$Res call({
 UploadFilesData data
});


$UploadFilesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$UploadResponseModelMultipleCopyWithImpl<$Res>
    implements _$UploadResponseModelMultipleCopyWith<$Res> {
  __$UploadResponseModelMultipleCopyWithImpl(this._self, this._then);

  final _UploadResponseModelMultiple _self;
  final $Res Function(_UploadResponseModelMultiple) _then;

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_UploadResponseModelMultiple(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UploadFilesData,
  ));
}

/// Create a copy of UploadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UploadFilesDataCopyWith<$Res> get data {
  
  return $UploadFilesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
