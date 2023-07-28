// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPosition _$UserPositionFromJson(Map<String, dynamic> json) => UserPosition(
      id: json['id'] as int,
      departmentId: json['department_id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserPositionToJson(UserPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department_id': instance.departmentId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
