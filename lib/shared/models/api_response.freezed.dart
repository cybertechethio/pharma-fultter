// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponse<T> {

 bool get success; MetaModel get metadata;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<T, ApiResponse<T>> get copyWith => _$ApiResponseCopyWithImpl<T, ApiResponse<T>>(this as ApiResponse<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,success,metadata);

@override
String toString() {
  return 'ApiResponse<$T>(success: $success, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<T,$Res>  {
  factory $ApiResponseCopyWith(ApiResponse<T> value, $Res Function(ApiResponse<T>) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 bool success, MetaModel metadata
});


$MetaModelCopyWith<$Res> get metadata;

}
/// @nodoc
class _$ApiResponseCopyWithImpl<T,$Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._self, this._then);

  final ApiResponse<T> _self;
  final $Res Function(ApiResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetaModel,
  ));
}
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaModelCopyWith<$Res> get metadata {
  
  return $MetaModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SuccessResponse<T> value)?  success,TResult Function( ErrorResponse<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SuccessResponse() when success != null:
return success(_that);case ErrorResponse() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SuccessResponse<T> value)  success,required TResult Function( ErrorResponse<T> value)  error,}){
final _that = this;
switch (_that) {
case SuccessResponse():
return success(_that);case ErrorResponse():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SuccessResponse<T> value)?  success,TResult? Function( ErrorResponse<T> value)?  error,}){
final _that = this;
switch (_that) {
case SuccessResponse() when success != null:
return success(_that);case ErrorResponse() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool success,  String message,  T data,  MetaModel metadata,  PaginationModel? pagination)?  success,TResult Function( bool success,  ErrorModel error,  MetaModel metadata)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SuccessResponse() when success != null:
return success(_that.success,_that.message,_that.data,_that.metadata,_that.pagination);case ErrorResponse() when error != null:
return error(_that.success,_that.error,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool success,  String message,  T data,  MetaModel metadata,  PaginationModel? pagination)  success,required TResult Function( bool success,  ErrorModel error,  MetaModel metadata)  error,}) {final _that = this;
switch (_that) {
case SuccessResponse():
return success(_that.success,_that.message,_that.data,_that.metadata,_that.pagination);case ErrorResponse():
return error(_that.success,_that.error,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool success,  String message,  T data,  MetaModel metadata,  PaginationModel? pagination)?  success,TResult? Function( bool success,  ErrorModel error,  MetaModel metadata)?  error,}) {final _that = this;
switch (_that) {
case SuccessResponse() when success != null:
return success(_that.success,_that.message,_that.data,_that.metadata,_that.pagination);case ErrorResponse() when error != null:
return error(_that.success,_that.error,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class SuccessResponse<T> implements ApiResponse<T> {
  const SuccessResponse({required this.success, required this.message, required this.data, required this.metadata, this.pagination});
  

@override final  bool success;
 final  String message;
 final  T data;
@override final  MetaModel metadata;
 final  PaginationModel? pagination;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResponseCopyWith<T, SuccessResponse<T>> get copyWith => _$SuccessResponseCopyWithImpl<T, SuccessResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),metadata,pagination);

@override
String toString() {
  return 'ApiResponse<$T>.success(success: $success, message: $message, data: $data, metadata: $metadata, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $SuccessResponseCopyWith(SuccessResponse<T> value, $Res Function(SuccessResponse<T>) _then) = _$SuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, T data, MetaModel metadata, PaginationModel? pagination
});


@override $MetaModelCopyWith<$Res> get metadata;$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$SuccessResponseCopyWithImpl<T,$Res>
    implements $SuccessResponseCopyWith<T, $Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse<T> _self;
  final $Res Function(SuccessResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,Object? metadata = null,Object? pagination = freezed,}) {
  return _then(SuccessResponse<T>(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetaModel,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaModelCopyWith<$Res> get metadata {
  
  return $MetaModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

/// @nodoc


class ErrorResponse<T> implements ApiResponse<T> {
  const ErrorResponse({required this.success, required this.error, required this.metadata});
  

@override final  bool success;
 final  ErrorModel error;
@override final  MetaModel metadata;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorResponseCopyWith<T, ErrorResponse<T>> get copyWith => _$ErrorResponseCopyWithImpl<T, ErrorResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,success,error,metadata);

@override
String toString() {
  return 'ApiResponse<$T>.error(success: $success, error: $error, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ErrorResponseCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $ErrorResponseCopyWith(ErrorResponse<T> value, $Res Function(ErrorResponse<T>) _then) = _$ErrorResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, ErrorModel error, MetaModel metadata
});


$ErrorModelCopyWith<$Res> get error;@override $MetaModelCopyWith<$Res> get metadata;

}
/// @nodoc
class _$ErrorResponseCopyWithImpl<T,$Res>
    implements $ErrorResponseCopyWith<T, $Res> {
  _$ErrorResponseCopyWithImpl(this._self, this._then);

  final ErrorResponse<T> _self;
  final $Res Function(ErrorResponse<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? error = null,Object? metadata = null,}) {
  return _then(ErrorResponse<T>(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorModel,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetaModel,
  ));
}

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorModelCopyWith<$Res> get error {
  
  return $ErrorModelCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaModelCopyWith<$Res> get metadata {
  
  return $MetaModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
