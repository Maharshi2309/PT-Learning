// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPassRequest _$ForgotPassRequestFromJson(Map<String, dynamic> json) =>
    ForgotPassRequest(
      bkmsId: json['bkms_id'] as String,
      email: json['email_address'] as String,
    );

Map<String, dynamic> _$ForgotPassRequestToJson(ForgotPassRequest instance) =>
    <String, dynamic>{
      'bkms_id': instance.bkmsId,
      'email_address': instance.email,
    };
