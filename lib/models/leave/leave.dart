import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/leave/leave_type.dart';
part 'leave.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Leave {
  Leave({
    this.success,
    this.message,
    this.id,
    this.userId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.days,
    this.remarks,
    this.attachmentPath,
    this.status,
    this.halfDay,
    this.approvalRemarks,
    this.approverId,
    this.createdAt,
    this.updatedAt,
    this.leaveType,
  });

  bool? success;
  List<String>? message;
  int? id;
  int? userId;
  int? leaveTypeId;
  DateTime? startDate;
  DateTime? endDate;
  double? days;
  String? remarks;
  String? attachmentPath;
  String? status;
  int? halfDay;
  String? approvalRemarks;
  int? approverId;
  DateTime? createdAt;
  DateTime? updatedAt;
  LeaveType? leaveType;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);
}
