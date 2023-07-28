import 'package:json_annotation/json_annotation.dart';
part 'announcement.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Announcement {
  Announcement({
    this.id,
    this.title,
    this.attachmentPath,
    this.content,
    this.authorId,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? attachmentPath;
  String? content;
  int? authorId;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}
