// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resetPass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPassState {

 ResetStatus get status; String get message; ResetpassData? get resetpassData;
/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPassStateCopyWith<ResetPassState> get copyWith => _$ResetPassStateCopyWithImpl<ResetPassState>(this as ResetPassState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPassState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.resetpassData, resetpassData) || other.resetpassData == resetpassData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,resetpassData);

@override
String toString() {
  return 'ResetPassState(status: $status, message: $message, resetpassData: $resetpassData)';
}


}

/// @nodoc
abstract mixin class $ResetPassStateCopyWith<$Res>  {
  factory $ResetPassStateCopyWith(ResetPassState value, $Res Function(ResetPassState) _then) = _$ResetPassStateCopyWithImpl;
@useResult
$Res call({
 ResetStatus status, String message, ResetpassData? resetpassData
});




}
/// @nodoc
class _$ResetPassStateCopyWithImpl<$Res>
    implements $ResetPassStateCopyWith<$Res> {
  _$ResetPassStateCopyWithImpl(this._self, this._then);

  final ResetPassState _self;
  final $Res Function(ResetPassState) _then;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? resetpassData = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResetStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,resetpassData: freezed == resetpassData ? _self.resetpassData : resetpassData // ignore: cast_nullable_to_non_nullable
as ResetpassData?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPassState].
extension ResetPassStatePatterns on ResetPassState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPassState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPassState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPassState value)  $default,){
final _that = this;
switch (_that) {
case _ResetPassState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPassState value)?  $default,){
final _that = this;
switch (_that) {
case _ResetPassState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResetStatus status,  String message,  ResetpassData? resetpassData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPassState() when $default != null:
return $default(_that.status,_that.message,_that.resetpassData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResetStatus status,  String message,  ResetpassData? resetpassData)  $default,) {final _that = this;
switch (_that) {
case _ResetPassState():
return $default(_that.status,_that.message,_that.resetpassData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResetStatus status,  String message,  ResetpassData? resetpassData)?  $default,) {final _that = this;
switch (_that) {
case _ResetPassState() when $default != null:
return $default(_that.status,_that.message,_that.resetpassData);case _:
  return null;

}
}

}

/// @nodoc


class _ResetPassState implements ResetPassState {
  const _ResetPassState({this.status = ResetStatus.initReset, this.message = '', this.resetpassData});
  

@override@JsonKey() final  ResetStatus status;
@override@JsonKey() final  String message;
@override final  ResetpassData? resetpassData;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPassStateCopyWith<_ResetPassState> get copyWith => __$ResetPassStateCopyWithImpl<_ResetPassState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.resetpassData, resetpassData) || other.resetpassData == resetpassData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,resetpassData);

@override
String toString() {
  return 'ResetPassState(status: $status, message: $message, resetpassData: $resetpassData)';
}


}

/// @nodoc
abstract mixin class _$ResetPassStateCopyWith<$Res> implements $ResetPassStateCopyWith<$Res> {
  factory _$ResetPassStateCopyWith(_ResetPassState value, $Res Function(_ResetPassState) _then) = __$ResetPassStateCopyWithImpl;
@override @useResult
$Res call({
 ResetStatus status, String message, ResetpassData? resetpassData
});




}
/// @nodoc
class __$ResetPassStateCopyWithImpl<$Res>
    implements _$ResetPassStateCopyWith<$Res> {
  __$ResetPassStateCopyWithImpl(this._self, this._then);

  final _ResetPassState _self;
  final $Res Function(_ResetPassState) _then;

/// Create a copy of ResetPassState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? resetpassData = freezed,}) {
  return _then(_ResetPassState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResetStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,resetpassData: freezed == resetpassData ? _self.resetpassData : resetpassData // ignore: cast_nullable_to_non_nullable
as ResetpassData?,
  ));
}


}

// dart format on
