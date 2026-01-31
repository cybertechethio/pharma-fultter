// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( Authenticated value)?  authenticated,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( Registered value)?  registered,TResult Function( AccountVerified value)?  accountVerified,TResult Function( OtpValidated value)?  otpValidated,TResult Function( ForgotPasswordSent value)?  forgotPasswordSent,TResult Function( PasswordReset value)?  passwordReset,TResult Function( PasswordChanged value)?  passwordChanged,TResult Function( ProfileUpdated value)?  profileUpdated,TResult Function( AccountDeleted value)?  accountDeleted,TResult Function( OtpResent value)?  otpResent,TResult Function( AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Registered() when registered != null:
return registered(_that);case AccountVerified() when accountVerified != null:
return accountVerified(_that);case OtpValidated() when otpValidated != null:
return otpValidated(_that);case ForgotPasswordSent() when forgotPasswordSent != null:
return forgotPasswordSent(_that);case PasswordReset() when passwordReset != null:
return passwordReset(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case AccountDeleted() when accountDeleted != null:
return accountDeleted(_that);case OtpResent() when otpResent != null:
return otpResent(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( Authenticated value)  authenticated,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( Registered value)  registered,required TResult Function( AccountVerified value)  accountVerified,required TResult Function( OtpValidated value)  otpValidated,required TResult Function( ForgotPasswordSent value)  forgotPasswordSent,required TResult Function( PasswordReset value)  passwordReset,required TResult Function( PasswordChanged value)  passwordChanged,required TResult Function( ProfileUpdated value)  profileUpdated,required TResult Function( AccountDeleted value)  accountDeleted,required TResult Function( OtpResent value)  otpResent,required TResult Function( AuthError value)  error,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case Authenticated():
return authenticated(_that);case Unauthenticated():
return unauthenticated(_that);case Registered():
return registered(_that);case AccountVerified():
return accountVerified(_that);case OtpValidated():
return otpValidated(_that);case ForgotPasswordSent():
return forgotPasswordSent(_that);case PasswordReset():
return passwordReset(_that);case PasswordChanged():
return passwordChanged(_that);case ProfileUpdated():
return profileUpdated(_that);case AccountDeleted():
return accountDeleted(_that);case OtpResent():
return otpResent(_that);case AuthError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( Authenticated value)?  authenticated,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( Registered value)?  registered,TResult? Function( AccountVerified value)?  accountVerified,TResult? Function( OtpValidated value)?  otpValidated,TResult? Function( ForgotPasswordSent value)?  forgotPasswordSent,TResult? Function( PasswordReset value)?  passwordReset,TResult? Function( PasswordChanged value)?  passwordChanged,TResult? Function( ProfileUpdated value)?  profileUpdated,TResult? Function( AccountDeleted value)?  accountDeleted,TResult? Function( OtpResent value)?  otpResent,TResult? Function( AuthError value)?  error,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case Registered() when registered != null:
return registered(_that);case AccountVerified() when accountVerified != null:
return accountVerified(_that);case OtpValidated() when otpValidated != null:
return otpValidated(_that);case ForgotPasswordSent() when forgotPasswordSent != null:
return forgotPasswordSent(_that);case PasswordReset() when passwordReset != null:
return passwordReset(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case AccountDeleted() when accountDeleted != null:
return accountDeleted(_that);case OtpResent() when otpResent != null:
return otpResent(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  loading,TResult Function( String message,  User user,  AuthToken tokens)?  authenticated,TResult Function( String message)?  unauthenticated,TResult Function( String message,  User user)?  registered,TResult Function( String message,  User user,  AuthToken tokens)?  accountVerified,TResult Function( String message,  User user)?  otpValidated,TResult Function( String message,  User? user)?  forgotPasswordSent,TResult Function( String message,  User user,  AuthToken tokens)?  passwordReset,TResult Function( String message,  User user)?  passwordChanged,TResult Function( String message,  User user)?  profileUpdated,TResult Function( String message)?  accountDeleted,TResult Function( String message,  User? user)?  otpResent,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading(_that.message);case Authenticated() when authenticated != null:
return authenticated(_that.message,_that.user,_that.tokens);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message);case Registered() when registered != null:
return registered(_that.message,_that.user);case AccountVerified() when accountVerified != null:
return accountVerified(_that.message,_that.user,_that.tokens);case OtpValidated() when otpValidated != null:
return otpValidated(_that.message,_that.user);case ForgotPasswordSent() when forgotPasswordSent != null:
return forgotPasswordSent(_that.message,_that.user);case PasswordReset() when passwordReset != null:
return passwordReset(_that.message,_that.user,_that.tokens);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.message,_that.user);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.message,_that.user);case AccountDeleted() when accountDeleted != null:
return accountDeleted(_that.message);case OtpResent() when otpResent != null:
return otpResent(_that.message,_that.user);case AuthError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  loading,required TResult Function( String message,  User user,  AuthToken tokens)  authenticated,required TResult Function( String message)  unauthenticated,required TResult Function( String message,  User user)  registered,required TResult Function( String message,  User user,  AuthToken tokens)  accountVerified,required TResult Function( String message,  User user)  otpValidated,required TResult Function( String message,  User? user)  forgotPasswordSent,required TResult Function( String message,  User user,  AuthToken tokens)  passwordReset,required TResult Function( String message,  User user)  passwordChanged,required TResult Function( String message,  User user)  profileUpdated,required TResult Function( String message)  accountDeleted,required TResult Function( String message,  User? user)  otpResent,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading(_that.message);case Authenticated():
return authenticated(_that.message,_that.user,_that.tokens);case Unauthenticated():
return unauthenticated(_that.message);case Registered():
return registered(_that.message,_that.user);case AccountVerified():
return accountVerified(_that.message,_that.user,_that.tokens);case OtpValidated():
return otpValidated(_that.message,_that.user);case ForgotPasswordSent():
return forgotPasswordSent(_that.message,_that.user);case PasswordReset():
return passwordReset(_that.message,_that.user,_that.tokens);case PasswordChanged():
return passwordChanged(_that.message,_that.user);case ProfileUpdated():
return profileUpdated(_that.message,_that.user);case AccountDeleted():
return accountDeleted(_that.message);case OtpResent():
return otpResent(_that.message,_that.user);case AuthError():
return error(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  loading,TResult? Function( String message,  User user,  AuthToken tokens)?  authenticated,TResult? Function( String message)?  unauthenticated,TResult? Function( String message,  User user)?  registered,TResult? Function( String message,  User user,  AuthToken tokens)?  accountVerified,TResult? Function( String message,  User user)?  otpValidated,TResult? Function( String message,  User? user)?  forgotPasswordSent,TResult? Function( String message,  User user,  AuthToken tokens)?  passwordReset,TResult? Function( String message,  User user)?  passwordChanged,TResult? Function( String message,  User user)?  profileUpdated,TResult? Function( String message)?  accountDeleted,TResult? Function( String message,  User? user)?  otpResent,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading(_that.message);case Authenticated() when authenticated != null:
return authenticated(_that.message,_that.user,_that.tokens);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.message);case Registered() when registered != null:
return registered(_that.message,_that.user);case AccountVerified() when accountVerified != null:
return accountVerified(_that.message,_that.user,_that.tokens);case OtpValidated() when otpValidated != null:
return otpValidated(_that.message,_that.user);case ForgotPasswordSent() when forgotPasswordSent != null:
return forgotPasswordSent(_that.message,_that.user);case PasswordReset() when passwordReset != null:
return passwordReset(_that.message,_that.user,_that.tokens);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.message,_that.user);case ProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.message,_that.user);case AccountDeleted() when accountDeleted != null:
return accountDeleted(_that.message);case OtpResent() when otpResent != null:
return otpResent(_that.message,_that.user);case AuthError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoadingCopyWith<AuthLoading> get copyWith => _$AuthLoadingCopyWithImpl<AuthLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.loading(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthLoadingCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthLoadingCopyWith(AuthLoading value, $Res Function(AuthLoading) _then) = _$AuthLoadingCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthLoadingCopyWithImpl<$Res>
    implements $AuthLoadingCopyWith<$Res> {
  _$AuthLoadingCopyWithImpl(this._self, this._then);

  final AuthLoading _self;
  final $Res Function(AuthLoading) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthLoading(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Authenticated implements AuthState {
  const Authenticated({required this.message, required this.user, required this.tokens});
  

 final  String message;
 final  User user;
 final  AuthToken tokens;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,message,user,tokens);

@override
String toString() {
  return 'AuthState.authenticated(message: $message, user: $user, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 String message, User user, AuthToken tokens
});


$UserCopyWith<$Res> get user;$AuthTokenCopyWith<$Res> get tokens;

}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,Object? tokens = null,}) {
  return _then(Authenticated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthToken,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res> get tokens {
  
  return $AuthTokenCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}
}

/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.unauthenticated(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Unauthenticated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Registered implements AuthState {
  const Registered({required this.message, required this.user});
  

 final  String message;
 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisteredCopyWith<Registered> get copyWith => _$RegisteredCopyWithImpl<Registered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Registered&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.registered(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisteredCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $RegisteredCopyWith(Registered value, $Res Function(Registered) _then) = _$RegisteredCopyWithImpl;
@useResult
$Res call({
 String message, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisteredCopyWithImpl<$Res>
    implements $RegisteredCopyWith<$Res> {
  _$RegisteredCopyWithImpl(this._self, this._then);

  final Registered _self;
  final $Res Function(Registered) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,}) {
  return _then(Registered(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AccountVerified implements AuthState {
  const AccountVerified({required this.message, required this.user, required this.tokens});
  

 final  String message;
 final  User user;
 final  AuthToken tokens;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountVerifiedCopyWith<AccountVerified> get copyWith => _$AccountVerifiedCopyWithImpl<AccountVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountVerified&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,message,user,tokens);

@override
String toString() {
  return 'AuthState.accountVerified(message: $message, user: $user, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $AccountVerifiedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AccountVerifiedCopyWith(AccountVerified value, $Res Function(AccountVerified) _then) = _$AccountVerifiedCopyWithImpl;
@useResult
$Res call({
 String message, User user, AuthToken tokens
});


$UserCopyWith<$Res> get user;$AuthTokenCopyWith<$Res> get tokens;

}
/// @nodoc
class _$AccountVerifiedCopyWithImpl<$Res>
    implements $AccountVerifiedCopyWith<$Res> {
  _$AccountVerifiedCopyWithImpl(this._self, this._then);

  final AccountVerified _self;
  final $Res Function(AccountVerified) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,Object? tokens = null,}) {
  return _then(AccountVerified(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthToken,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res> get tokens {
  
  return $AuthTokenCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}
}

/// @nodoc


class OtpValidated implements AuthState {
  const OtpValidated({required this.message, required this.user});
  

 final  String message;
 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpValidatedCopyWith<OtpValidated> get copyWith => _$OtpValidatedCopyWithImpl<OtpValidated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpValidated&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.otpValidated(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $OtpValidatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $OtpValidatedCopyWith(OtpValidated value, $Res Function(OtpValidated) _then) = _$OtpValidatedCopyWithImpl;
@useResult
$Res call({
 String message, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$OtpValidatedCopyWithImpl<$Res>
    implements $OtpValidatedCopyWith<$Res> {
  _$OtpValidatedCopyWithImpl(this._self, this._then);

  final OtpValidated _self;
  final $Res Function(OtpValidated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,}) {
  return _then(OtpValidated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class ForgotPasswordSent implements AuthState {
  const ForgotPasswordSent({required this.message, this.user});
  

 final  String message;
 final  User? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordSentCopyWith<ForgotPasswordSent> get copyWith => _$ForgotPasswordSentCopyWithImpl<ForgotPasswordSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordSent&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.forgotPasswordSent(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordSentCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ForgotPasswordSentCopyWith(ForgotPasswordSent value, $Res Function(ForgotPasswordSent) _then) = _$ForgotPasswordSentCopyWithImpl;
@useResult
$Res call({
 String message, User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ForgotPasswordSentCopyWithImpl<$Res>
    implements $ForgotPasswordSentCopyWith<$Res> {
  _$ForgotPasswordSentCopyWithImpl(this._self, this._then);

  final ForgotPasswordSent _self;
  final $Res Function(ForgotPasswordSent) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = freezed,}) {
  return _then(ForgotPasswordSent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class PasswordReset implements AuthState {
  const PasswordReset({required this.message, required this.user, required this.tokens});
  

 final  String message;
 final  User user;
 final  AuthToken tokens;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetCopyWith<PasswordReset> get copyWith => _$PasswordResetCopyWithImpl<PasswordReset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordReset&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.tokens, tokens) || other.tokens == tokens));
}


@override
int get hashCode => Object.hash(runtimeType,message,user,tokens);

@override
String toString() {
  return 'AuthState.passwordReset(message: $message, user: $user, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $PasswordResetCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $PasswordResetCopyWith(PasswordReset value, $Res Function(PasswordReset) _then) = _$PasswordResetCopyWithImpl;
@useResult
$Res call({
 String message, User user, AuthToken tokens
});


$UserCopyWith<$Res> get user;$AuthTokenCopyWith<$Res> get tokens;

}
/// @nodoc
class _$PasswordResetCopyWithImpl<$Res>
    implements $PasswordResetCopyWith<$Res> {
  _$PasswordResetCopyWithImpl(this._self, this._then);

  final PasswordReset _self;
  final $Res Function(PasswordReset) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,Object? tokens = null,}) {
  return _then(PasswordReset(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as AuthToken,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenCopyWith<$Res> get tokens {
  
  return $AuthTokenCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}
}

/// @nodoc


class PasswordChanged implements AuthState {
  const PasswordChanged({required this.message, required this.user});
  

 final  String message;
 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.passwordChanged(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String message, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,}) {
  return _then(PasswordChanged(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class ProfileUpdated implements AuthState {
  const ProfileUpdated({required this.message, required this.user});
  

 final  String message;
 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUpdatedCopyWith<ProfileUpdated> get copyWith => _$ProfileUpdatedCopyWithImpl<ProfileUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUpdated&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.profileUpdated(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileUpdatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ProfileUpdatedCopyWith(ProfileUpdated value, $Res Function(ProfileUpdated) _then) = _$ProfileUpdatedCopyWithImpl;
@useResult
$Res call({
 String message, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$ProfileUpdatedCopyWithImpl<$Res>
    implements $ProfileUpdatedCopyWith<$Res> {
  _$ProfileUpdatedCopyWithImpl(this._self, this._then);

  final ProfileUpdated _self;
  final $Res Function(ProfileUpdated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,}) {
  return _then(ProfileUpdated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AccountDeleted implements AuthState {
  const AccountDeleted({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDeletedCopyWith<AccountDeleted> get copyWith => _$AccountDeletedCopyWithImpl<AccountDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDeleted&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.accountDeleted(message: $message)';
}


}

/// @nodoc
abstract mixin class $AccountDeletedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AccountDeletedCopyWith(AccountDeleted value, $Res Function(AccountDeleted) _then) = _$AccountDeletedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AccountDeletedCopyWithImpl<$Res>
    implements $AccountDeletedCopyWith<$Res> {
  _$AccountDeletedCopyWithImpl(this._self, this._then);

  final AccountDeleted _self;
  final $Res Function(AccountDeleted) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AccountDeleted(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OtpResent implements AuthState {
  const OtpResent({required this.message, this.user});
  

 final  String message;
 final  User? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpResentCopyWith<OtpResent> get copyWith => _$OtpResentCopyWithImpl<OtpResent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpResent&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'AuthState.otpResent(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $OtpResentCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $OtpResentCopyWith(OtpResent value, $Res Function(OtpResent) _then) = _$OtpResentCopyWithImpl;
@useResult
$Res call({
 String message, User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$OtpResentCopyWithImpl<$Res>
    implements $OtpResentCopyWith<$Res> {
  _$OtpResentCopyWithImpl(this._self, this._then);

  final OtpResent _self;
  final $Res Function(OtpResent) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = freezed,}) {
  return _then(OtpResent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthError implements AuthState {
  const AuthError({required this.failure});
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AuthError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
