import 'package:json_annotation/json_annotation.dart';
part 'request_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestList {
  RequestList({
    required this.user,
    required this.userId,
    required this.position,
    required this.id,
    this.label,
    this.type,
    this.startDate,
    this.endDate,
    this.applyDate,
    this.remarks,
    this.status,
    this.url,
    this.prevStartTime,
    this.prevEndTime,
    this.newStartTime,
    this.newEndTime,
  });

  String user;
  int userId;
  String position;
  int id;
  String? label;
  String? type;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? applyDate;
  String? remarks;
  String? status;
  String? url;
  String? prevStartTime;
  String? prevEndTime;
  String? newStartTime;
  String? newEndTime;

  factory RequestList.fromJson(Map<String, dynamic> json) => _$RequestListFromJson(json);
  Map<String, dynamic> toJson() => _$RequestListToJson(this);
}
