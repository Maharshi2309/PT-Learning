// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  (json['status'] as num?)?.toInt() ?? 0,
  json['success'] as bool? ?? false,
  json['message'] as String? ?? '',
  json['data'] as Map<String, dynamic>? ?? {},
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'status': instance.status,
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) =>
    UserData(accessToken: json['accessToken'] as String? ?? 'access_token');

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
};
