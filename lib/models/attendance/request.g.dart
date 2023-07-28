// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRequest _$AttendanceRequestFromJson(Map<String, dynamic> json) =>
    AttendanceRequest(
      shiftDailyId: json['shift_daily_id'] as String,
      type: json['type'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      latLong: json['lat_long'] as String,
      file: json['file'] as String,
    );

Map<String, dynamic> _$AttendanceRequestToJson(AttendanceRequest instance) {
  final val = <String, dynamic>{
    'shift_daily_id': instance.shiftDailyId,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_time', instance.startTime);
  writeNotNull('end_time', instance.endTime);
  val['lat_long'] = instance.latLong;
  val['file'] = instance.file;
  return val;
}

AttendanceRes _$AttendanceResFromJson(Map<String, dynamic> json) =>
    AttendanceRes(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$AttendanceResToJson(AttendanceRes instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      shiftDailyId: json['shift_daily_id'] as String,
      type: json['type'] as String,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      userId: json['user_id'] as int,
      status: json['status'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'shift_daily_id': instance.shiftDailyId,
      'type': instance.type,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'user_id': instance.userId,
      'status': instance.status,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };

AttendanceCorrectionRequest _$AttendanceCorrectionRequestFromJson(
        Map<String, dynamic> json) =>
    AttendanceCorrectionRequest(
      userId: json['user_id'] as String?,
      shiftDailyId: json['shift_daily_id'] as String?,
      date: json['date'] as String?,
      newStartTime: json['new_start_time'] as String?,
      newEndTime: json['new_end_time'] as String?,
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AttendanceCorrectionRequestToJson(
    AttendanceCorrectionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('shift_daily_id', instance.shiftDailyId);
  writeNotNull('date', instance.date);
  writeNotNull('new_start_time', instance.newStartTime);
  writeNotNull('new_end_time', instance.newEndTime);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('status', instance.status);
  return val;
}

AttendanceCorrectionRes _$AttendanceCorrectionResFromJson(
        Map<String, dynamic> json) =>
    AttendanceCorrectionRes(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: json['data'] == null
          ? null
          : Data3.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$AttendanceCorrectionResToJson(
        AttendanceCorrectionRes instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };

Data3 _$Data3FromJson(Map<String, dynamic> json) => Data3(
      userId: json['user_id'],
      shiftDailyId: json['shift_daily_id'],
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      newStartTime: json['new_start_time'] as String?,
      newEndTime: json['new_end_time'] as String?,
      remarks: json['remarks'] as String?,
      requestorId: json['requestor_id'] as int?,
      attendanceId: json['attendance_id'] as int?,
      prevStartTime: json['prev_start_time'] as String?,
      prevEndTime: json['prev_end_time'] as String?,
      status: json['status'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'],
    )..approverId = json['approver_id'] as int?;

Map<String, dynamic> _$Data3ToJson(Data3 instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'requestor_id': instance.requestorId,
      'attendance_id': instance.attendanceId,
      'shift_daily_id': instance.shiftDailyId,
      'date': instance.date?.toIso8601String(),
      'prev_start_time': instance.prevStartTime,
      'prev_end_time': instance.prevEndTime,
      'new_start_time': instance.newStartTime,
      'new_end_time': instance.newEndTime,
      'remarks': instance.remarks,
      'status': instance.status,
      'approver_id': instance.approverId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
