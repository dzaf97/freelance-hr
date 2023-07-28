import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Role {
  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Pivot {
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}
