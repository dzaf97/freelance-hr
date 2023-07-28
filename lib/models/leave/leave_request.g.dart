// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) => LeaveRequest(
      leaveTypeId: json['leave_type_id'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      remarks: json['remarks'] as String?,
      file: json['file'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LeaveRequestToJson(LeaveRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('leave_type_id', instance.leaveTypeId);
  writeNotNull('start_date', instance.startDate);
  writeNotNull('end_date', instance.endDate);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('file', instance.file);
  writeNotNull('status', instance.status);
  return val;
}

LeaveReqModel _$LeaveReqModelFromJson(Map<String, dynamic> json) =>
    LeaveReqModel(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: json['data'] == null
          ? null
          : Datum3.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$LeaveReqModelToJson(LeaveReqModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };

Datum3 _$Datum3FromJson(Map<String, dynamic> json) => Datum3(
      leaveTypeId: json['leave_type_id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      remarks: json['remarks'] as String,
      userId: json['user_id'] as int,
      days: json['days'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$Datum3ToJson(Datum3 instance) => <String, dynamic>{
      'leave_type_id': instance.leaveTypeId,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'remarks': instance.remarks,
      'user_id': instance.userId,
      'days': instance.days,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
