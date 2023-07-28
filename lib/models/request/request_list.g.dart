// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestList _$RequestListFromJson(Map<String, dynamic> json) => RequestList(
      user: json['user'] as String,
      userId: json['user_id'] as int,
      position: json['position'] as String,
      id: json['id'] as int,
      label: json['label'] as String?,
      type: json['type'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      applyDate: json['apply_date'] == null
          ? null
          : DateTime.parse(json['apply_date'] as String),
      remarks: json['remarks'] as String?,
      status: json['status'] as String?,
      url: json['url'] as String?,
      prevStartTime: json['prev_start_time'] as String?,
      prevEndTime: json['prev_end_time'] as String?,
      newStartTime: json['new_start_time'] as String?,
      newEndTime: json['new_end_time'] as String?,
    );

Map<String, dynamic> _$RequestListToJson(RequestList instance) =>
    <String, dynamic>{
      'user': instance.user,
      'user_id': instance.userId,
      'position': instance.position,
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'apply_date': instance.applyDate?.toIso8601String(),
      'remarks': instance.remarks,
      'status': instance.status,
      'url': instance.url,
      'prev_start_time': instance.prevStartTime,
      'prev_end_time': instance.prevEndTime,
      'new_start_time': instance.newStartTime,
      'new_end_time': instance.newEndTime,
    };
