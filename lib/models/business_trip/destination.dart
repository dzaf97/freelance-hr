import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/converter.dart';
part 'destination.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Destination {
  Destination({
    this.uuid,
    this.id,
    this.businessTripId,
    this.destination,
    this.startDate,
    this.endDate,
  });

  String? uuid;
  int? id;
  int? businessTripId;
  @RxDateComverter()
  Rx<DateTime>? startDate;
  @RxDateComverter()
  Rx<DateTime>? endDate;
  @TextEditConverter()
  TextEditingController? remarks;
  @TextEditConverter()
  TextEditingController? destination;
  @JsonKey(ignore: true)
  Rx<DateTimeRange>? selectedDate;

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
