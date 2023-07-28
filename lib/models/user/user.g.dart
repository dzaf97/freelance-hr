// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      employeeId: json['employee_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      phoneExt: json['phone_ext'],
      photoUrl: json['photo_url'],
      isActive: json['is_active'] as int?,
      shiftPatternId: json['shift_pattern_id'] as int?,
      departmentId: json['department_id'] as int?,
      positionId: json['position_id'] as int?,
      managerId: json['manager_id'] as int?,
      workLocationId: json['work_location_id'] as int?,
      employeeStatusId: json['employee_status_id'] as int?,
      attendanceLocationId: json['attendance_location_id'] as int?,
      joinDate: json['join_date'] == null
          ? null
          : DateTime.parse(json['join_date'] as String),
      terminationDate: json['termination_date'],
      isTerminated: json['is_terminated'] as int?,
      shiftPattern: json['shift_pattern'] == null
          ? null
          : ShiftPattern.fromJson(
              json['shift_pattern'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
      userPosition: json['user_position'] == null
          ? null
          : UserPosition.fromJson(
              json['user_position'] as Map<String, dynamic>),
      workLocation: json['work_location'] == null
          ? null
          : WorkLocation.fromJson(
              json['work_location'] as Map<String, dynamic>),
      attendanceLocation: json['attendance_location'] == null
          ? null
          : AttendanceLocation.fromJson(
              json['attendance_location'] as Map<String, dynamic>),
      employeeStatus: json['employee_status'] == null
          ? null
          : EmployeeStatus.fromJson(
              json['employee_status'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile_no': instance.mobileNo,
      'phone_ext': instance.phoneExt,
      'photo_url': instance.photoUrl,
      'is_active': instance.isActive,
      'shift_pattern_id': instance.shiftPatternId,
      'department_id': instance.departmentId,
      'position_id': instance.positionId,
      'manager_id': instance.managerId,
      'work_location_id': instance.workLocationId,
      'employee_status_id': instance.employeeStatusId,
      'attendance_location_id': instance.attendanceLocationId,
      'join_date': instance.joinDate?.toIso8601String(),
      'termination_date': instance.terminationDate,
      'is_terminated': instance.isTerminated,
      'shift_pattern': instance.shiftPattern?.toJson(),
      'department': instance.department?.toJson(),
      'user_position': instance.userPosition?.toJson(),
      'work_location': instance.workLocation?.toJson(),
      'attendance_location': instance.attendanceLocation?.toJson(),
      'employee_status': instance.employeeStatus?.toJson(),
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
    };
