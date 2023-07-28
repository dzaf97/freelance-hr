import 'package:json_annotation/json_annotation.dart';
part 'user_position.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserPosition {
  UserPosition({
    required this.id,
    required this.departmentId,
    required this.code,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int departmentId;
  String code;
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserPosition.fromJson(Map<String, dynamic> json) =>
      _$UserPositionFromJson(json);

  Map<String, dynamic> toJson() => _$UserPositionToJson(this);
}
