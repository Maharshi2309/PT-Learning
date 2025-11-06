import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'bkms_id')
  final String bkmsId;
  @JsonKey(name: 'email_address')
  final String email;
  
  final String password;

  const LoginRequest({
    required this.bkmsId,
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
