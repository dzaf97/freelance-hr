import 'package:json_annotation/json_annotation.dart';
part 'claim_category.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Category {
  Category({
    required this.id,
    required this.code,
    required this.category,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String code;
  String category;
  int isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
