// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgor_pass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPassState {

 Status get status; String get message; ForgotpassData? get forgotpassData;
/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPassStateCopyWith<ForgotPassState> get copyWith => _$ForgotPassStateCopyWithImpl<ForgotPassState>(this as ForgotPassState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPassState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.forgotpassData, forgotpassData) || other.forgotpassData == forgotpassData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,forgotpassData);

@override
String toString() {
  return 'ForgotPassState(status: $status, message: $message, forgotpassData: $forgotpassData)';
}


}

/// @nodoc
abstract mixin class $ForgotPassStateCopyWith<$Res>  {
  factory $ForgotPassStateCopyWith(ForgotPassState value, $Res Function(ForgotPassState) _then) = _$ForgotPassStateCopyWithImpl;
@useResult
$Res call({
 Status status, String message, ForgotpassData? forgotpassData
});




}
/// @nodoc
class _$ForgotPassStateCopyWithImpl<$Res>
    implements $ForgotPassStateCopyWith<$Res> {
  _$ForgotPassStateCopyWithImpl(this._self, this._then);

  final ForgotPassState _self;
  final $Res Function(ForgotPassState) _then;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? forgotpassData = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,forgotpassData: freezed == forgotpassData ? _self.forgotpassData : forgotpassData // ignore: cast_nullable_to_non_nullable
as ForgotpassData?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPassState].
extension ForgotPassStatePatterns on ForgotPassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPassState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPassState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPassState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPassState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  String message,  ForgotpassData? forgotpassData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
return $default(_that.status,_that.message,_that.forgotpassData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  String message,  ForgotpassData? forgotpassData)  $default,) {final _that = this;
switch (_that) {
case _ForgotPassState():
return $default(_that.status,_that.message,_that.forgotpassData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  String message,  ForgotpassData? forgotpassData)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPassState() when $default != null:
return $default(_that.status,_that.message,_that.forgotpassData);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPassState implements ForgotPassState {
  const _ForgotPassState({this.status = Status.init, this.message = '', this.forgotpassData});
  

@override@JsonKey() final  Status status;
@override@JsonKey() final  String message;
@override final  ForgotpassData? forgotpassData;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPassStateCopyWith<_ForgotPassState> get copyWith => __$ForgotPassStateCopyWithImpl<_ForgotPassState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPassState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.forgotpassData, forgotpassData) || other.forgotpassData == forgotpassData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,forgotpassData);

@override
String toString() {
  return 'ForgotPassState(status: $status, message: $message, forgotpassData: $forgotpassData)';
}


}

/// @nodoc
abstract mixin class _$ForgotPassStateCopyWith<$Res> implements $ForgotPassStateCopyWith<$Res> {
  factory _$ForgotPassStateCopyWith(_ForgotPassState value, $Res Function(_ForgotPassState) _then) = __$ForgotPassStateCopyWithImpl;
@override @useResult
$Res call({
 Status status, String message, ForgotpassData? forgotpassData
});




}
/// @nodoc
class __$ForgotPassStateCopyWithImpl<$Res>
    implements _$ForgotPassStateCopyWith<$Res> {
  __$ForgotPassStateCopyWithImpl(this._self, this._then);

  final _ForgotPassState _self;
  final $Res Function(_ForgotPassState) _then;

/// Create a copy of ForgotPassState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? forgotpassData = freezed,}) {
  return _then(_ForgotPassState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,forgotpassData: freezed == forgotpassData ? _self.forgotpassData : forgotpassData // ignore: cast_nullable_to_non_nullable
as ForgotpassData?,
  ));
}


}

// dart format on
