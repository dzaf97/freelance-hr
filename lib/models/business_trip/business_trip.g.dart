// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessTrip _$BusinessTripFromJson(Map<String, dynamic> json) => BusinessTrip(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      approverId: json['approver_id'] as int?,
      type: json['type'] as String?,
      remarks: json['remarks'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      status: json['status'] as String?,
      isCancelled: _$JsonConverterFromJson<int, bool>(
          json['is_cancelled'], const BoolConverter().fromJson),
      cancellationReason: json['cancellation_reason'] as String?,
      destinations: (json['destinations'] as List<dynamic>?)
          ?.map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BusinessTripToJson(BusinessTrip instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'approver_id': instance.approverId,
      'type': instance.type,
      'remarks': instance.remarks,
      'attachment_path': instance.attachmentPath,
      'status': instance.status,
      'is_cancelled': _$JsonConverterToJson<int, bool>(
          instance.isCancelled, const BoolConverter().toJson),
      'cancellation_reason': instance.cancellationReason,
      'destinations': instance.destinations?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

BusinessTripRes _$BusinessTripResFromJson(Map<String, dynamic> json) =>
    BusinessTripRes(
      success: json['success'] as bool?,
      count: json['count'] as int?,
      data: json['data'] == null
          ? null
          : BusinessTrip.fromJson(json['data'] as Map<String, dynamic>),
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BusinessTripResToJson(BusinessTripRes instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data?.toJson(),
      'message': instance.message,
    };
