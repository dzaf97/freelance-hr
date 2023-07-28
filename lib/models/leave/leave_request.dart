import 'package:json_annotation/json_annotation.dart';
part 'leave_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class LeaveRequest {
  LeaveRequest({
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.remarks,
    this.file,
    this.status,
  });

  String? leaveTypeId;
  String? startDate;
  String? endDate;
  String? remarks;
  String? file;
  String? status;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) => _$LeaveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveRequestToJson(this);

  bool validate() {
    for (var element in toJson().values) {
      if (element == "") return false;
    }
    return true;
  }
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LeaveReqModel {
  LeaveReqModel({
    required this.success,
    required this.count,
    this.data,
    required this.message,
  });

  bool success;
  int count;
  Datum3? data;
  List<String?> message;

  factory LeaveReqModel.fromJson(Map<String, dynamic> json) => _$LeaveReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveReqModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Datum3 {
  Datum3({
    required this.leaveTypeId,
    required this.startDate,
    required this.endDate,
    required this.remarks,
    required this.userId,
    required this.days,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String leaveTypeId;
  DateTime startDate;
  DateTime endDate;
  String remarks;
  int userId;
  int days;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Datum3.fromJson(Map<String, dynamic> json) => _$Datum3FromJson(json);

  Map<String, dynamic> toJson() => _$Datum3ToJson(this);
}
