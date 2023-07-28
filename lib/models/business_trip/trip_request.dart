import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/business_trip/destination.dart';

part 'trip_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TripRequest {
  TripRequest({
    this.overtimeTypeId,
    this.startDate,
    this.endDate,
    this.status,
    this.remarks,
    this.file,
  });

  String? overtimeTypeId;
  String? startDate;
  String? status;
  String? endDate;
  String? remarks;
  String? file;
  List<Destination>? destinations;

  factory TripRequest.fromJson(Map<String, dynamic> json) =>
      _$TripRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TripRequestToJson(this);
}
