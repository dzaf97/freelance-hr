// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceLocation _$AttendanceLocationFromJson(Map<String, dynamic> json) =>
    AttendanceLocation(
      id: json['id'] as int,
      code: json['code'] as String,
      location: json['location'] as String,
      address: json['address'] as String,
      maximumRadius: (json['maximum_radius'] as num).toDouble(),
      coordinate: json['coordinate'] as String,
      isActive: json['is_active'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AttendanceLocationToJson(AttendanceLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'location': instance.location,
      'address': instance.address,
      'maximum_radius': instance.maximumRadius,
      'coordinate': instance.coordinate,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
