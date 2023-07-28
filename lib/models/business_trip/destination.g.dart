// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      uuid: json['uuid'] as String?,
      id: json['id'] as int?,
      businessTripId: json['business_trip_id'] as int?,
      destination: _$JsonConverterFromJson<String, TextEditingController>(
          json['destination'], const TextEditConverter().fromJson),
      startDate: const RxDateComverter().fromJson(json['start_date']),
      endDate: const RxDateComverter().fromJson(json['end_date']),
    )..remarks = _$JsonConverterFromJson<String, TextEditingController>(
        json['remarks'], const TextEditConverter().fromJson);

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'business_trip_id': instance.businessTripId,
      'start_date': _$JsonConverterToJson<dynamic, Rx<DateTime>>(
          instance.startDate, const RxDateComverter().toJson),
      'end_date': _$JsonConverterToJson<dynamic, Rx<DateTime>>(
          instance.endDate, const RxDateComverter().toJson),
      'remarks': _$JsonConverterToJson<String, TextEditingController>(
          instance.remarks, const TextEditConverter().toJson),
      'destination': _$JsonConverterToJson<String, TextEditingController>(
          instance.destination, const TextEditConverter().toJson),
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
