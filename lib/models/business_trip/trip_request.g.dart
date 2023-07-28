// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripRequest _$TripRequestFromJson(Map<String, dynamic> json) => TripRequest(
      overtimeTypeId: json['overtime_type_id'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      status: json['status'] as String?,
      remarks: json['remarks'] as String?,
      file: json['file'] as String?,
    )..destinations = (json['destinations'] as List<dynamic>?)
        ?.map((e) => Destination.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$TripRequestToJson(TripRequest instance) =>
    <String, dynamic>{
      'overtime_type_id': instance.overtimeTypeId,
      'start_date': instance.startDate,
      'status': instance.status,
      'end_date': instance.endDate,
      'remarks': instance.remarks,
      'file': instance.file,
      'destinations': instance.destinations?.map((e) => e.toJson()).toList(),
    };
