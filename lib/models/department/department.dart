import 'package:json_annotation/json_annotation.dart';
part 'department.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Department {
  Department({
    required this.id,
    required this.name,
    required this.code,
    this.deptHead,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String code;
  int? deptHead;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
