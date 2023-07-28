import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/attendance/attendance_location.dart';
import 'package:myezhr/models/department/department.dart';
import 'package:myezhr/models/employee/employee_status.dart';
import 'package:myezhr/models/role/role.dart';
import 'package:myezhr/models/shift/shift_pattern.dart';
import 'package:myezhr/models/user/user_position.dart';
import 'package:myezhr/models/work/work_location.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class User {
  User({
    required this.id,
    this.employeeId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.updatedAt,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.phoneExt,
    this.photoUrl,
    this.isActive,
    this.shiftPatternId,
    this.departmentId,
    this.positionId,
    this.managerId,
    this.workLocationId,
    this.employeeStatusId,
    this.attendanceLocationId,
    this.joinDate,
    this.terminationDate,
    this.isTerminated,
    this.shiftPattern,
    this.department,
    this.userPosition,
    this.workLocation,
    this.attendanceLocation,
    this.employeeStatus,
    this.roles,
  });

  int id;
  String? employeeId;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? firstName;
  String? lastName;
  String? mobileNo;
  dynamic phoneExt;
  dynamic photoUrl;
  int? isActive;
  int? shiftPatternId;
  int? departmentId;
  int? positionId;
  int? managerId;
  int? workLocationId;
  int? employeeStatusId;
  int? attendanceLocationId;
  DateTime? joinDate;
  dynamic terminationDate;
  int? isTerminated;
  ShiftPattern? shiftPattern;
  Department? department;
  UserPosition? userPosition;
  WorkLocation? workLocation;
  AttendanceLocation? attendanceLocation;
  EmployeeStatus? employeeStatus;
  List<Role>? roles;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
