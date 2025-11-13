import 'package:freezed_annotation/freezed_annotation.dart';

part 'resetpass_request.g.dart';

@JsonSerializable()
class ResetpassRequest {
  final String password;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;
  final String token;
  @JsonKey(name: 'bkms_id')
  final int bkmsId;
  

  const ResetpassRequest({required this.password, required this.confirmPassword,
  required this.token,
    required this.bkmsId,
  });


  factory ResetpassRequest.fromJson(Map<String, dynamic> json) =>
  _$ResetpassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetpassRequestToJson(this);
}
