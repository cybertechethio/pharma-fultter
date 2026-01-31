// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenericResponseModel {

 String get accessToken; String get refreshToken; UserModel get user;@JsonKey(fromJson: _idFromJson) String? get currentCompanyId;@JsonKey(fromJson: _idFromJson) String? get currentBranchId; CompanyModel? get currentCompany; BranchModel? get currentBranch;
/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericResponseModelCopyWith<GenericResponseModel> get copyWith => _$GenericResponseModelCopyWithImpl<GenericResponseModel>(this as GenericResponseModel, _$identity);

  /// Serializes this GenericResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user)&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.currentBranch, currentBranch) || other.currentBranch == currentBranch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user,currentCompanyId,currentBranchId,currentCompany,currentBranch);

@override
String toString() {
  return 'GenericResponseModel(accessToken: $accessToken, refreshToken: $refreshToken, user: $user, currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId, currentCompany: $currentCompany, currentBranch: $currentBranch)';
}


}

/// @nodoc
abstract mixin class $GenericResponseModelCopyWith<$Res>  {
  factory $GenericResponseModelCopyWith(GenericResponseModel value, $Res Function(GenericResponseModel) _then) = _$GenericResponseModelCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, UserModel user,@JsonKey(fromJson: _idFromJson) String? currentCompanyId,@JsonKey(fromJson: _idFromJson) String? currentBranchId, CompanyModel? currentCompany, BranchModel? currentBranch
});


$UserModelCopyWith<$Res> get user;$CompanyModelCopyWith<$Res>? get currentCompany;$BranchModelCopyWith<$Res>? get currentBranch;

}
/// @nodoc
class _$GenericResponseModelCopyWithImpl<$Res>
    implements $GenericResponseModelCopyWith<$Res> {
  _$GenericResponseModelCopyWithImpl(this._self, this._then);

  final GenericResponseModel _self;
  final $Res Function(GenericResponseModel) _then;

/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,Object? currentCompanyId = freezed,Object? currentBranchId = freezed,Object? currentCompany = freezed,Object? currentBranch = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,currentBranch: freezed == currentBranch ? _self.currentBranch : currentBranch // ignore: cast_nullable_to_non_nullable
as BranchModel?,
  ));
}
/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<$Res>? get currentCompany {
    if (_self.currentCompany == null) {
    return null;
  }

  return $CompanyModelCopyWith<$Res>(_self.currentCompany!, (value) {
    return _then(_self.copyWith(currentCompany: value));
  });
}/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchModelCopyWith<$Res>? get currentBranch {
    if (_self.currentBranch == null) {
    return null;
  }

  return $BranchModelCopyWith<$Res>(_self.currentBranch!, (value) {
    return _then(_self.copyWith(currentBranch: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenericResponseModel].
extension GenericResponseModelPatterns on GenericResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenericResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenericResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenericResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _GenericResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenericResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _GenericResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  UserModel user, @JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId,  CompanyModel? currentCompany,  BranchModel? currentBranch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenericResponseModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user,_that.currentCompanyId,_that.currentBranchId,_that.currentCompany,_that.currentBranch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  UserModel user, @JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId,  CompanyModel? currentCompany,  BranchModel? currentBranch)  $default,) {final _that = this;
switch (_that) {
case _GenericResponseModel():
return $default(_that.accessToken,_that.refreshToken,_that.user,_that.currentCompanyId,_that.currentBranchId,_that.currentCompany,_that.currentBranch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  UserModel user, @JsonKey(fromJson: _idFromJson)  String? currentCompanyId, @JsonKey(fromJson: _idFromJson)  String? currentBranchId,  CompanyModel? currentCompany,  BranchModel? currentBranch)?  $default,) {final _that = this;
switch (_that) {
case _GenericResponseModel() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.user,_that.currentCompanyId,_that.currentBranchId,_that.currentCompany,_that.currentBranch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenericResponseModel implements GenericResponseModel {
  const _GenericResponseModel({required this.accessToken, required this.refreshToken, required this.user, @JsonKey(fromJson: _idFromJson) this.currentCompanyId, @JsonKey(fromJson: _idFromJson) this.currentBranchId, this.currentCompany, this.currentBranch});
  factory _GenericResponseModel.fromJson(Map<String, dynamic> json) => _$GenericResponseModelFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  UserModel user;
@override@JsonKey(fromJson: _idFromJson) final  String? currentCompanyId;
@override@JsonKey(fromJson: _idFromJson) final  String? currentBranchId;
@override final  CompanyModel? currentCompany;
@override final  BranchModel? currentBranch;

/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenericResponseModelCopyWith<_GenericResponseModel> get copyWith => __$GenericResponseModelCopyWithImpl<_GenericResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenericResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenericResponseModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user)&&(identical(other.currentCompanyId, currentCompanyId) || other.currentCompanyId == currentCompanyId)&&(identical(other.currentBranchId, currentBranchId) || other.currentBranchId == currentBranchId)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.currentBranch, currentBranch) || other.currentBranch == currentBranch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user,currentCompanyId,currentBranchId,currentCompany,currentBranch);

@override
String toString() {
  return 'GenericResponseModel(accessToken: $accessToken, refreshToken: $refreshToken, user: $user, currentCompanyId: $currentCompanyId, currentBranchId: $currentBranchId, currentCompany: $currentCompany, currentBranch: $currentBranch)';
}


}

/// @nodoc
abstract mixin class _$GenericResponseModelCopyWith<$Res> implements $GenericResponseModelCopyWith<$Res> {
  factory _$GenericResponseModelCopyWith(_GenericResponseModel value, $Res Function(_GenericResponseModel) _then) = __$GenericResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, UserModel user,@JsonKey(fromJson: _idFromJson) String? currentCompanyId,@JsonKey(fromJson: _idFromJson) String? currentBranchId, CompanyModel? currentCompany, BranchModel? currentBranch
});


@override $UserModelCopyWith<$Res> get user;@override $CompanyModelCopyWith<$Res>? get currentCompany;@override $BranchModelCopyWith<$Res>? get currentBranch;

}
/// @nodoc
class __$GenericResponseModelCopyWithImpl<$Res>
    implements _$GenericResponseModelCopyWith<$Res> {
  __$GenericResponseModelCopyWithImpl(this._self, this._then);

  final _GenericResponseModel _self;
  final $Res Function(_GenericResponseModel) _then;

/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? user = null,Object? currentCompanyId = freezed,Object? currentBranchId = freezed,Object? currentCompany = freezed,Object? currentBranch = freezed,}) {
  return _then(_GenericResponseModel(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,currentCompanyId: freezed == currentCompanyId ? _self.currentCompanyId : currentCompanyId // ignore: cast_nullable_to_non_nullable
as String?,currentBranchId: freezed == currentBranchId ? _self.currentBranchId : currentBranchId // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,currentBranch: freezed == currentBranch ? _self.currentBranch : currentBranch // ignore: cast_nullable_to_non_nullable
as BranchModel?,
  ));
}

/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<$Res>? get currentCompany {
    if (_self.currentCompany == null) {
    return null;
  }

  return $CompanyModelCopyWith<$Res>(_self.currentCompany!, (value) {
    return _then(_self.copyWith(currentCompany: value));
  });
}/// Create a copy of GenericResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchModelCopyWith<$Res>? get currentBranch {
    if (_self.currentBranch == null) {
    return null;
  }

  return $BranchModelCopyWith<$Res>(_self.currentBranch!, (value) {
    return _then(_self.copyWith(currentBranch: value));
  });
}
}

// dart format on
