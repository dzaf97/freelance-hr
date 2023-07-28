import 'package:json_annotation/json_annotation.dart';
part 'overtime.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class OvertimeModel {
  OvertimeModel({
    required this.id,
    required this.userId,
    this.approverId,
    this.overtimeTypeId,
    this.startDate,
    this.endDate,
    required this.hours,
    this.remarks,
    this.attachmentPath,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.details,
    required this.overtimeType,
    this.user,
  });

  int id;
  int userId;
  int? approverId;
  int? overtimeTypeId;
  DateTime? startDate;
  DateTime? endDate;
  dynamic hours;
  String? remarks;
  String? attachmentPath;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Detail>? details;
  OvertimeType overtimeType;
  User? user;

  factory OvertimeModel.fromJson(Map<String, dynamic> json) => _$OvertimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Detail {
  Detail({
    required this.id,
    required this.overtimeId,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.duration,
    required this.status,
    required this.isCancelled,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int overtimeId;
  DateTime date;
  String startTime;
  String endTime;
  int? duration;
  dynamic status;
  int isCancelled;
  DateTime createdAt;
  DateTime updatedAt;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class OvertimeType {
  OvertimeType({
    required this.id,
    required this.type,
    required this.code,
    required this.applyBefore,
    required this.maxTime,
    required this.minTime,
    required this.overtimeRounding,
    required this.overtimeRoundLimit,
    required this.deductTime,
    required this.everyOvertimeAchieved,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String type;
  String code;
  int applyBefore;
  int maxTime;
  int minTime;
  int overtimeRounding;
  int overtimeRoundLimit;
  int deductTime;
  int everyOvertimeAchieved;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OvertimeType.fromJson(Map<String, dynamic> json) => _$OvertimeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeTypeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
  User({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.firstName,
    required this.lastName,
    this.mobileNo,
    required this.phoneExt,
    required this.photoUrl,
    required this.isActive,
    required this.shiftPatternId,
    required this.departmentId,
    this.positionId,
    this.managerId,
    this.workLocationId,
    this.employeeStatusId,
    this.attendanceLocationId,
    this.joinDate,
    this.terminationDate,
    this.createdAt,
    this.updatedAt,
    this.isTerminated,
    required this.fcmToken,
  });

  int id;
  String employeeId;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String firstName;
  String lastName;
  String? mobileNo;
  dynamic phoneExt;
  dynamic photoUrl;
  int isActive;
  int shiftPatternId;
  int departmentId;
  int? positionId;
  int? managerId;
  int? workLocationId;
  int? employeeStatusId;
  int? attendanceLocationId;
  DateTime? joinDate;
  DateTime? terminationDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isTerminated;
  dynamic fcmToken;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
