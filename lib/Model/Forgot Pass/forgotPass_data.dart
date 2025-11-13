import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgotPass_data.g.dart';

@JsonSerializable()
class ForgotpassData {
  final int status;
  final bool success;

  const ForgotpassData({required this.status, required this.success});


  factory ForgotpassData.fromJson(Map<String, dynamic> json) => _$ForgotpassDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotpassDataToJson(this);
}
