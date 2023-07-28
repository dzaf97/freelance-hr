// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave(
      success: json['success'] as bool?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      leaveTypeId: json['leave_type_id'] as int?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      days: (json['days'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      status: json['status'] as String?,
      halfDay: json['half_day'] as int?,
      approvalRemarks: json['approval_remarks'] as String?,
      approverId: json['approver_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      leaveType: json['leave_type'] == null
          ? null
          : LeaveType.fromJson(json['leave_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'id': instance.id,
      'user_id': instance.userId,
      'leave_type_id': instance.leaveTypeId,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'days': instance.days,
      'remarks': instance.remarks,
      'attachment_path': instance.attachmentPath,
      'status': instance.status,
      'half_day': instance.halfDay,
      'approval_remarks': instance.approvalRemarks,
      'approver_id': instance.approverId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'leave_type': instance.leaveType?.toJson(),
    };
