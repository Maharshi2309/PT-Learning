// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgotPass_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotpassData _$ForgotpassDataFromJson(Map<String, dynamic> json) =>
    ForgotpassData(
      status: (json['status'] as num).toInt(),
      success: json['success'] as bool,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ForgotpassDataToJson(ForgotpassData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.data,
    };
