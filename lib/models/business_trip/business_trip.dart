import 'package:json_annotation/json_annotation.dart';
import 'package:myezhr/models/business_trip/destination.dart';
import 'package:myezhr/models/converter.dart';
part 'business_trip.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BusinessTrip {
  BusinessTrip({
    this.id,
    this.userId,
    this.approverId,
    this.type,
    this.remarks,
    this.attachmentPath,
    this.status,
    this.isCancelled,
    this.cancellationReason,
    this.destinations,
    this.createdAt,
  });

  int? id;
  int? userId;
  int? approverId;
  String? type;
  String? remarks;
  String? attachmentPath;
  String? status;
  @BoolConverter()
  bool? isCancelled;
  String? cancellationReason;
  List<Destination>? destinations;
  DateTime? createdAt;

  factory BusinessTrip.fromJson(Map<String, dynamic> json) =>
      _$BusinessTripFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTripToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BusinessTripRes {
  bool? success;
  int? count;
  BusinessTrip? data;
  List<String>? message;

  BusinessTripRes({
    this.success,
    this.count,
    this.data,
    this.message,
  });

  factory BusinessTripRes.fromJson(Map<String, dynamic> json) =>
      _$BusinessTripResFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTripResToJson(this);
}
