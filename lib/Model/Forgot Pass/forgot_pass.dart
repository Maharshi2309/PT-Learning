import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_pass.g.dart';

@JsonSerializable()
class ForgotPassRequest {
  @JsonKey(name: 'bkms_id')
  final String bkmsId;
  @JsonKey(name: 'email_address')
  final String email;

  const ForgotPassRequest({required this.bkmsId, required this.email});

  factory ForgotPassRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPassRequestToJson(this);
}
