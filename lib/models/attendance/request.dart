import 'package:json_annotation/json_annotation.dart';
part 'request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AttendanceRequest {
  final String shiftDailyId;
  final String type;
  final String? startTime;
  final String? endTime;
  final String latLong;
  final String file;

  AttendanceRequest({
    required this.shiftDailyId,
    required this.type,
    this.startTime,
    this.endTime,
    required this.latLong,
    required this.file,
  });

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceRequestToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AttendanceRes {
  AttendanceRes({
    required this.success,
    required this.count,
    required this.data,
    required this.message,
  });

  bool success;
  int count;
  Data? data;
  List<String?> message;

  factory AttendanceRes.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Data {
  Data({
    required this.shiftDailyId,
    required this.type,
    this.startTime,
    this.endTime,
    required this.userId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String shiftDailyId;
  String type;
  DateTime? startTime;
  DateTime? endTime;
  int userId;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

/*  
-  [ENDPOINT] '/attendance-correction'
-  [TYPE] Response
-  [METHOD] POST
*/

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AttendanceCorrectionRequest {
  final String? userId;
  final String? shiftDailyId;
  final String? date;
  final String? newStartTime;
  final String? newEndTime;
  final String? remarks;
  final String? status;

  AttendanceCorrectionRequest({
    this.userId,
    this.shiftDailyId,
    this.date,
    this.newStartTime,
    this.newEndTime,
    this.remarks,
    this.status,
  });

  factory AttendanceCorrectionRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCorrectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCorrectionRequestToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AttendanceCorrectionRes {
  AttendanceCorrectionRes({
    required this.success,
    required this.count,
    required this.data,
    required this.message,
  });

  bool success;
  int count;
  Data3? data;
  List<String?> message;

  factory AttendanceCorrectionRes.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCorrectionResFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceCorrectionResToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Data3 {
  Data3({
    required this.userId,
    required this.shiftDailyId,
    required this.date,
    required this.newStartTime,
    required this.newEndTime,
    required this.remarks,
    required this.requestorId,
    required this.attendanceId,
    required this.prevStartTime,
    required this.prevEndTime,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  dynamic id;
  dynamic userId;
  int? requestorId;
  int? attendanceId;
  dynamic shiftDailyId;
  DateTime? date;
  String? prevStartTime;
  String? prevEndTime;
  String? newStartTime;
  String? newEndTime;
  String? remarks;
  String? status;
  int? approverId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data3.fromJson(Map<String, dynamic> json) => _$Data3FromJson(json);

  Map<String, dynamic> toJson() => _$Data3ToJson(this);
}
