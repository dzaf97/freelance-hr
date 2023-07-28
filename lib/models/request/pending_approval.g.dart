// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingApproval _$PendingApprovalFromJson(Map<String, dynamic> json) =>
    PendingApproval(
      user: json['user'] as String,
      userId: json['user_id'] as int,
      position: json['position'] as String,
      id: json['id'] as int,
      label: json['label'] as String,
      type: json['type'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      applyDate: DateTime.parse(json['apply_date'] as String),
      remarks: json['remarks'] as String?,
      status: json['status'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PendingApprovalToJson(PendingApproval instance) =>
    <String, dynamic>{
      'user': instance.user,
      'user_id': instance.userId,
      'position': instance.position,
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'apply_date': instance.applyDate.toIso8601String(),
      'remarks': instance.remarks,
      'status': instance.status,
      'url': instance.url,
    };
