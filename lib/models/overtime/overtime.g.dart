// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeModel _$OvertimeModelFromJson(Map<String, dynamic> json) =>
    OvertimeModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      approverId: json['approver_id'] as int?,
      overtimeTypeId: json['overtime_type_id'] as int?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      hours: json['hours'],
      remarks: json['remarks'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      overtimeType:
          OvertimeType.fromJson(json['overtime_type'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OvertimeModelToJson(OvertimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'approver_id': instance.approverId,
      'overtime_type_id': instance.overtimeTypeId,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'hours': instance.hours,
      'remarks': instance.remarks,
      'attachment_path': instance.attachmentPath,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'details': instance.details?.map((e) => e.toJson()).toList(),
      'overtime_type': instance.overtimeType.toJson(),
      'user': instance.user?.toJson(),
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      id: json['id'] as int,
      overtimeId: json['overtime_id'] as int,
      date: DateTime.parse(json['date'] as String),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      duration: json['duration'] as int?,
      status: json['status'],
      isCancelled: json['is_cancelled'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'overtime_id': instance.overtimeId,
      'date': instance.date.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration': instance.duration,
      'status': instance.status,
      'is_cancelled': instance.isCancelled,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

OvertimeType _$OvertimeTypeFromJson(Map<String, dynamic> json) => OvertimeType(
      id: json['id'] as int,
      type: json['type'] as String,
      code: json['code'] as String,
      applyBefore: json['apply_before'] as int,
      maxTime: json['max_time'] as int,
      minTime: json['min_time'] as int,
      overtimeRounding: json['overtime_rounding'] as int,
      overtimeRoundLimit: json['overtime_round_limit'] as int,
      deductTime: json['deduct_time'] as int,
      everyOvertimeAchieved: json['every_overtime_achieved'] as int,
      isActive: json['is_active'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OvertimeTypeToJson(OvertimeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code': instance.code,
      'apply_before': instance.applyBefore,
      'max_time': instance.maxTime,
      'min_time': instance.minTime,
      'overtime_rounding': instance.overtimeRounding,
      'overtime_round_limit': instance.overtimeRoundLimit,
      'deduct_time': instance.deductTime,
      'every_overtime_achieved': instance.everyOvertimeAchieved,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      employeeId: json['employee_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'],
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      mobileNo: json['mobile_no'] as String?,
      phoneExt: json['phone_ext'],
      photoUrl: json['photo_url'],
      isActive: json['is_active'] as int,
      shiftPatternId: json['shift_pattern_id'] as int,
      departmentId: json['department_id'] as int,
      positionId: json['position_id'] as int?,
      managerId: json['manager_id'] as int?,
      workLocationId: json['work_location_id'] as int?,
      employeeStatusId: json['employee_status_id'] as int?,
      attendanceLocationId: json['attendance_location_id'] as int?,
      joinDate: json['join_date'] == null
          ? null
          : DateTime.parse(json['join_date'] as String),
      terminationDate: json['termination_date'] == null
          ? null
          : DateTime.parse(json['termination_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isTerminated: json['is_terminated'] as int?,
      fcmToken: json['fcm_token'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
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
      'termination_date': instance.terminationDate?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_terminated': instance.isTerminated,
      'fcm_token': instance.fcmToken,
    };
