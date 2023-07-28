// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimType _$ClaimTypeFromJson(Map<String, dynamic> json) => ClaimType(
      id: json['id'] as int,
      claimCategoryId: json['claim_category_id'] as int,
      code: json['code'] as String,
      type: json['type'] as String,
      limitAmount: json['limit_amount'] as num,
      limitType: json['limit_type'] as String,
      isActive: json['is_active'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      displayLimit: json['display_limit'] as num,
      used: json['used'] as num,
      balance: json['balance'] as num,
      pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimTypeToJson(ClaimType instance) => <String, dynamic>{
      'id': instance.id,
      'claim_category_id': instance.claimCategoryId,
      'code': instance.code,
      'type': instance.type,
      'limit_amount': instance.limitAmount,
      'limit_type': instance.limitType,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'display_limit': instance.displayLimit,
      'used': instance.used,
      'balance': instance.balance,
      'pivot': instance.pivot.toJson(),
      'category': instance.category.toJson(),
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      userId: json['user_id'] as int,
      claimTypeId: json['claim_type_id'] as int,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'user_id': instance.userId,
      'claim_type_id': instance.claimTypeId,
    };
