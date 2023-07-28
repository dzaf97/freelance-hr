import 'package:json_annotation/json_annotation.dart';
part 'pending_approval.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PendingApproval {
  PendingApproval({
    required this.user,
    required this.userId,
    required this.position,
    required this.id,
    required this.label,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.applyDate,
    this.remarks,
    required this.status,
    required this.url,
  });

  String user;
  int userId;
  String position;
  int id;
  String label;
  String type;
  DateTime startDate;
  DateTime endDate;
  DateTime applyDate;
  String? remarks;
  String status;
  String url;

  factory PendingApproval.fromJson(Map<String, dynamic> json) =>
      _$PendingApprovalFromJson(json);
  Map<String, dynamic> toJson() => _$PendingApprovalToJson(this);
}
