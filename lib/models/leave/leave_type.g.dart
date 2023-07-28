// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => LeaveType(
      id: json['id'] as num?,
      type: json['type'] as String?,
      code: json['code'] as String?,
      daysEntitled: json['days_entitled'] as num?,
      daysCount: json['days_count'] as String?,
      applyBefore: json['apply_before'] as num?,
      dayType: json['day_type'] as String?,
      firstHalfCode: json['first_half_code'] as String?,
      secondHalfCode: json['second_half_code'] as String?,
      gracePeriod: json['grace_period'] as num?,
      additionalStatus: json['additional_status'],
      enableMinus: json['enable_minus'] as num?,
      applyToAll: json['apply_to_all'] as num?,
      isCarriedOver: json['is_carried_over'] as num?,
      carriedOverType: json['carried_over_type'] as String?,
      limitCarriedOver: json['limit_carried_over'] as num?,
      maxCarriedOver: json['max_carried_over'] as num?,
      carriedOverExpired: json['carried_over_expired'] as num?,
      attachDocument: json['attach_document'] as num?,
      isProrated: json['is_prorated'] as num?,
      isActive: json['is_active'] as num?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveTypeToJson(LeaveType instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code': instance.code,
      'days_entitled': instance.daysEntitled,
      'days_count': instance.daysCount,
      'apply_before': instance.applyBefore,
      'day_type': instance.dayType,
      'first_half_code': instance.firstHalfCode,
      'second_half_code': instance.secondHalfCode,
      'grace_period': instance.gracePeriod,
      'additional_status': instance.additionalStatus,
      'enable_minus': instance.enableMinus,
      'apply_to_all': instance.applyToAll,
      'is_carried_over': instance.isCarriedOver,
      'carried_over_type': instance.carriedOverType,
      'limit_carried_over': instance.limitCarriedOver,
      'max_carried_over': instance.maxCarriedOver,
      'carried_over_expired': instance.carriedOverExpired,
      'attach_document': instance.attachDocument,
      'is_prorated': instance.isProrated,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pivot': instance.pivot?.toJson(),
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      userId: json['user_id'] as num?,
      leaveTypeId: json['leave_type_id'] as num?,
      startValidDate: json['start_valid_date'] == null
          ? null
          : DateTime.parse(json['start_valid_date'] as String),
      endValidDate: json['end_valid_date'] == null
          ? null
          : DateTime.parse(json['end_valid_date'] as String),
      nextValidDate: json['next_valid_date'] == null
          ? null
          : DateTime.parse(json['next_valid_date'] as String),
      entitled: json['entitled'] as num?,
      proportional: json['proportional'],
      bringFoward: json['bring_foward'] as num?,
      forfeited: json['forfeited'],
      adjustment: json['adjustment'],
      used: json['used'],
      remaining: json['remaining'] as num?,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'user_id': instance.userId,
      'leave_type_id': instance.leaveTypeId,
      'start_valid_date': instance.startValidDate?.toIso8601String(),
      'end_valid_date': instance.endValidDate?.toIso8601String(),
      'next_valid_date': instance.nextValidDate?.toIso8601String(),
      'entitled': instance.entitled,
      'proportional': instance.proportional,
      'bring_foward': instance.bringFoward,
      'forfeited': instance.forfeited,
      'adjustment': instance.adjustment,
      'used': instance.used,
      'remaining': instance.remaining,
    };
