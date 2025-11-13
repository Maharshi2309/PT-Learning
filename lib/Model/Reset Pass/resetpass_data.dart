import 'package:json_annotation/json_annotation.dart';

part 'resetpass_data.g.dart';

@JsonSerializable()
class ResetpassData {
  final int status;

  const ResetpassData({required this.status});

  factory ResetpassData.fromJson(Map<String, dynamic> json) =>
      _$ResetpassDataFromJson(json);

    Map<String, dynamic> toJson() => _$ResetpassDataToJson(this);
}
