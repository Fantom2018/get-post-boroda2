import 'package:json_annotation/json_annotation.dart';

part 'data_seralize.g.dart';

@JsonSerializable()
class JesData {
  @JsonKey(name: 'userId')
  final int userID;
  final int id;
  final String title;
  final String body;

  JesData ({
  required this.userID,
  required this.id,
  required this.title,
  required this.body,
  });

  factory JesData.fromJson(Map<String, dynamic> json) => _$JesDataFromJson(json);

  Map<String, dynamic> toJson() => _$JesDataToJson(this);
}