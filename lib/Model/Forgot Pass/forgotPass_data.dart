import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgotPass_data.g.dart';

@JsonSerializable()
class ForgotpassData {
  final int status;
  final bool success;
  final Map<String, dynamic> data;

  const ForgotpassData({
    required this.status,
    required this.success,
    required this.data,
  });

  factory ForgotpassData.fromJson(Map<String, dynamic> json) =>
      _$ForgotpassDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotpassDataToJson(this);
}

