import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';
part 'overtime_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OvertimeRequest {
  OvertimeRequest({
    this.overtimeTypeId,
    this.startDate,
    this.endDate,
    this.status,
    this.remarks,
    this.file,
    this.details,
  });

  String? overtimeTypeId;
  String? startDate;
  String? status;
  String? endDate;
  String? remarks;
  String? file;
  List<OvertimeDetail>? details;

  factory OvertimeRequest.fromJson(Map<String, dynamic> json) =>
      _$OvertimeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeRequestToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OvertimeDetail {
  OvertimeDetail({
    this.startTime,
    this.endTime,
    this.date,
  });

  @TimeOfDayConverter()
  Rx<TimeOfDay>? startTime;
  @TimeOfDayConverter()
  Rx<TimeOfDay>? endTime;
  String? date;

  factory OvertimeDetail.fromJson(Map<String, dynamic> json) =>
      _$OvertimeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeDetailToJson(this);
}

class TimeOfDayConverter extends JsonConverter<Rx<TimeOfDay>, String> {
  const TimeOfDayConverter();

  @override
  Rx<TimeOfDay> fromJson(String json) {
    return TimeOfDay.fromDateTime(DateTime.parse(json)).obs;
  }

  @override
  String toJson(Rx<TimeOfDay> object) =>
      "${object.value.hour.toString().padLeft(2, '0')}:${object.value.minute.toString().padLeft(2, '0')}:00";
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OvertimeRequestModel {
  OvertimeRequestModel({
    required this.success,
    required this.message,
  });

  bool success;
  List<String> message;

  factory OvertimeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OvertimeRequestModelToJson(this);
}
