// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetpass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetpassRequest _$ResetpassRequestFromJson(Map<String, dynamic> json) =>
    ResetpassRequest(
      password: json['password'] as String,
      confirmPassword: json['confirm_password'] as String,
      token: json['token'] as String,
      bkmsId: (json['bkms_id'] as num).toInt(),
    );

Map<String, dynamic> _$ResetpassRequestToJson(ResetpassRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'token': instance.token,
      'bkms_id': instance.bkmsId,
    };
