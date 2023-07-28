// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeRequest _$OvertimeRequestFromJson(Map<String, dynamic> json) =>
    OvertimeRequest(
      overtimeTypeId: json['overtime_type_id'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      status: json['status'] as String?,
      remarks: json['remarks'] as String?,
      file: json['file'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => OvertimeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OvertimeRequestToJson(OvertimeRequest instance) =>
    <String, dynamic>{
      'overtime_type_id': instance.overtimeTypeId,
      'start_date': instance.startDate,
      'status': instance.status,
      'end_date': instance.endDate,
      'remarks': instance.remarks,
      'file': instance.file,
      'details': instance.details?.map((e) => e.toJson()).toList(),
    };

OvertimeDetail _$OvertimeDetailFromJson(Map<String, dynamic> json) =>
    OvertimeDetail(
      startTime: _$JsonConverterFromJson<String, Rx<TimeOfDay>>(
          json['start_time'], const TimeOfDayConverter().fromJson),
      endTime: _$JsonConverterFromJson<String, Rx<TimeOfDay>>(
          json['end_time'], const TimeOfDayConverter().fromJson),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$OvertimeDetailToJson(OvertimeDetail instance) =>
    <String, dynamic>{
      'start_time': _$JsonConverterToJson<String, Rx<TimeOfDay>>(
          instance.startTime, const TimeOfDayConverter().toJson),
      'end_time': _$JsonConverterToJson<String, Rx<TimeOfDay>>(
          instance.endTime, const TimeOfDayConverter().toJson),
      'date': instance.date,
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

OvertimeRequestModel _$OvertimeRequestModelFromJson(
        Map<String, dynamic> json) =>
    OvertimeRequestModel(
      success: json['success'] as bool,
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OvertimeRequestModelToJson(
        OvertimeRequestModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
