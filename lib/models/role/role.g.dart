// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as int,
      name: json['name'] as String,
      guardName: json['guard_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'guard_name': instance.guardName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'pivot': instance.pivot.toJson(),
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      modelId: json['model_id'] as int,
      roleId: json['role_id'] as int,
      modelType: json['model_type'] as String,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'model_id': instance.modelId,
      'role_id': instance.roleId,
      'model_type': instance.modelType,
    };
