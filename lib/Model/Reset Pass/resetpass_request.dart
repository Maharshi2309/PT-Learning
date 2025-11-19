import 'package:freezed_annotation/freezed_annotation.dart';

part 'resetpass_request.g.dart';

@JsonSerializable()
class ResetpassRequest {
  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'confirm_password')
  final String confirmPassword;

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'bkms_id')
  final int? bkmsId;

  @JsonKey(name: 'is_child')
  final bool? isChild;
  

  const ResetpassRequest({required this.password, required this.confirmPassword,
  required this.token,
    required this.bkmsId,
    required this.isChild,
  });


  factory ResetpassRequest.fromJson(Map<String, dynamic> json) =>
  _$ResetpassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetpassRequestToJson(this);
}
